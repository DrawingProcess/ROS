#install_ros2_foxy_OneLine_GUI_Desktop

echo ""
echo "[Note] Target OS version  >>> Ubuntu 18.04.x (Bionic Beaver)"
echo "[Note] Target ROS version >>> ROS2 Foxy Fitzroy"
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
sudo sh -c 'echo "deb http://packages.ros.org/ros2/ubuntu `lsb_release -cs` main" > /etc/apt/sources.list.d/ros2-latest.list'

echo "[#Install ROS2 Foxy packages (for Desktop)]"
sudo apt update -y
#Desktop Install (Recommended): ROS, RViz, demos, tutorials.
sudo apt install ros-foxy-desktop -y
#ROS-Base Install (Bare Bones): Communication libraries, message packages, command line tools. No GUI tools.
#sudo apt install ros-foxy-ros-base

echo "[#Execute ROS2 Environment]"
source /opt/ros/foxy/setup.bash
echo "[#ROS2 Environment Setup]"
sh -c "echo \"source /opt/ros/foxy/setup.bash\" >> ~/.bashrc"

echo "[#Install argcomplete]" 
#ROS 2 command line tools use argcomplete to autocompletion
sudo apt install python3-argcomplete -y

echo "[#Install additional RMW implementations]"
sudo apt update
sudo apt install ros-foxy-rmw-opensplice-cpp # for OpenSplice
#sudo apt install ros-foxy-rmw-connext-cpp # for RTI Connext (requires license agreement)

#echo "[#Install bridge using ROS 1 packages]"
#sudo apt update -y
#sudo apt install ros-foxy-ros1-bridge -y

echo "[#Install Turtlesim]"
sudo apt update -y
sudo apt install ros-foxy-turtlesim -y

echo "[#Install ros2bag]"
sudo apt -y install ros-foxy-ros2bag ros-dashing-rosbag2-transport
# ROS2 has a different way of storing data from ROS1 and requires plug-ins to be installed.
sudo apt install ros-foxy-rosbag2-storage-default-plugins

echo "[#Install colcon]"
sudo apt -y install python3-colcon-common-extensions -y

echo "[#Update the package lists and upgrade them]"
sudo apt-get update -y
sudo apt-get upgrade -y

echo "[Complete!!!!!]"
exit 0