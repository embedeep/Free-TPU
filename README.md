# FREE TPU (under construction) 
***Free TPU*** is the free version of a commercial TPU design for Deep Learning EDGE Inference, which can deploy at any FPGA device including Xilinx Zynq-7020 (a good choice for production). Actually, not just only a TPU logic design, the ***Free TPU*** also include a Deep Learning Inference Framework ***supporting all caffe layers***, which can run at any ARM CPU (such as the ARM A9 of Zynq-7020). TPU and CPU co-work with each other under the schedule of the Deep Learning Inference Framework (any order of alternation). Then, you can do anything you want with *FREE!* (We release the ***Free TPU*** with MIT LICENSE). More details, please visit http://www.embedeep.com

## Supporting Layers
Layer Type|Device|Limitation|Notes
:---:|:---:|:---:|:---:
Convolution|TPU|kernel<=32,stride<=8
Depthwise Convolution|TPU|kernel<=32,stride<=8
Fully connected|TPU|No
MAX/AVE Pooling|TPU|kernel<=32,stride<=8
Batch Normalization|TPU|No
Scale|TPU|No
SUM/MUL/MAX Element-wise|TPU|No
Concatenation|TPU|No
Relu|TPU|No
Prelu|TPU|No
Others|CPU|No|All Layers in CAFFE

## Software Development Kits 
***Free TPU SDK*** imports the trained model from CAFFE directly to generate the BIN file. No further re-training or fine-tuning necessary. However, we DO NOT release the SDK for FREE TPU yet. Instead, we provide the BIN and corresponding MODEL file of typical NN network. You can use the BIN to launch a NN algorithm (such as detection with YOLOV3 or segmentation with ICNet). Or, you also can ***train*** with your own Datasets based on the MODEL, and generate your ***own BIN*** through a simple tool (release later) by merging *your-own caffe-model* and the *old BIN*. Then, your own BIN is available for any usage!

## Difference between FREE TPU and Commercial EEP TPU
||FREE TPU|EEP TPU
:---:|:---:|:---:
Target Device|Zynq FPGA|any FPGA and ASIC
TPU supporting Layers|10|35
MACs|152 FP16|Configurable<br>(typical 576 FP16 or INT8)
Frequency|50 MHz|200 MHzS
AXI port|1|2
Memory Model|Shared|Shared or Dedicated
On Chip Memory|256 KByte|Configurable<br>(typical 512 KByte)
Functionality|Same|Same
API|Same|Same

From the view of users, *Free-TPU* and *EEP-TPU* has the same functionality, but with different inference time. If the inference time of *Free-TPU* is NOT good enough for your applications, you can contact us in any time. We will be happy to share our experience about algorithm, software or hardware with you.

## Development Resource 
### NN network 
Network MODEL|BIN|Inference time<br>(50MHZ FREE TPU)|Inference time<br>(200MHZ EEP TPU)|Inference time<br>(800MHZ ARM A9x1 within Zynq)
:---:|:---:|:---:|:---:|:---:
[lenet-5](Deep_Learning_Algorithm/models/lenet-5.prototxt)|[BIN](Deep_Learning_Algorithm/bins/)
[MobileNetV1](Deep_Learning_Algorithm/models/mobilenet_v1.prototxt)|[BIN](Deep_Learning_Algorithm/bins/)
[MobileNetV2](Deep_Learning_Algorithm/models/mobilenet_v2.prototxt)|[BIN](Deep_Learning_Algorithm/bins/)
[InceptionV3](Deep_Learning_Algorithm/models/inception_v3.prototxt)|not ready
[Resnet-50](Deep_Learning_Algorithm/models/ResNet_50.prototxt)|not ready
[MobileNet_YOLOV3](Deep_Learning_Algorithm/models/mobilenet_yolov3_lite.prototxt)|not ready
[ICNet](Deep_Learning_Algorithm/models/icnet.prototxt)|not ready

For comparison, you can refer to the [HLS implementation of lenet-5](https://github.com/changwoolee/lenet5_hls), which run at 100MHZ, use almost all resource of zynq-7020 FPGA, and only x3.63 faster than cpu (800MHZ ARM A9x1 within Zynq)

### FPGA bit
FPGA device|BITS|Version
:---:|:---:|:---:
Xilinx Zynq-7020|[BIT](FPGA_Bits/zynq-7020)|v0.6.0

FREE TPU DO NOT use any PIN from PL side of Zynq chip. Hence, in general, you can use any board including a Xilinx Zynq-7000 series chip to run the FREE TPU. If you are using other FPGA chips, please let us know through issues, we are happy to release corresponding BIT file if possible.
### Run steps
1. Clone this repository：
```
git clone https://github.com/embedeep/Free-TPU
```

2. If you already have a Runnable Linux OS meeting the requirements declared in the [requirements.txt](Runtime_Software/requirments.txt) , copy necessary files (and replace the old one) to the SD card for Zynq system. If not, please refer to the steps from ***[Free-TPU-OS](https://github.com/embedeep/Free-TPU-OS)*** to prepare the Linux OS. 
```
copy bits/zynq_7020/* root_of_sd_card/boot 
(If you are using different chip, please replace zynq_7020 with corresponding chip name)
```

3. Insert the SD card into Zynq board, launch system, connect the system through SSH, and execute the run command
```
free_tpu_runtime --bin BIN_file --image IMG_file
```

4. If everything right, you will see the result through terminal, saved image, or remote PC (through python socket, please refer to [Remote Terminal](Runtime_Software/Remote_Terminal/)). Enjoy!

## License
MIT LICENSE

## Contact
Questions can email us or be left as issues in the repository, we will be happy to answer them.
## Contributors 
Luo (luohy@embedeep.com) <br>
Zhou (zhouzx@embedeep.com) <br>
He (herh@embedeep.com)
