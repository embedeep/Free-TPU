# FREE TPU (under construction)
Free TPU IP for FPGA (default Xilinx Zynq-7020), More detail at http://www.embedeep.com

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
TPU supporting Layers|10|35|
MACs|152 FP16|576 FP16
Frequency|50 MHz|200 MHz
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

FREE TPU DO NOT use any PIN from PL side of Zynq chip. Hence, in general, you can use any borad including a Xilinx Zynq-7000 series chip to run a FREE TPU design. If you are using other FPGA chips, please let us know through issues, we are happy to release corresponding BIT file if possible.
## run steps
1. Clone this repository：
```
git clone https://github.com/embedeep/Free-TPU
```

2. copy necessary files to SD card for Zynq system
```
copy SD_card/* your_sd_card_path
```

3. insert the SD card into Zynq boad, launch system, connect the system through SSH, and excute the run command
```free_tpu_runtime --bin --image```

4. if everything right, you will see the result through terminal and saved image. Enjoy!

### Contact
Questions can be left as issues in the repository. We will be happy to answer them.

