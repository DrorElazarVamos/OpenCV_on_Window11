#include <opencv2/opencv.hpp>
#include <opencv2/core.hpp>
#include <iostream>

inline static void status_opencv() {
    std::cout << "OpenCV version: " << CV_VERSION << std::endl;
    std::cout << "g++ version: " << __GNUC__ << "." << __GNUC_MINOR__ << "." << __GNUC_PATCHLEVEL__ << std::endl;
    std::cout << "cmake version: " << CMAKE_BUILD_VERSION  << std::endl;
};


int main() {
    status_opencv();
    
    cv::Mat img = cv::imread("Enter an image path");
    if (img.empty()) {
        std::cerr << "Could not load image." << std::endl;
        return 1;
    }

    cv::imshow("Image", img);
    cv::waitKey(0);
    return 0;
}
