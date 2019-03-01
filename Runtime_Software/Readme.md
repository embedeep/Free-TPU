## FREE-TPU Runtime Software
*eepdemo_arm* is the FREE-TPU's demo application.

### Usage
```
./eepdemo_arm -h
Usage: 
    ./eepdemo_arm [-options]
where options include:
    --help(-h)         # print this help message
    --bin <path>       # eep tpu bin file path. 
    --image <path>     # image jpg path or folder path.
    --label <label>    # label or label file path.  
    --crop <mode>      # crop mode; 0: just resize;  1: 1-crop
                         (1-crop mode: for classify neural networks)
    --prefetch <flag>  # images read mode. if set 1, will prefetch all images before test.
    --net <net name>   # if no mean/norm, set 'default'. 
                         Free-TPU currently supports: 'lenet', 'mobilenet'
                         'squeezenet', 'resnet50', 'inception', 'myolo3', 'icnet'
    --version(-v)      # show version.
```
**Crop mode**: for classify neural networks. If set to 1, will do crop. The crop method is: *<1>* set a default crop scale(<=1.0); *<2>* find the short edge value of image size; *<3>* short edge value multiple the crop scale, as the new short edge value; *<4>* crop the center part of image by short_edge * short_edge square; *<5>* proportionally resize the square crop image to the input size.   Suppose the input height is equal to width.  The default crop scale is: if input width < 256, crop_scale = width / 256.0;  else crop_scale = 1.0.

**Root privileges: Need**.

### Neural Networks
The '*--net <net name>*' option currently supports the following networks: (*more will update*)
```
lenet: Lenet-5
mobilenet: Mobilenet_v1 / Mobilenet_v2
squeezenet: Squeezenet_v1.1
resnet50: Resnet-50
inception: Inception_v3
myolo3: Mobilenet_yolo_v3
icnet: ICNET
```

### Free-TPU Bin File
Free TPU supports 2 types of bin files:

- **freetpu_c8a1**: For hardware boards which have 512MB PS memory.

- **freetpu_c8a3**: For hardward boards which have >=1GB PS memory.

There are only a few Free-TPU bin files (*lenet / mobilenet_v1*) on github for test.

You can download **ALL Free-TPU bin files** from **[BaiDu Cloud](https://pan.baidu.com/s/1M3mcz8XVxJHIfwsAPLV0iw)** (Extraction code: w462 ; Updated on March 1, 2019).

### Examples
Suppose the demo have 3 folders: " images, tpubin, eepdemo ", and we are in eepdemo folder in command line. Take "*freetpu_c8a1*" for example, you could change the bin file according to your board.

- Test 1 image: 
```
sudo ./eepdemo_arm --bin ../tpubin/freetpu_c8a1/mobilenet1/eeptpu.bin --image ../images/classify/ILSVRC2012_val_00000013.JPEG --label 370 --net mobilenet --crop 1
```
- Test all images in folder:
```
sudo ./eepdemo_arm --bin ../tpubin/freetpu_c8a1/mobilenet1/eeptpu.bin --image ../images/classify/ --label ../images/classify/val.txt --net mobilenet --crop 1
sudo ./eepdemo_arm --prefetch 1 --bin ../tpubin/freetpu_c8a1/mobilenet1/eeptpu.bin --image ../images/classify/ --label ../images/classify/val.txt --net mobilenet --crop 1 
```
*Note*: The demo application can pre-read all images in the folder by using '--prefetch 1', but do not place too many images in the folder if using prefetch.

### Running Environment
Free-TPU demo application runs in Linux(ARM-v7 architecture), compatible with raspberry pi file system.

### Performance On ImageNet(ILSVRC 2012)

| |Caffe ( Top1 / Top5 ) | Free-TPU ( Top1 / Top5 ) | *Free-TPU Vs. Caffe*  ( Top1 / Top5 ) 
:------: | :------: | :------: | :------: 
Lenet5| 99.06% / 100% | 99.01% / 100% | -0.05% / 0.00% 
Mobilenet_v1| 70.74% / 89.84% | 70.76% / 89.81% | +0.02% / -0.03% 
Mobilenet_v2| 71.82% / 90.45% | 71.84% / 90.41% | +0.02% / -0.04% 
Squeezenet_v1.1| 56.50% / 79.67% |  56.41% / 79.63% | -0.09% / -0.04% 
ResNet-50| 75.15% / 92.19% | 75.16% / 92.15% | +0.01% / -0.04% 
Inception_v3| 78.38% / 94.11%  | 78.38% / 94.11% |  0.00% / 0.00% 
