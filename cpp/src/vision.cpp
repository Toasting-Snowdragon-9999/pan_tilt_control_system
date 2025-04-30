#include "vision.h"

#define COLORSPACE cv::COLOR_BGR2Lab

Vision::Vision() {
    _region_of_interest = cv::Rect(0, 0, 0, 0);
    std::cout << "Vision object created" << std::endl;
}

Vision::~Vision() {
    std::cout << "Vision object destroyed" << std::endl;
}

void Vision::load_image(const std::string& file_name) 
{
    _image = cv::imread(file_name); 
    if (_image.empty()) {
        std::cerr << "Error: Could not open or find the image!" << std::endl;
    }
}

void Vision::display_image(const cv::Mat& image)
{
    cv::namedWindow("Display Image", cv::WINDOW_AUTOSIZE);
    cv::imshow("Display Image", image);
    cv::waitKey(0);
}

bool Vision::save_image(const cv::Mat& image, const std::string& filename) 
{
    if (image.empty()) {
        std::cerr << "Error: Empty image, nothing to save!" << std::endl;
        return false;
    }
    
    bool success = cv::imwrite(filename, image);
    
    if (success) {
        std::cout << "Image saved successfully to " << filename << std::endl;
    } else {
        std::cerr << "Error: Could not save image to " << filename << std::endl;
    }
    
    return success;
}

void Vision::tracking(Uart& uart) {
    bool enable_calibration = true;    
    int radius = 1;
    two_dim::tracking_offset offset;
    std::vector<cv::Scalar> threshholds = _get_thresholds(enable_calibration);
    std::cout << "thresholds: " << threshholds[0] << " " << threshholds[1] << std::endl;

    cv::VideoCapture cap(CAMERA_IN_USE);

    if (!cap.isOpened()) {
        std::cerr << "Error: Could not open camera!" << std::endl;
        return;
    }
    cv::namedWindow("GPU Accelerated", cv::WINDOW_AUTOSIZE);
    
    for (;;) { 
        // infinite loop
        cap >> _image;         
        if (_image.empty()) {
            std::cerr << "Error: Empty frame!" << std::endl;
            break;
        }

        std::vector <int> size = {_image.cols, _image.rows, radius};
        _draw_center_dot(_image, size);
        
        _mark_cornors(_image);

        _gpu_frame.upload(_image);

        _greyscale_image(_gpu_frame, threshholds);

        _gaussian_blur(_grey);

        _blurred.download(_blurred_cpu);

        _find_contours(_contours, _blurred_cpu);
    
        _draw_rect(_image, _contours, _min_contour_area);

        _calculate_offset(offset);

        cv::imshow("GPU Accelerated", _image);
        
        if (cv::waitKey(1) >= 0) {
            break;
        }
    }

}


/*
These are the helper functions to make the complete tracking using OpenCV and CUDA.
*/

void Vision::_calculate_offset(two_dim::tracking_offset& output)
{
    output.x_offset = _center_image.x - _center_tracking.x;
    output.y_offset = _center_image.y - _center_tracking.y;

    output.distance = std::sqrt(output.x_offset * output.x_offset + output.y_offset * output.y_offset);
    
    output.angle = std::atan2(output.y_offset, output.x_offset) * 180.0 / CV_PI;

    // std::cout << "Offset: (" << output.x_offset << ", " << output.y_offset << ")" << std::endl;
    // std::cout << "Distance: " << output.distance << std::endl;
    // std::cout << "Angle: " << output.angle << std::endl;
}


std::vector<cv::Scalar> Vision::_get_thresholds(bool run_calibration)
{
    std::vector<cv::Scalar> thresholds;

    if(run_calibration){
        _calibration(thresholds);
    }
    else
    {

        std::vector<int> tolerane = {3, 15, 20, 0};
        cv::Scalar lower_bound(
            hsv::wtennis_light_hue - tolerane[0], 
            hsv::wtennis_light_sat - tolerane[3], 
            hsv::wtennis_light_val -  tolerane[2]);   // Lower HSV threshold
        
        cv::Scalar upper_bound(
            hsv::wtennis_dark_hue + tolerane[0], 
            hsv::wtennis_dark_sat + tolerane[2], 
            hsv::wtennis_dark_val - tolerane[3]); // Upper HSV threshold

        thresholds.push_back(lower_bound);
        thresholds.push_back(upper_bound);
        thresholds = hsv::predefines_yellow();
    }

    return thresholds;
}

void Vision::_greyscale_image(cv::cuda::GpuMat& src_host, std::vector<cv::Scalar>& cv_threshold)
{
    try
    {
        cv::cuda::cvtColor(src_host, _hsv, COLORSPACE); // e.g., cv::COLOR_BGR2HSV
        cv::cuda::inRange(_hsv, cv_threshold[0], cv_threshold[1], _grey);
        // Morphological operations on GPU
        // Dilate
        {
            cv::Ptr<cv::cuda::Filter> dilateFilter = cv::cuda::createMorphologyFilter(
                cv::MORPH_DILATE,
                _grey.type(),
                cv::Mat(),
                cv::Point(-1, -1),
                3
            );
            dilateFilter->apply(_grey, _grey);
        }
        // Erode
        {
            cv::Ptr<cv::cuda::Filter> erodeFilter = cv::cuda::createMorphologyFilter(
                cv::MORPH_ERODE,             // Operation
                _grey.type(),                // Type of the source & destination
                cv::Mat(),                   // Kernel (default 3x3 if empty)
                cv::Point(-1, -1),          // Anchor (center)
                3                           // Number of iterations
            );
            erodeFilter->apply(_grey, _grey);
        }
    }
    catch (const cv::Exception& ex)
    {
        std::cerr << "OpenCV error in image_processing: " << ex.what() << std::endl;
        _grey.release();
    }
}


void Vision::_gaussian_blur(const cv::cuda::GpuMat& d_src)
{
    try
    {
        cv::Ptr<cv::cuda::Filter> gaussFilter = cv::cuda::createGaussianFilter(
            d_src.type(),       // source type
            d_src.type(),       // destination type
            cv::Size(15, 15),   // kernel size
            0                   // sigmaX
            // (sigmaY defaults to 0 -> same as sigmaX)
        );

        gaussFilter->apply(d_src, _blurred);
    }
    catch (const cv::Exception& ex)
    {
        std::cerr << "OpenCV error in gaussian_blur: " << ex.what() << std::endl;
    }

}

void Vision::_find_contours(std::vector<std::vector<cv::Point>>& contours, const cv::Mat& mask){
    cv::findContours(mask, contours, cv::RETR_EXTERNAL, cv::CHAIN_APPROX_NONE);
}

void Vision::_draw_rect(cv::Mat& src_image, std::vector<std::vector<cv::Point>>& contours, double min_contour_area)
{
    double max_area = 0.0;
    int max_index = -1;

    // Keep these static so they persist between function calls
    
    static cv::Point old_center(_region_of_interest.x + _region_of_interest.width / 2,
                _region_of_interest.y + _region_of_interest.height / 2);

    for (size_t i = 0; i < contours.size(); i++){
        double area = cv::contourArea(contours[i]);
        if (area < min_contour_area) {
            continue;
        }
        if (area > max_area){
            max_area = area;
            max_index = static_cast<int>(i);
        } 
    }

    if (max_index >= 0){
        cv::Rect new_rect = cv::boundingRect(contours[max_index]);

        new_rect.x      = std::max(0, new_rect.x);
        new_rect.y      = std::max(0, new_rect.y);
        new_rect.width  = std::min(new_rect.width,  src_image.cols - new_rect.x);
        new_rect.height = std::min(new_rect.height, src_image.rows - new_rect.y);

        int center_x    = new_rect.x + new_rect.width / 2;
        int center_y    = new_rect.y + new_rect.height / 2;

        cv::Point new_center(center_x, center_y);

        if (_valid_center_diff(new_center, old_center, MAX_DEVIATION)){
            _region_of_interest = new_rect;
            old_center = new_center;
        }

        int thickness = 3;
        cv::rectangle(src_image,      
            _region_of_interest,
            cv::Scalar(brg::baby_pink_blue,
                        brg::baby_pink_green,
                        brg::baby_pink_red),
            thickness
        );

        cv::circle(src_image,
            old_center,
            1,                      // radius
            cv::Scalar(0, 0, 0),    // color: black
            cv::FILLED
        );

        _center_tracking.x = old_center.x;
        _center_tracking.y = old_center.y;
    }
}

bool Vision::_valid_center_diff(cv::Point& origin, cv::Point& old_center, int threshold){
    int x_diff = std::abs(origin.x - old_center.x);
    int y_diff = std::abs(origin.y - old_center.y);

    if (x_diff > threshold || y_diff > threshold){
        return true;
    }
    return false;

}

void Vision::_draw_center_dot(cv::Mat &src, std::vector<int> size){
    int center_x = size[0] / 2;
    int center_y = size[1] / 2;
    int center_r = size[2];
    _center_image.x = center_x;
    _center_image.y = center_y;

    cv::circle(
        src,
        cv::Point(center_x, center_y),
        center_r,                    
        cv::Scalar(0, 0, 0),     // BGR: black
        cv::FILLED               // thickness or FILLED to make it a solid dot
    );
}

void Vision::_draw_dot(cv::Mat &src, int x, int y, cv::Vec3b color){
    src.at<cv::Vec3b>(y, x) = color; // red pixel
}

void Vision::_mark_cornors(cv::Mat &src){
    cv::Vec3b blue(255, 0, 0);
    cv::Vec3b red(0, 0, 255);
    cv::Vec3b green(0, 255, 0);
    cv::Vec3b purple(255, 0, 255);


    int width = src.cols;
    int height = src.rows;
    for (int i = 0; i < 4; i++){
        for (int j = 0; j < 4; j++)
        {
            _draw_dot(src, 0 + i, 0 + j, blue);                     // top left
            _draw_dot(src, width - 1 - i, 0 + j, red);              // top right
            _draw_dot(src, 0 + i, height - 1 - j, green);           // bottom left
            _draw_dot(src, width - 1 - i, height - 1 - j, purple);  // bottom right
        }
    }

}



void Vision::_calibration(std::vector<cv::Scalar>& thresholds) {
    std::cout << "Calibration (LAB-based)" << std::endl;
    
    // Store average LAB values for MAX_CALIBRATION frames
    std::vector<cv::Vec3b> center_points(MAX_CALIBRATION);

    cv::VideoCapture cap(CAMERA_IN_USE);
    if (!cap.isOpened()) {
        std::cerr << "Error: Could not open camera!" << std::endl;
        return;
    }

    cv::namedWindow("Calibration", cv::WINDOW_AUTOSIZE);

    // Size of the region of interest around the center.
    // Adjust as needed to capture enough of the object.
    const int center_size = 30;

    int sample_index = 0;
    auto now = chrone_time::now();
    while (chrone_time::now() <= now + std::chrono::seconds(3)) {
        cap >> _image;
        if (_image.empty()) {
            std::cerr << "Error: Empty frame!" << std::endl;
            break;
        }

        int center_x = _image.cols / 2;
        int center_y = _image.rows / 2;

        // Convert to LAB color space. 
        // (Make sure COLORSPACE = cv::COLOR_BGR2Lab or change to that explicitly)
        cv::Mat lab_image;
        cv::cvtColor(_image, lab_image, COLORSPACE); //cv::COLOR_BGR2Lab

        // Define a small center around the center
        int center_left   = std::max(center_x - center_size / 2, 0);
        int center_top    = std::max(center_y - center_size / 2, 0);
        int center_width  = std::min(center_size, _image.cols - center_left);
        int center_height = std::min(center_size, _image.rows - center_top);

        cv::Rect center(center_left, center_top, center_width, center_height);

        // Draw the center and a small center indicator for visualization
        cv::rectangle(_image, center, cv::Scalar(0, 0, 255), 2);
        cv::circle(_image, cv::Point(center_x, center_y), 5, cv::Scalar(0, 0, 255), -1);

        cv::imshow("Calibration", _image);

        // Press any key to quit early
        if (cv::waitKey(1) >= 0) {
            break;
        }
    }


    while (true) {
        cap >> _image;
        if (_image.empty()) {
            std::cerr << "Error: Empty frame!" << std::endl;
            break;
        }

        int center_x = _image.cols / 2;
        int center_y = _image.rows / 2;

        // Convert to LAB color space. 
        // (Make sure COLORSPACE = cv::COLOR_BGR2Lab or change to that explicitly)
        cv::Mat lab_image;
        cv::cvtColor(_image, lab_image, COLORSPACE); //cv::COLOR_BGR2Lab

        // Define a small center around the center
        int center_left   = std::max(center_x - center_size / 2, 0);
        int center_top    = std::max(center_y - center_size / 2, 0);
        int center_width  = std::min(center_size, _image.cols - center_left);
        int center_height = std::min(center_size, _image.rows - center_top);

        cv::Rect center(center_left, center_top, center_width, center_height);
        cv::Mat center_lab = lab_image(center);

        cv::Scalar meanVal = cv::mean(center_lab);

        center_points[sample_index] = cv::Vec3b(
            static_cast<uchar>(meanVal[0]),
            static_cast<uchar>(meanVal[1]),
            static_cast<uchar>(meanVal[2])
        );

        // Draw the center and a small center indicator for visualization
        cv::rectangle(_image, center, cv::Scalar(0, 255, 0), 2);
        cv::circle(_image, cv::Point(center_x, center_y), 5, cv::Scalar(0, 255, 0), -1);

        cv::imshow("Calibration", _image);

        sample_index++;
        if (sample_index == MAX_CALIBRATION) {
            // Collected enough samples
            break;
        }

        // Press any key to quit early
        if (cv::waitKey(10) >= 0) {
            break;
        }
    }

    // Calculate min, max, and average across all samples
    double min_L = 255, min_a = 255, min_b = 255;
    double max_L = 0,   max_a = 0,   max_b = 0;
    double sum_L = 0,   sum_a = 0,   sum_b = 0;

    for (int i = 0; i < sample_index; i++) {
        uchar L = center_points[i][0];
        uchar A = center_points[i][1];
        uchar B = center_points[i][2];

        // Track min/max
        if (L < min_L) min_L = L;
        if (A < min_a) min_a = A;
        if (B < min_b) min_b = B;

        if (L > max_L) max_L = L;
        if (A > max_a) max_a = A;
        if (B > max_b) max_b = B;

        // Sum for average
        sum_L += L;
        sum_a += A;
        sum_b += B;
    }

    // Average
    double avg_L = sum_L / sample_index;
    double avg_a = sum_a / sample_index;
    double avg_b = sum_b / sample_index;

    // Define how large a margin you want around the average.
    // Adjust these values based on experimentation.
    std::vector<int> thresholds_values = {10, 20, 20}; // {L, a, b} margin

    //double lower_bound = std::max(0.0, std::min(255.0, avg_L - thresholds_values[0]));
    //double upper_bound = std::max(0.0, std::min(255.0, avg_L + thresholds_values[0]));
    cv::Scalar lower_bound(
        std::max(0.0, std::min(255.0, avg_L - thresholds_values[0])),
        std::max(0.0, std::min(255.0, avg_a - thresholds_values[1])),
        std::max(0.0, std::min(255.0, avg_b - thresholds_values[2]))
    );

    cv::Scalar upper_bound(
        std::max(0.0, std::min(255.0, avg_L + thresholds_values[0])),
        std::max(0.0, std::min(255.0, avg_a + thresholds_values[1])),
        std::max(0.0, std::min(255.0, avg_b + thresholds_values[2]))
    );

    // Print results
    std::cout << "Min LAB: (" << min_L << ", " << min_a << ", " << min_b << ")\n";
    std::cout << "Max LAB: (" << max_L << ", " << max_a << ", " << max_b << ")\n";
    std::cout << "Avg LAB: (" << avg_L << ", " << avg_a << ", " << avg_b << ")\n";
    std::cout << "Lower bound: " << lower_bound << std::endl;
    std::cout << "Upper bound: " << upper_bound << std::endl;

    // Push results to thresholds vector
    thresholds.push_back(lower_bound);
    thresholds.push_back(upper_bound);

    cv::destroyWindow("Calibration");
}
