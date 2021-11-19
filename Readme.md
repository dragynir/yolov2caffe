

# docker run --mount type=bind,source=C:\Users\dkoro\PythonProjects\yolov4tocaffe\darknet2caffe,target=/workspace/ -it bvlc/caffe:cpu bash 

# pip install future

# docker run --mount type=bind,source=C:\Users\dkoro\PythonProjects\yolov4tocaffe\darknet2caffe,target=/workspace/ -it caffe bash

# python darknet2caffe.py cfg/yolov4.cfg weights/yolov4.weights prototxt/yolov4.prototxt caffemodel/yolov4.caffemodel


# docker exec -it [container-id] bash
# docker build -t app_ui .
# type=bind,source="$(pwd)"/target,target=/app \
# docker run -p 5006:5006 -it --mount type=bind,source=C:\Users\dkoro\PythonProjects\Birdsy\birdsy_cl\inference\monitoring\ui\data,target=/app/data app_ui






git clone https://github.com/ChenYingpeng/darknet2caffe.git

# move hpp
mv /workspace/darknet2caffe/caffe_layers/mish_layer/mish_layer.hpp /opt/caffe/include/caffe/layers/mish_layer.hpp
mv /workspace/darknet2caffe/caffe_layers/upsample_layer/upsample_layer.hpp /opt/caffe/include/caffe/layers/upsample_layer.hpp

mv /workspace/darknet2caffe/caffe_layers/mish_layer/mish_layer.cpp /opt/caffe/src/caffe/layers/mish_layer.cpp
mv /workspace/darknet2caffe/caffe_layers/mish_layer/mish_layer.cu /opt/caffe/src/caffe/layers/mish_layer.cu

mv /workspace/darknet2caffe/caffe_layers/upsample_layer/upsample_layer.cpp /opt/caffe/src/caffe/layers/upsample_layer.cpp
mv /workspace/darknet2caffe/caffe_layers/upsample_layer/upsample_layer.cu /opt/caffe/src/caffe/layers/upsample_layer.cu

apt-get update 
apt-get install nano



cd /opt/caffe/src/caffe/proto




=========================================

message LayerParameter {

    optional UpsampleParameter upsample_param = 149; //added by chen for Yolov3, make sure this id 149 not the same as before.
    optional MishParameter mish_param = 150; //added by chen for yolov4,make sure this id 150 not the same as before.
}

============================================

==========================================
// added by chen for YoloV3
message UpsampleParameter{
  optional int32 scale = 1 [default = 1];
}

// Message that stores parameters used by MishLayer
message MishParameter {
  enum Engine {
    DEFAULT = 0;
    CAFFE = 1;
    CUDNN = 2;
  }
  optional Engine engine = 2 [default = DEFAULT];
}
============================================





cd /opt/caffe/build
cmake -DCPU_ONLY=1 .. && make -j"$(nproc)"

cd /workspace/darknet2caffe
pip2 install future
mkdir caffemodel
python2 darknet2caffe.py cfg/yolov4.cfg weights/yolov4.weights prototxt/yolov4.prototxt caffemodel/yolov4.caffemodel


-- Generating done
-- Build files have been written to: /opt/caffe/build
[  1%] Running C++/Python protocol buffer compiler on /opt/caffe/src/caffe/proto/caffe.proto
caffe.proto:430:26: "tile_param" is already defined in "caffe.LayerParameter".
caffe.proto:336:9: "LayerParameter" is already defined in "caffe".
caffe.proto:10:12: "UpsampleParameter" is not defined.
src/caffe/CMakeFiles/proto.dir/build.make:61: recipe for target 'include/caffe/proto/caffe.pb.cc' failed
make[2]: *** [include/caffe/proto/caffe.pb.cc] Error 1
CMakeFiles/Makefile2:267: recipe for target 'src/caffe/CMakeFiles/proto.dir/all' failed
make[1]: *** [src/caffe/CMakeFiles/proto.dir/all] Error 2
Makefile:127: recipe for target 'all' failed
make: *** [all] Error 2