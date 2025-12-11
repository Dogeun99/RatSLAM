topological_msgs 패키지 생성 및 .msg 추가 — 완료

topological_msgs/package.xml에 rosidl 그룹 태그 추가 — 완료

ratslam CMake 최소버전 낮춤(4.0→3.16) — 완료

FindIrrlicht 개선(헤더/라이브러리 경로 확장) — 완료

전체 빌드( topological_msgs + ratslam ) 성공 — 완료


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
