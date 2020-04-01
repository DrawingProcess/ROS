#OneLineInstall_ros2_dashing_RemotePC_Turtlebot
#!/bin/bash # a declaration designating the shell to run the script as a bash

echo ""
echo "[Note] Target OS version  >>> Ubuntu 18.04.x (Bionic Beaver)"
echo "[Note] Target ROS version >>> ROS2 Dashing Diademata"
echo ""
echo "PRESS [ENTER] TO CONTINUE THE INSTALLATION"
echo "IF YOU WANT TO CANCEL, PRESS [CTRL] + [C]"
read

echo "[#Update the package lists and upgrade them]"
sudo apt-get update -y
sudo apt-get upgrade -y

echo "[#Setup Locale]"
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8

echo "[#Setup Sources add Repository]"
sudo apt update && sudo apt install curl gnupg2 lsb-release -y
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
# add the repository to your sources list
sudo sh -c 'echo "deb [arch=amd64,arm64] http://packages.ros.org/ros2/ubuntu `lsb_release -cs` main" > /etc/apt/sources.list.d/ros2-latest.list'

echo "[#Install ROS2 Dashing packages (for Desktop)]"
sudo apt update -y
#Desktop Install (Recommended): ROS, RViz, demos, tutorials.
sudo apt install ros-dashing-desktop -y
#ROS-Base Install (Bare Bones): Communication libraries, message packages, command line tools. No GUI tools.
#sudo apt install ros-dashing-ros-base

echo "[#Execute ROS2 Environment]"
source /opt/ros/dashing/setup.bash
echo "[#ROS2 Environment Setup]"
sh -c "echo \"source /opt/ros/dashing/setup.bash\" >> ~/.bashrc"

echo "[#Install argcomplete]" 
#ROS 2 command line tools use argcomplete to autocompletion
sudo apt install python3-argcomplete -y

echo "[#Install additional RMW implementations]"
sudo apt update -y
sudo apt install ros-dashing-rmw-opensplice-cpp -y # for OpenSplice
#sudo apt install ros-dashing-rmw-connext-cpp -y # for RTI Connext (requires license agreement)

#echo "[#Install bridge using ROS 1 packages]"
#sudo apt update -y
#sudo apt install ros-dashing-ros1-bridge -y

echo "[#Install Turtlesim]"
sudo apt update -y
sudo apt install ros-dashing-turtlesim -y

echo "[#Install ros2bag]"
sudo apt -y install ros-dashing-ros2bag ros-dashing-rosbag2-transport
# ROS2 has a different way of storing data from ROS1 and requires plug-ins to be installed.
sudo apt install ros-dashing-rosbag2-storage-default-plugins -y

echo "[#Update the package lists and upgrade them]"
sudo apt-get update -y
sudo apt-get upgrade -y

echo "[#Install Colcon]"
sudo apt install python3-colcon-common-extensions -y
echo "[#ros2_example_ws git clone / build / install]"
echo "[#Create a workspace]"
mkdir -p ~/ros2_example_ws/src
cd ~/ros2_example_ws
echo "[#Add some sources]"
git clone https://github.com/ros2/examples src/examples
cd ~/ros2_example_ws/src/examples/
git checkout dashing
cd ~/ros2_example_ws
echo "[#Build the workspace]"
colcon build --symlink-install
echo "[#Source the environment]"
. install/setup.bash

echo "[#Install development tools and ROS tools]"
sudo apt update && sudo apt install -y \
  build-essential \
  cmake \
  git \
  python3-colcon-common-extensions \
  python3-pip \
  python-rosdep \
  python3-vcstool \
  wget
#echo "[# install some pip packages needed for testing]"
#python3 -m pip install -U \
#  argcomplete \
#  flake8 \
#  flake8-blind-except \
#  flake8-builtins \
#  flake8-class-newline \
#  flake8-comprehensions \
#  flake8-deprecated \
#  flake8-docstrings \
#  flake8-import-order \
#  flake8-quotes \
#  pytest-repeat \
#  pytest-rerunfailures \
#  pytest \
#  pytest-cov \
#  pytest-runner \
#  setuptools
echo "[# install Fast-RTPS dependencies]"
sudo apt install --no-install-recommends -y \
  libasio-dev \
  libtinyxml2-dev
echo "[# install CycloneDDS dependencies]"
sudo apt install --no-install-recommends -y \
  libcunit1-dev

echo "[#Install Dependencies Packages]"
sudo apt install -y \
 google-mock \
 libceres-dev \
 liblua5.3-dev \
 libboost-dev \
 libboost-iostreams-dev \
 libprotobuf-dev \
 protobuf-compiler \
 libcairo2-dev \
 libpcl-dev \
 python3-sphinx -y
echo "[# Install Gazebo9]"
curl -s SL http://get.gazebosim.org | sh  
#original : -sSL(ROBOTIS) -> merge : -s SL
sudo apt install ros-dashing-gazebo-*
echo "[# Install Cartographer]"
sudo apt install ros-dashing-cartographer -y
sudo apt install ros-dashing-cartographer-ros -y
echo "[# Install Navigation2]"
sudo apt install ros-dashing-navigation2 -y
sudo apt install ros-dashing-nav2-bringup
echo "[# Install vcstool]"
sudo apt install python3-vcstool

echo "[#Install TurtleBot3 Packages]"
mkdir -p ~/turtlebot3_ws/src
cd ~/turtlebot3_ws
wget https://raw.githubusercontent.com/ROBOTIS-GIT/turtlebot3/ros2/turtlebot3.repos
vcs import src < turtlebot3.repos
colcon build --symlink-install

echo "[Save Turtlebot Bash Command for Setup]"
sudo sh -c "echo 'source ~/turtlebot3_ws/install/setup.bash' >> ~/.bashrc"
sudo sh -c "echo 'export ROS_DOMAIN_ID=30 #TURTLEBOT3' >> ~/.bashrc"
source ~/.bashrc

echo "[Complete!!!!!]"
exit 0

#OneLineCode : sudo wget https://raw.githubusercontent.com/seongjunChoi0714/ROS/master/install_ros2_dashing_useTurtlebot.sh && chmod 755 ./install_ros2_dashing_useTurtlebot.sh && bash ./install_ros2_dashing_useTurtlebot.sh