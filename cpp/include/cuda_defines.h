#ifndef CUDA_DEFINES_H
#define CUDA_DEFINES_H

namespace hsv {
    enum Colors {    
        /*
        Image from iphone 
        from python script converter:
        OpenCV HSV dark: (26.5, 255.0, 109.64999999999999)
        OpenCV HSV light: (28.5, 198.9, 247.35)
        */
        itennis_dark_hue = 26,
        itennis_dark_sat = 198,
        itennis_dark_val = 109,

        itennis_light_hue = 28,
        itennis_light_sat = 255,
        itennis_light_val = 255, 
        /*
        Image from webcame 
        from python script converter:
        OpenCV HSV dark: (46.0, 51.0, 175.95)
        OpenCV HSV light: (32.5, 25.5, 232.05)
        */
        wtennis_dark_hue = 46,
        wtennis_dark_sat = 51,
        wtennis_dark_val = 225,

        wtennis_light_hue = 35,
        wtennis_light_sat = 25,
        wtennis_light_val = 175,
    };

    inline std::vector<cv::Scalar> predefines_red(){
        std::vector<cv::Scalar> thresholds;
        cv::Scalar lower_bound(150, 100, 120);  // Lower HSV threshold
        cv::Scalar upper_bound(175, 255, 220);  // Upper HSV threshold
        thresholds.push_back(lower_bound);
        thresholds.push_back(upper_bound);
        return thresholds;
    }
    inline std::vector<cv::Scalar> predefines_blue(){
        std::vector<cv::Scalar> thresholds;
        cv::Scalar lower_bound(75, 21, 98);   // Lower HSV threshold
        cv::Scalar upper_bound(111, 116, 242); // Upper HSV threshold
        
        thresholds.push_back(lower_bound);
        thresholds.push_back(upper_bound);
        return thresholds;
    }

    inline std::vector<cv::Scalar> predefines_yellow(){
        std::vector<cv::Scalar> thresholds;
        cv::Scalar lower_bound(11, 21, 95);    // Lower HSV threshold
        cv::Scalar upper_bound(37, 180, 255);  // Upper HSV threshold
        
        thresholds.push_back(lower_bound);
        thresholds.push_back(upper_bound);
        return thresholds;
    }

}

namespace brg {
    enum Colors {
        baby_pink_blue = 205,
        baby_pink_green = 150,
        baby_pink_red = 255,
    };
}

namespace two_dim {
    struct points{
        float x;
        float y;
    };

    struct sizes{
        float width;
        float height;
    };

    struct tracking_offset{
        float x_offset;
        float y_offset;
        float angle;
        float distance;
    };
}

#endif
