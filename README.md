# RatSLAM

 (cd "$(git rev-parse --show-toplevel)" && git apply --3way <<'EOF' 
diff --git a/ratslam-ratslam_ros/README.md b/ratslam-ratslam_ros/README.md
index df9abd1f7e855315a3e3e3b47d3efca59ad359ce..a693a0fd030768c9e6552146db5c2ca9f52ef5c2 100644
--- a/ratslam-ratslam_ros/README.md
+++ b/ratslam-ratslam_ros/README.md
@@ -1,18 +1,22 @@
 <b>RatSLAM</b> is a bio-inspired simultaneous localisation and mapping (SLAM) system. Based on continous attractor network dynamics, RatSLAM is capable of mapping by closing loops to correct odometry error.<br>
 <br>
 The original RatSLAM algorithm was designed and implemented on Pioneer robots by Michael Milford and Gordon Wyeth (see <a href='http://eprints.qut.edu.au/37593/1/c37593.pdf'>RatSLAM: a hippocampal model for simultaneous localization and mapping</a>).<br>
 <br>
 There is an openRatSLAM paper available in <a href='http://www.springerlink.com/openurl.asp?genre=article&id=doi:10.1007/s10514-012-9317-9'>Autonomous Robots</a>. This paper describes how openRatSLAM works in technical detail.  If you use the code we would appreciate cites please.<br>
 <br>
 The C++ RatSLAM implementation is currently being used to power the iRat robot when it is <a href='http://ratslam.itee.uq.edu.au/live.html'>online</a> and in recent ports of the <a href='http://itee.uq.edu.au/~ruth/Lingodroids.htm'>Lingodroids project</a> to use the iRat.<br>
 <br>
 There are now two versions of RatSLAM available, both based on the same code:<br>
 <ul><li><b>(NEW)</b> <a href='https://github.com/davidmball/ratslam/blob/wiki/RatSLAMROS.md'>A ROS-based version</a>
 </li><li><a href='https://github.com/davidmball/ratslam/blob/wiki/RatSLAMLibrary.md'>A C++ library</a></li></ul>
 
 We provide three datasets for the ROS version of openRatSLAM
 <ul><li><a href='https://mega.nz/file/FAlXyZbB#6rMpQ6EE4LQIKmZvy5zN7Stdu4pIzZm2h3TnHkG2wms'>iRat in an Australian set (2011)</a><br>
 </li><li><a href='https://mega.nz/file/od8xVbKJ#E81hKj-M1-CybBkX1dLe3htAJw-gP9MAQIEeZkPwuUY'>Car in St Lucia suburb (2007)</a><br>
 </li><li><a href='https://mega.nz/file/oJdwxTAJ#EB-M_gLWq8Sy2uFvmER-D_uTZ7_Rd4v-5ZUhu1YGNCQ'>Oxford's New College (2008)</a></li></ul>
 
 The code is released under the GNU GPL V3. Please contact David Ball if you require a more permissive license.
+
+## ROS 메시지 파일 편집기 하이라이트
+
+`.msg` 파일은 필드 타입과 이름을 나열하는 단순한 포맷이어서 일부 편집기에서 구문 강조가 적용되지 않을 수 있습니다. 이는 빌드나 실행에 영향을 주지 않으며, 하이라이트를 원한다면 VS Code의 "ROS" 확장이나 파일 연관 설정을 활용해 `.msg`를 ROS 메시지 언어로 지정하면 됩니다.
 
EOF
)

<h3>ROS launch 파일 안내</h3>
<ul>
<li><code>launch/*.launch</code> 파일은 ROS 1 (예: Noetic) 환경에서 사용되는 XML 기반 런치입니다. 기존 워크플로를 유지하거나 ROS 1을 계속 사용할 때 필요합니다.</li>
<li><code>launch/*.launch.py</code> 파일은 ROS 2 (예: Foxy 이후)에서 사용하는 Python 기반 런치입니다. ROS 2로 마이그레이션할 때 이 파일들을 사용하면 됩니다.</li>
<li>양쪽 런치 파일을 모두 보관해 두면 ROS 1/ROS 2 환경을 병행 지원할 수 있습니다. 필요에 따라 해당 ROS 버전에 맞는 런치 파일만 선택적으로 사용하거나 별도 브랜치에서 정리할 수 있습니다.</li>
</ul>
