#ifndef PRIORITY_VISION_H
#define PRIORITY_VISION_H

#include <optional>
#include <chrono>
#include <thread>

#include <fstream>
#include <iostream>
#include <iomanip>
#include <chrono>
#include <ctime>

#include "vision.h"

#define MAX_PRIOS 1
#define PAN_TICK_TO_DEGREE 10.39395388
#define TILT_TICK_TO_DEGREE 10.50985048

enum class Priority {
    LOW = 0,
    MEDIUM = 1,  
    HIGH = 2
};

struct ColorThreshold {
    std::vector<cv::Scalar> values;
    Priority priority;
    std::vector<std::vector<cv::Point>> contours;
    double min_area;
};


class PrioVision : public Vision {
    public:
        PrioVision();
        ~PrioVision();
        void tracking (Uart& uart) override;
        void log_error(two_dim::tracking_offset& offset);

    protected: 
        std::vector<ColorThreshold> _thresholds;
        
        void _priorities();
        void _set_priority(bool run_calibration);
        std::optional<std::reference_wrapper<ColorThreshold>> 
        find_highest_priority_threshold(std::vector<ColorThreshold>& thresholds);
        void _prio_calibration(); 

};   

#endif