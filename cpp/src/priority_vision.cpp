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

    // UartReader ur(uart);
    // ur.start();
    for (EVER) { 
        // To adjust sampling rate
        auto now = chrone_time::now();
        if (now < next_frame_time) {
            std::this_thread::sleep_for(next_frame_time - now);
        }
        next_frame_time += frame_interval;
        auto now_after_sleep = chrone_time::now();
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
        } 
        else {}
        
        _calculate_offset(offset);
        
        // Converte to motor degrees
        int8_t pan_error =  offset.x_offset / PAN_TICK_TO_DEGREE;
        int8_t tilt_error = offset.y_offset / TILT_TICK_TO_DEGREE;

        std::cout << "Encoded: pan: " << static_cast<int>(pan_error)
        << " tilt: " << static_cast<int>(tilt_error) << std::endl;
        
        uart.speak(reinterpret_cast<const uint8_t*>(&pan_error), 1);
        uart.speak(reinterpret_cast<const uint8_t*>(&tilt_error), 1); 

        cv::imshow("GPU Accelerated", _image);
        auto last = chrone_time::now();
        auto elapsed = last - now;
        double elapsed_seconds = std::chrono::duration<double>(elapsed).count();
        if (elapsed_seconds > 0.0) {  // avoid division by zero
            double frequency_hz = 1.0 / elapsed_seconds;
            std::cout << "Actual sampling frequency: " << frequency_hz << " Hz" << std::endl;
        }

        // log_error(offset);
        if (cv::waitKey(1) == 'q') {
            // ur.stop();
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

// void PrioVision::log_error(two_dim::tracking_offset& offset) {
//     // Open log file in append mode
//     std::ofstream log_file("error_log.txt", std::ios::app);
//     if (!log_file.is_open()) {
//         std::cerr << "Failed to open log file!" << std::endl;
//         return;
//     }

//     // Get current system time
//     auto now = std::chrono::system_clock::now();
//     std::time_t now_c = std::chrono::system_clock::to_time_t(now);

//     // Write timestamp and offset values
//     log_file << std::put_time(std::localtime(&now_c), "%Y-%m-%d %H:%M:%S")
//     << " | x_offset: " << offset.x_offset / PAN_TICK_TO_DEGREE 
//     << " y_offset: " << offset.y_offset / TILT_TICK_TO_DEGREE << std::endl;

//     log_file.close(); // optional, automatically closes when out of scope
// }
