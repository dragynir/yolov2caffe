#!/bin/bash
git clone https://github.com/ChenYingpeng/darknet2caffe.git


cp /workspace/darknet2caffe/caffe_layers/mish_layer/mish_layer.hpp /opt/caffe/include/caffe/layers/mish_layer.hpp
cp /workspace/darknet2caffe/caffe_layers/upsample_layer/upsample_layer.hpp /opt/caffe/include/caffe/layers/upsample_layer.hpp

cp /workspace/darknet2caffe/caffe_layers/mish_layer/mish_layer.cpp /opt/caffe/src/caffe/layers/mish_layer.cpp
cp /workspace/darknet2caffe/caffe_layers/mish_layer/mish_layer.cu /opt/caffe/src/caffe/layers/mish_layer.cu

cp /workspace/darknet2caffe/caffe_layers/upsample_layer/upsample_layer.cpp /opt/caffe/src/caffe/layers/upsample_layer.cpp
cp /workspace/darknet2caffe/caffe_layers/upsample_layer/upsample_layer.cu /opt/caffe/src/caffe/layers/upsample_layer.cu

cp /workspace/src/caffe.proto /opt/caffe/src/caffe/proto/caffe.proto

cd /opt/caffe/build
cmake -DCPU_ONLY=1 .. && make -j"$(nproc)"

pip2 install future

cd /workspace/darknet2caffe

# python2 darknet2caffe.py cfg/yolov4.cfg weights/yolov4.weights prototxt/yolov4.prototxt caffemodel/yolov4.caffemodel
