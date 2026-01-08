# ratslam

This package is a port of the original [ratslam_ros](https://openslam-org.github.io/openratslam.html) repository to ROS 2 (tested on ROS 2 Rolling).

## Dependencies

In addition to standard ROS 2 dependencies, this package **requires the custom `topological_msgs` package**. Make sure it is available and built in your workspace before building `ratslam`.

Main dependencies:
- `rclcpp`
- `topological_msgs` (custom)
- `cv_bridge`
- `sensor_msgs`
- `geometry_msgs`
- `nav_msgs`
- `visualization_msgs`
- `tf2_ros`
- `image_transport`
- `Boost` (component `serialization`)
- `OpenCV`
- `Irrlicht`
- `OpenGL`

## Installation


1. **Clone the `ratslam` and `topological_msgs` repositories into your workspace:**

   ```bash
   cd ~/rolling_ws/src
   git clone https://github.com/OpenRatSLAM2/ratslam.git
   git clone https://github.com/OpenRatSLAM2/topological_msgs.git
   ```

2. **Install system dependencies:**

   ```bash
   sudo apt update
   sudo apt install ros-rolling-cv-bridge ros-rolling-sensor-msgs ros-rolling-geometry-msgs ros-rolling-nav-msgs ros-rolling-visualization-msgs ros-rolling-tf2-ros ros-rolling-image-transport libboost-all-dev libopencv-dev libirrlicht-dev libopengl-dev
   ```

## ROS 2 Humble (Ubuntu 22.04) — 빌드 및 실행

This project was originally tested on ROS 2 Rolling. The steps below explain how to build and run on Ubuntu 22.04 with ROS 2 Humble.

Prerequisites
- Ubuntu 22.04, ROS 2 Humble installed and configured

Install system packages (one-time):
```bash
sudo apt update
sudo apt install -y \
   ros-humble-cv-bridge ros-humble-sensor-msgs ros-humble-geometry-msgs \
   ros-humble-nav-msgs ros-humble-visualization-msgs ros-humble-tf2-ros \
   ros-humble-image-transport \
   libboost-all-dev libopencv-dev libirrlicht-dev libglu1-mesa-dev libgl1-mesa-dev
```

Build (example):
```bash
cd ~/rolling_ws
source /opt/ros/humble/setup.bash
# If you made local changes or to ensure a clean build, you can remove build artifacts:
# rm -rf build/ install/ log/
colcon build --packages-select topological_msgs ratslam
```

After build:
```bash
source ~/rolling_ws/install/setup.bash
ros2 interface show topological_msgs/msg/TopologicalMap
```

Troubleshooting
- If `rosidl_generate_interfaces` fails, ensure `topological_msgs/package.xml` contains:
   `<member_of_group>rosidl_interface_packages</member_of_group>`
- If you see `irrlicht/irrlicht.h` not found or linkage errors, install `libirrlicht-dev` (see apt command above) and ensure CMake can find the library.
- If there are CMake version issues (e.g., upstream requires 4.x), you may lower `cmake_minimum_required` locally, but keep this in a branch to avoid upstream conflicts.

If you want, create a branch and commit your local Humble-specific adjustments (CMakeLists, FindIrrlicht changes, adding topological_msgs) so you can continue tracking them separately from upstream.

3. **Build the workspace:**

   ```bash
   cd ~/rolling_ws
   source /opt/ros/rolling/setup.bash
   colcon build --symlink-install
   ```

4. **Source the workspace:**

   ```bash
   source ~/rolling_ws/install/setup.bash
   ```

## Usage
To use this package with your datasets, first convert the dataset to a ROS 2 bag format, if necessary. Access the datasets google drive link https://drive.google.com/drive/folders/1ggAxMzIyadmenUPoAon2rL8gvJvuv75K?usp=drive_link for examples.

First, run your dataset launch file, for example:

```bash
ros2 launch ratslam irataus.launch
```

```bash
ros2 launch ratslam oxford_newcollege.launch
```

```bash
ros2 launch ratslam stlucia.launch
```

In another terminal, run your bag:

```bash
ros2 bag play data/irat_aus_28112011/irat_aus_28112011.db3 --rate 1.0 --clock --start-paused --topics /irat_red/odom /irat_red/camera/image/compressed
```

```bash
ros2 bag play data/oxford_newcollege/oxford_newcollege.db3 --rate 1.0 --clock --start-paused --topics /irat_red/odom /irat_red/camera/image/compressed
```

```bash
ros2 bag play data/stlucia_2007/stlucia_2007.db3 --rate 1.0 --clock --start-paused --topics /irat_red/odom /irat_red/camera/image/compressed
```
