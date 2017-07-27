//MRPT headers had to be included before other headers to avoid compilation errors
#include "pfcoordinator.h"

#include <ros/ros.h>
#include <stdio.h>
#include "geometry_msgs/Twist.h"
#include "geometry_msgs/Pose2D.h"
#include "sensor_msgs/LaserScan.h"
#include "laser_geometry/laser_geometry.h"
#include <image_transport/image_transport.h>
#include <cv_bridge/cv_bridge.h>
#include <sensor_msgs/image_encodings.h>
#include <nav_msgs/Odometry.h>
#include "sensor_msgs/ChannelFloat32.h"
#include <tf/transform_datatypes.h>

#include<math.h>
#include<cmath>
#include <iostream>
#include <vector>
#include <string>

using namespace std;

 double unwrap(double previousAngle,double newAngle);
class PFNode
{
    ros::NodeHandle nh_;
    ros::Subscriber vel_sub_;
    ros::Subscriber scan_sub_;
    image_transport::ImageTransport it_;
    image_transport::Subscriber usbcam_;




    PFCoordinator pfCoordinator;


 double prev_v = 0;
    double prev_w = 0;
    double prevYaw;
double velx, velz;
double poseX, poseY, poseTheta;
vector<double> x, y, z;
vector<int> ids;
    bool init_done = false;
public:
    bool kill;
    PFNode() : it_(nh_)
    {
         vel_sub_ = nh_.subscribe<nav_msgs::Odometry>("/segway_rmp_node_front/odom",1,&PFNode::velCallback, this);
        scan_sub_ = nh_.subscribe<sensor_msgs::LaserScan>("/scan",1,&PFNode::scanCallback, this);

    }
    ~PFNode(){}

    void velCallback(const nav_msgs::Odometry::ConstPtr& vel){

double quatx, quaty, quatz, quatw;
        quatx = quaty = 0;
        quatz = vel->pose.pose.orientation.z;
        quatw = vel->pose.pose.orientation.w;

        tf::Quaternion q(quatx, quaty, quatz, quatw);
        tf::Matrix3x3 m(q);
        double roll, pitch, yaw;
        m.getRPY(roll, pitch, yaw);
        
        if(!init_done){
            prev_v = sqrt(pow(vel->pose.pose.position.x, 2) +  pow(vel->pose.pose.position.y, 2));

            prevYaw = yaw;
            //slam.setYaw(yaw);
            init_done = true;
            return;
        }

 double curr_v = sqrt(pow(vel->pose.pose.position.x, 2) +  pow(vel->pose.pose.position.y, 2));

        double temp = unwrap(prevYaw, yaw);

        //cout << ", Unwrapped Yaw " << temp << endl;


        double curr_w = temp;
        double new_v = curr_v - prev_v;
        double new_w = temp - (prevYaw);


        //slam.setInput(fabs(new_v) * 2, 0.0, new_w * 0.64 );
        prevYaw = temp;
        prev_v = curr_v;

           velx = fabs(new_v) * 2.0 ;
           velz =  new_w * 0.64;
      }

 void scanCallback(const sensor_msgs::LaserScan::ConstPtr& scan)
    {

        int n = scan->ranges.size();
        vector<float> ranges, angles;
        vector<char> valid;
        double currentAngle = scan->angle_min;
        double anglInc = scan->angle_increment;
        for(int i = 0; i < n; i++){
            ranges.push_back(scan->ranges[i]);
            angles.push_back(currentAngle);
            currentAngle+= anglInc;
            if(scan->ranges[i] > scan->range_max || scan->ranges[i] < scan->range_min){
                valid.push_back(0);
            }else{
                valid.push_back(1);
            }
        }

        double xS, yS, thetaS;
        pfCoordinator.setObservations(ranges, valid);
    }

void update(){
        pfCoordinator.setInput(velx, 0.0 , velz);
	velx = 0; velz = 0;
	pfCoordinator.runOnce();
	pfCoordinator.getPose(poseX, poseY, poseTheta);
	kill = pfCoordinator.kill;	
}
   

};



int main(int argc, char **argv)
{
    ros::init(argc, argv, "PF_Node");
    PFNode p;
    ros::Rate loop_rate(20);
    while (ros::ok() && !p.kill){
        p.update();
        ros::spinOnce();
        loop_rate.sleep();
    }

    cout << "Exited cleanly" << endl;

    return 0;
}


inline double constrainAngle(double x){
    x = fmod(x + M_PI,M_2PI);
    if (x < 0)
        x += M_2PI;
    return x - M_PI;
}
// convert to [-360,360]
inline double angleConv(double angle){
    return fmod(constrainAngle(angle),M_2PI);
}
inline double angleDiff(double a,double b){
    double dif = fmod(b - a + M_PI,M_2PI);
    if (dif < 0)
        dif += M_2PI;
    return dif - M_PI;
}
inline double unwrap(double previousAngle,double newAngle){
    return previousAngle - angleDiff(newAngle,angleConv(previousAngle));
}
