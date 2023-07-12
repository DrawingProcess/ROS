#install_ros2_foxy_OneLine_GUI_Desktop
#!/bin/bash  # a declaration designating the shell to run the script as a bash

echo ""
echo "[Note] Target OS version  >>> Ubuntu 20.04.x (Bionic Beaver)"
echo "[Note] Target ROS version >>> ROS2 Foxy Fitzroy"
echo ""
echo "PRESS [ENTER] TO CONTINUE THE INSTALLATION"
echo "IF YOU WANT TO CANCEL, PRESS [CTRL] + [C]"
read

echo "[#Update the package lists and upgrade them]"
sudo apt-get update -y
sudo apt-get upgrade -y


sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt install curl # if you haven't already installed curl
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
sudo apt-get update -y

echo "[#Install ROS Noetic packages (for Desktop)]"
sudo apt install ros-noetic-desktop-full
sudo apt install python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential
sudo rosdep init
rosdep update

sudo apt install python3-osrf-pycommon python3-catkin-tools

echo "[#Setup Locale]"
sudo apt update && sudo apt install locales
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8

sudo apt install software-properties-common
sudo add-apt-repository universe

sudo apt update && sudo apt install curl -y
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

echo "[#Update the package lists and upgrade them]"
sudo apt-get update -y
sudo apt-get upgrade -y

echo "[#Install ROS2 Foxy packages (for Desktop)]"
sudo apt install ros-foxy-desktop python3-argcomplete -y

echo "[#Install additional RMW implementations]"
sudo apt update
sudo apt install ros-foxy-rmw-opensplice-cpp # for OpenSplice
#sudo apt install ros-foxy-rmw-connext-cpp # for RTI Connext (requires license agreement)

#echo "[#Install bridge using ROS 1 packages]"
sudo apt update -y
sudo apt install ros-foxy-ros1-bridge -y

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

# sudo wget https://raw.githubusercontent.com/seongjunChoi0714/ROS/master/install_ros2_foxy.sh && chmod 755 ./install_ros2_foxy.sh && bash ./install_ros2_foxy.sh