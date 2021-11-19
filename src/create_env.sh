#!/bin/bash
git clone https://github.com/ChenYingpeng/darknet2caffe.git


cp /workspace/src/darknet2caffe/caffe_layers/mish_layer/mish_layer.hpp /opt/caffe/include/caffe/layers/mish_layer.hpp
cp /workspace/src/darknet2caffe/caffe_layers/upsample_layer/upsample_layer.hpp /opt/caffe/include/caffe/layers/upsample_layer.hpp

cp /workspace/src/darknet2caffe/caffe_layers/mish_layer/mish_layer.cpp /opt/caffe/src/caffe/layers/mish_layer.cpp
cp /workspace/src/darknet2caffe/caffe_layers/mish_layer/mish_layer.cu /opt/caffe/src/caffe/layers/mish_layer.cu

cp /workspace/src/darknet2caffe/caffe_layers/upsample_layer/upsample_layer.cpp /opt/caffe/src/caffe/layers/upsample_layer.cpp
cp /workspace/src/darknet2caffe/caffe_layers/upsample_layer/upsample_layer.cu /opt/caffe/src/caffe/layers/upsample_layer.cu

cp /workspace/src/caffe.proto /opt/caffe/src/caffe/proto/caffe.proto

cd /opt/caffe/build
cmake -DCPU_ONLY=1 .. && make -j"$(nproc)"

pip2 install future

# Test environment
# cd weights
# wget -c https://github.com/AlexeyAB/darknet/releases/download/darknet_yolo_v3_optimal/yolov4.weights
# cd ..
# mkdir caffemodel
# python2 darknet2caffe.py cfg/yolov4.cfg weights/yolov4.weights prototxt/yolov4.prototxt caffemodel/yolov4.caffemodel
