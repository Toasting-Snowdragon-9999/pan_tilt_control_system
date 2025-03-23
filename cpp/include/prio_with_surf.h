#ifndef PRIO_WITH_SURF_H
#define PRIO_WITH_SURF_H

#include <opencv2/xfeatures2d/cuda.hpp>
#include "priority_vision.h"

class SurfFeatureTracking : PrioVision{
    public: 
        /**
         * @brief This method will construct the SurfFeatureTracking object and call both PrioVision and Vision constructors
         * @param none Type: void -
         * @return Type: void - 
         */
        SurfFeatureTracking();
        /**
         * @brief This method will deconstruct the SurfFeatureTracking object doesnt call any other deconstructors
         * @param none Type: void -
         * @return Type: void - 
         */
        ~SurfFeatureTracking();
        /**
         * @brief This method will optimize the color tracking by using the SURF algorithm to correct the square around the object
         * @param none Type: void -
         * @return Type: void - 
         */
        void tracking(int cam) override;

    protected:
        cv::Ptr<cv::cuda::SURF_CUDA> _surf;
        /**
         * @brief This method will find the features in the image
         * @param none Type: void -
         * @return Type: void -
         */
        void find_features();
        /**
         * @brief This method will draw the features in the image
         * @param none Type: void -
         * @return Type: void -
         */
        void draw_features();

};



#endif

