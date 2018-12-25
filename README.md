# FREE TPU (under construction)
Free TPU FPGA IP for any FPGA chip (default Xilinx Zynq-7020), More detail at http://www.embedeep.com
### Supporting Layers
Layer Type|Device|Limitation|Notes
:---:|:---:|:---:|:---:
Convolution|TPU|kernal<=32,stride<=8
Depthwise Convolution|TPU|kernal<=32,stride<=8
Fully connected|TPU|No
MAX/AVE Pooling|TPU|kernal<=32,stride<=8
Batch Normalization|TPU|No
Scale|TPU|No
SUM/MUL/MAX Elementwise|TPU|No
Concatenation|TPU|No
Relu|TPU|No
Prelu|TPU|No
Others|CPU|No|All Layers in CAFFE

### Software Development Kits
Currently, we DO NOT release the SDK for FREE TPU. Instead, we provide the BIN and corresponding MODEL file of typical NN network. You can use the BIN to launch a NN algorithm (such as detection based on YOLOV3), or, you also can train your own Datasets using the MODEL (such as the yolov3_train.prototxt at CAFFE).

### Difference between FREE TPU and EEP Commercial TPU
||FREE TPU|EEP TPU
:---:|:---:|:---:
TPU Layers|10|35|
Frequency|20 MHz|200 MHz
On Chip Memory|256 KByte|512 KByte

### NN network
Network|Download|Inference time<br>(Zynq-7020 with FREE TPU)|Inference time<br>(Zynq-7035 with Commercial TPU)
:---:|:---:|:---:|:---:
[MobileNetV1](model/MobileNet)|[BIN](bins/MobileNetV1)
[MobileNetV2](model/MobileNet)|[BIN](bins/MobileNetV2)
[InceptionV3](model/InceptionV3)|[BIN](bins/InceptionV3)
[Resnet-50](model/Resnet-50)|[BIN](bins/InceptionV3)
[MobileNet_YOLOV3](model/MobileNet_YOLOV3)|[BIN](bins/MobileNet_YOLOV3)
[ICNet](model/ICNet)|[BIN](models/ICNet)

### FPGA bit
FPGA device|Download
:---:|:---:
Xilinx Zynq-7020|[BIT](bits/zynq-7020)

### Contact
Questions can be left as issues in the repository. We will be happy to answer them.

