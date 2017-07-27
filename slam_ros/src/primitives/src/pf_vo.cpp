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

class PFNode
{
    ros::NodeHandle nh_;
    ros::Subscriber vo_sub_;

    PFCoordinator pfCoordinator;

double velx, velz;
double poseX, poseY, poseTheta;
vector<double> x, y, z;
vector<int> ids;

public:
    bool kill;
    PFNode()
    {
kill = false;
         vo_sub_ = nh_.subscribe<geometry_msgs::Pose2D>("/vo_pose",1,&PFNode::voCallback, this);

    }
    ~PFNode(){}

    void voCallback(const geometry_msgs::Pose2D::ConstPtr& vel){
           velx = vel->x ;
           velz = vel->theta;
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
