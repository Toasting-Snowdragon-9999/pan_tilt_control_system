#ifndef VISION_H
#define VISION_H

#include <iostream>
#include <string>
#include <vector>
#include <opencv2/opencv.hpp>

#include <opencv2/core/cuda.hpp>
#include <opencv2/core/mat.hpp>
#include <opencv2/cudaimgproc.hpp>
#include <opencv2/cudaarithm.hpp>
#include <opencv2/cudafilters.hpp>

#include "cuda_defines.h"
#include "uart.h"

#define EXTERNAL_CAMERA 4
#define INTERNAL_CAMERA 0
#define CAMERA_IN_USE EXTERNAL_CAMERA
#define RESET 0
#define MAX_CALIBRATION 100
#define MAX_8_BIT 255
#define MAX_DEVIATION 7

class Vision {
    public:
        Vision();
        ~Vision();
        virtual void tracking(int cam);
        void load_image(const std::string& file_name);
        bool save_image(const cv::Mat& image, const std::string& filename);
        void display_image(const cv::Mat& image);
    
    protected:
        float _offset;
        two_dim::points _center_image;
        two_dim::points _center_tracking;
        cv::Rect _region_of_interest; // Region of interest

        cv::Mat _image, _blurred_cpu;
        cv::cuda::GpuMat _grey, _hsv, _blurred, _gpu_frame;

    
        virtual std::vector<cv::Scalar> _get_thresholds(bool run_calibration);
        void _greyscale_image(cv::cuda::GpuMat& src_host, std::vector<cv::Scalar>& cv_threshhold);
        void _gaussian_blur(const cv::cuda::GpuMat& d_src);
        void _draw_rect(cv::Mat& src_image, std::vector<std::vector<cv::Point>>& contours, double min_contour_area);
        void _draw_square(cv::Mat& src_image, std::vector<std::vector<cv::Point>>& contours, double min_contour_area);
        void _draw_center_dot(cv::Mat &src, std::vector<int> size);
        void _calculate_offset(two_dim::tracking_offset& output);
        void _draw_dot(cv::Mat &src, int x, int y, cv::Vec3b color);
        void _mark_cornors(cv::Mat &src);
        void _find_contours( std::vector<std::vector<cv::Point>>& contours, const cv::Mat& mask);
        std::vector<std::vector<cv::Point>> _contours;
        void _calibration(std::vector<cv::Scalar>& thresholds);
        bool _valid_center_diff(cv::Point& origin, cv::Point& old_center, int threshold);

    private: 
        double _min_contour_area = 400.0;

};

#endif // VISION_H