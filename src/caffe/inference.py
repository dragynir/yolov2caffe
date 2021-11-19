import sys
import caffe
from PIL import Image
import numpy as np

image = Image.open("sq.jpg").resize((640, 640), resample=Image.BILINEAR)

image_np = np.array(image).reshape(1,640,640,3).transpose(0,3,1,2)

caffe.set_mode_cpu()
net = caffe.Net("./yolov4_half.prototxt", "./yolov4_half.caffemodel",0)
print net.forward_all(**{"data":image_np})