#include "priority_vision.h"

PrioVision::PrioVision() : Vision() {

}

PrioVision::~PrioVision(){

}

std::optional<std::reference_wrapper<ColorThreshold>> 
PrioVision::find_highest_priority_threshold(std::vector<ColorThreshold>& thresholds) {
    std::optional<std::reference_wrapper<ColorThreshold>> best_threshold;

    for (auto& threshold : thresholds) {
        for (const auto& contour : threshold.contours) {
            if (cv::contourArea(contour) > 200) {  // Check contour area
                if (!best_threshold || static_cast<int>(threshold.priority) > static_cast<int>(best_threshold->get().priority)) {
                    best_threshold = threshold;  // Store reference
                }
            }
        }
    }

    return best_threshold; // Returns either a reference or empty optional
}

void PrioVision::tracking(Uart& uart) {
    int radius = 1;
    two_dim::tracking_offset offset;
    bool run_calibration = true;
    _set_priority(run_calibration);

    cv::VideoCapture cap(CAMERA_IN_USE);
    // cap.set(cv::CAP_PROP_FRAME_WIDTH, 1920);     // Makes it very slow
    // cap.set(cv::CAP_PROP_FRAME_HEIGHT, 1080);    // Makes it very slow
    // cap.set(cv::CAP_PROP_FPS, 30);               // max 30

    // double fps = cap.get(cv::CAP_PROP_FPS);             // 800  2.4 times smaller than the actual value
    // double width = cap.get(cv::CAP_PROP_FRAME_WIDTH);   // 448  2.41 times smaller than the actual value
    // double height = cap.get(cv::CAP_PROP_FRAME_HEIGHT); // 30
    std::this_thread::sleep_for(std::chrono::seconds(2));
    if (!cap.isOpened()) {
        std::cerr << "Error: Could not open camera!" << std::endl;
        return;
    }
    cv::namedWindow("GPU Accelerated", cv::WINDOW_AUTOSIZE);

    auto next_frame_time = chrone_time::now();
    auto frame_interval = std::chrono::duration_cast<std::chrono::milliseconds>(
        std::chrono::duration<double>(1.0 / SAMPLING_FREQ));

    UartReader ur(uart);
    ur.start();

    for (;;) { 
        // To adjust sampling rate
        auto now = chrone_time::now();
        if (now < next_frame_time) {
            //std::cout << "Waiting for next frame..." << std::endl;
            std::this_thread::sleep_for(next_frame_time - now);
        }
        next_frame_time += frame_interval;

        cap >> _image;         
        if (_image.empty()) {
            std::cerr << "Error: Empty frame!" << std::endl;
            break;
        }

        std::vector <int> size = {_image.cols, _image.rows, radius};
        _draw_center_dot(_image,  size);
        
        _mark_cornors(_image);

        _gpu_frame.upload(_image);

        for(int i = 0; i < MAX_PRIOS; i++){
            _greyscale_image(_gpu_frame, _thresholds[i].values);
            _gaussian_blur(_grey);
            _blurred.download(_blurred_cpu);        // find the contours for each color
            _find_contours(_contours, _blurred_cpu);
            _thresholds[i].contours = _contours;
        }


        
        auto best = find_highest_priority_threshold(_thresholds);
        if (best) {
            _draw_rect(_image, best->get().contours, best->get().min_area);
        } else {
            std::cout << "No valid threshold found." << std::endl;
        }
        
        _calculate_offset(offset);
        
        //std::cout << "Offset: " << offset.x_offset << " " << offset.y_offset << std::endl;
   
        uint16_t x_encoded = static_cast<uint16_t>(offset.x_offset) + 400;  // Range: 0–800
        uint16_t y_encoded = static_cast<uint16_t>(offset.y_offset) + 224;  // Range: 0–448
        
        std::cout << "Encoded: " << x_encoded << " " << y_encoded << std::endl;

        uint8_t x_off[2];
        // memcpy(&x_off[0], "x", sizeof(uint8_t));
        memcpy(&x_off[0], &x_encoded, sizeof(uint16_t));

        uint8_t y_off[3];
        memcpy(&y_off[0], "y", sizeof(uint8_t));
        memcpy(&y_off[1], &y_encoded, sizeof(uint16_t));

        uart.speak(x_off, 2);   
 
        cv::imshow("GPU Accelerated", _image);
        
        if (cv::waitKey(1) >= 0) {
            ur.stop();
            break;
        }
    }
}

void PrioVision::_set_priority(bool run_calibration) {
    if (run_calibration) {
        _prio_calibration();
    }
    else{
        ColorThreshold red;
        red.values = hsv::predefines_red(); 
        red.priority = Priority::LOW;
        red.min_area = 400.0;
        _thresholds.push_back(red);
    
        ColorThreshold blue;
        blue.values = hsv::predefines_blue();
        blue.priority = Priority::MEDIUM;
        blue.min_area = 400.0;
        _thresholds.push_back(blue);
    }
}

void PrioVision::_prio_calibration() {
    std::cout << "Calibration" << std::endl;
    _thresholds.resize(MAX_PRIOS);
    for(int i = 0; i < MAX_PRIOS; i++){
        _calibration(_thresholds[i].values);
        _thresholds[i].priority = static_cast<Priority>(MAX_PRIOS - i);     // starting from the highest priority
        std::this_thread::sleep_for(std::chrono::seconds(2));  // Sleep for 1 second
    }
    std::cout << "Calibration completed" << std::endl;
    std::cout << "Thresholds: " << std::endl;
    std::cout << "Red: " << _thresholds[0].values[0] << " " << _thresholds[0].values[1] << std::endl;
    
}
