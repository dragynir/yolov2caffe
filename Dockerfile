FROM bvlc/caffe:cpu


COPY . /workspace
WORKDIR /workspace
VOLUME /workspace/data

RUN pip2 install --upgrade pip
RUN pip2 install torch
RUN pip2 install future

# docker 
# docker run -it --mount type=bind,source=C:\Users\dkoro\PythonProjects\Birdsy\yolov2caffe\data\,target=/workspace/data caffe2