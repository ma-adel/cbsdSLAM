#if ! USE_OPENCV3
#include "arucodetectorcv2.h"

Mat arucoDetectorCV2::getIntrinsicParams() const
{
    return intrinsicParams;
}

void arucoDetectorCV2::setIntrinsicParams(const Mat &value)
{
    intrinsicParams = value;
}

Mat arucoDetectorCV2::getCurrentFrame() const
{
    return currentFrame;
}

void arucoDetectorCV2::printFrameInfo(Mat &frame){
    cout << "Frame Info: \n";
    cout << "dimensions: " << frame.rows << " x " << frame.cols << endl;
    cout << "Channels: " <<  frame.channels() << endl;
}

arucoDetectorCV2::arucoDetectorCV2(){
    kill = false;
    config();
}

arucoDetectorCV2::~arucoDetectorCV2(){}

void arucoDetectorCV2::config(){
    configFileName = "../config/config.yaml";
    intrinsicParams = Mat::zeros(3, 3, CV_32F);

    FileStorage fs;
    fs.open(configFileName, FileStorage::READ);
    if (!fs.isOpened()){
        cerr << "Failed to open " << configFileName << endl;
        cerr << "Proceeding with kinect rgb camera default values " << endl;
        intrinsicParams.at<float>(0,0) = 534.745346 ; // fx
        intrinsicParams.at<float>(0,1) = 0.0;
        intrinsicParams.at<float>(0,2) =  311.883701 ; // cx
        intrinsicParams.at<float>(1,0) = 0.0;
        intrinsicParams.at<float>(1,1) = 534.464055; // fy
        intrinsicParams.at<float>(1,2) =  255.480002; // cy
        intrinsicParams.at<float>(2,2) = 1;
        markerSize = 0.17; // meters
    }else{
        fs["cameraMatrix"] >> intrinsicParams;
        FileNode n = fs["Extra"];
        markerSize = (double)(n["markerSize"]);
        int tempDisp = (int)(n["display"]);
        displayImage = (bool)(tempDisp);
        cout << "Configuration file opened successfully " << endl;
        cout << intrinsicParams << endl;
    }
    fs.release();

    // Run fiducial markers detections using the default dictionary
    markerDetector.setDictionary(aruco::Dictionary::DICT_TYPES::ARUCO , 0);
}

void arucoDetectorCV2::setCurrentFrame(const Mat &frame){
    currentFrame = frame.clone();
    dispFrame = frame.clone();
}

void arucoDetectorCV2::getDetections(vector<double> &x, vector<double> &z, vector<int> &id){
    x = markerX;
    z = markerZ;
    id = ids;
}

void arucoDetectorCV2::detectMarkers(){
    Marker m;
    markerX.clear();
    markerX.shrink_to_fit();
    markerZ.clear();
    markerZ.shrink_to_fit();
    ids.clear();
    ids.shrink_to_fit();
    vector<aruco::Marker>detectedMarkers;
    detectedMarkers = markerDetector.detect(currentFrame);
    cout << "The number of detected markers: " << detectedMarkers.size() << endl;
    centers.resize(0, 2); // erase
    centers.resize(detectedMarkers.size(),2);

    Mat ippePoints = Mat(4,1, CV_32FC2, Scalar(0,0));
    for(int i = 0; i < detectedMarkers.size(); i++){ // loop for all markers
        //extract the id
        ids.push_back(detectedMarkers[i].id);
        // extract the center
        centers(i,0) = (detectedMarkers[i].getCenter().x);
        centers(i,1) = (detectedMarkers[i].getCenter().y);
        // extract the corners
        Point2f corner0, corner1, corner2, corner3;
        corner0 = Point2f(detectedMarkers[i][0].x, detectedMarkers[i][0].y);
        corner1 = Point2f(detectedMarkers[i][1].x, detectedMarkers[i][1].y);
        corner2 = Point2f(detectedMarkers[i][2].x, detectedMarkers[i][2].y);
        corner3 = Point2f(detectedMarkers[i][3].x, detectedMarkers[i][3].y);
        //display
        circle(dispFrame, detectedMarkers[i].getCenter(), 10, Scalar(0,255,255),10,8,0);
        circle(dispFrame, corner0, 10, Scalar(255,0,0),10,8,0);
        circle(dispFrame, corner1, 10, Scalar(0,255,0),10,8,0);
        circle(dispFrame, corner2, 10, Scalar(0,0,255),10,8,0);
        circle(dispFrame, corner3, 10, Scalar(255,0,255),10,8,0);
        // find location
        detectedMarkers[i].calculateExtrinsics(markerSize, intrinsicParams, Mat(),false);
        double z =  detectedMarkers[i].Tvec.at<float>(0,2);
        double x =  detectedMarkers[i].Tvec.at<float>(0,0);
        markerX.push_back(x);
        markerZ.push_back(z);

        double yaw = atan2(x, z);
        cout << "Range: " << z << ", \t yaw: " << (yaw * 180) / M_PI << endl;

    } // end of i-loop for all markers
}

void arucoDetectorCV2::visualize(){
  if(displayImage){
        imshow("", dispFrame);
        char c = waitKey(1);
        if((int)c == 27) // Esc
            kill = true;
    }
}



#endif
