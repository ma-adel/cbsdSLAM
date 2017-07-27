#include "scanfuser.h"

ScanFuser::ScanFuser(){
    setMinLoggingLevel(LVL_DEBUG);
    map = CSimplePointsMap::Create();
    gridMap = COccupancyGridMap2D::Create();
    kill = false;
    config();
}

ScanFuser::~ScanFuser(){}

void ScanFuser::config(){
    MRPT_LOG_DEBUG("in ScanFuser::config()");
    scanSize = 1;

    scanWindow.setPos(1000,10);
    scanWindow.resize(640, 480);
    scanWindow.axis(-3,3,-3,3);
    scanWindow.axis_equal();

    currentScan.aperture = 1.56466+1.5708;
    currentScan.rightToLeft = true;
    currentScan.beamAperture = 0.00613592;
    currentScan.maxRange = 5.6;
    currentScan.stdError = 0.02;
    scannerPose.setFromValues(0.0, 0.0, 0.0, 0.0, 0.0,0.0);
    MRPT_LOG_DEBUG("out ScanFuser::config()");

}

void ScanFuser::addToMap(){
    MRPT_LOG_DEBUG("in ScanFuser::addToMap()");
//    if(map->empty()){
//        map->insertObservation(&currentScan);
//        return;
//    }else{
//        MRPT_LOG_DEBUG("updating map in ScanFuser::addToMap()");
//        if(currentScan.scan.size() > 0){
//            CSimplePointsMap tempMap;
//            tempMap.insertObservation(&currentScan);
//            MRPT_LOG_DEBUG("Temporary map created in ScanFuser::addToMap()");
//            cout << tempMap.getPointsBufferRef_y().size() << endl;
//            vector<bool> notFused;
////            map->insertObservation(&currentScan, &scannerPose);
////            map->insertAnotherMap(&tempMap, CPose3D(0,0,0,0,0,0));
//            map->fuseWith(&tempMap, 0.5, &notFused);
//        }
//    }

    gridMap->insertObservation(&currentScan, &scannerPose);
    MRPT_LOG_DEBUG("out ScanFuser::addToMap()");
}

void ScanFuser::setPose(double &x, double &y, double &theta){
    MRPT_LOG_DEBUG("in ScanFuser::setPose()");
    scannerPose.setFromValues(x, y, 0.0, theta, 0.0, 0.0);
    currentScan.setSensorPose(scannerPose);
    MRPT_LOG_DEBUG("out ScanFuser::setPose()");
}

void ScanFuser::setScan(vector<float> &ranges, vector<char> &valid){
    MRPT_LOG_DEBUG("in ScanFuser::setScan()");
    assert(valid.size() == ranges.size() && "The sizes of ranges and valids are not equal");
    float* r = &ranges[0];
    char* v = &valid[0];
    scanSize = ranges.size();
    currentScan.loadFromVectors(scanSize, r, v);
    MRPT_LOG_DEBUG("out ScanFuser::setScan()");
}

void ScanFuser::visualize(){
    MRPT_LOG_DEBUG("in ScanFuser::visualize()");
//    if(!scanWindow.isOpen()){
//        kill = true;
//        return;
//    }
//    Eigen::Matrix2d   circle(2,2);
//    circle(0,0) = 0.005;
//    circle(1,1) = 0.005;
//    circle(0,1) = circle(1,0) = 0.0;
//    vector<float>   map1_xs, map1_ys, map1_zs;
//    map->getAllPoints(map1_xs,map1_ys,map1_zs);

//    scanWindow.clf();
//    scanWindow.plot( map1_xs, map1_ys, "b.3", "map1");
//    scanWindow.hold_on();
//    //scanWindow.plotEllipse( scannerPose.x(), scannerPose.y(), circle, 3, "b-2", "robot circle" );
//    //scanWindow.hold_on();
//    vector<float> plotX, plotY;
//    plotX.push_back( scannerPose.x());
//    plotX.push_back( scannerPose.x() + 0.3*cos( scannerPose.yaw()));
//    plotY.push_back(( scannerPose.y()));
//    plotY.push_back( scannerPose.y()+ 0.3*sin( scannerPose.yaw()));
//    scanWindow.plot( plotX, plotY,"g-4","angle");
    CImage	img;
    grid->getAsImage(img);
    frame.showImage(img);
    MRPT_LOG_DEBUG("out ScanFuser::visualize()");
}

void ScanFuser::printInfo(){
    cout << "in print info ------ \n";
    cout << map->size() << endl;
    cout << "finished " << endl;
}
