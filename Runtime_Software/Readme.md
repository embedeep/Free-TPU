### FREE-TPU Runtime Software
eepdemo_arm is the FREE-TPU's demo application.

#### Usage
```
./eepdemo_arm -h
Usage: 
    ./eepdemo_arm [-options]
where options include:
    -h (--help)  prints this help message
    --bin        <eep tpu bin file path>        
    --image      <image jpg path or folder path>
    --label      <label or label file path>      
    --crop       <mode>  # crop mode; 0: just resize;  1: 1-crop
                 (1-crop mode: for classify neural networks)
    --prefetch   <flag>  # images read mode. if set 1, will prefetch all images before test.
    --net        <net name>  # if no mean/norm, set 'default'. 
                 Free-TPU currently support: 'lenet', 'mobilenet'
                 'squeezenet', 'resnet50', 'inception', 'myolo3', 'icnet'
```
Crop mode: for classify neural networks. If set to 1, will proportionally scale the image's short edge to 256, then crop the center part for use.

Root privileges: **Need**.

#### Neural Networks
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

#### Free-TPU Bin File
Free TPU supports 2 types of bin files:

- **freetpu_a1c8**: For hardware boards which have 512MB PS memory.

- **freetpu_a3c8**: For hardward boards which have >=1GB PS memory.

There are only a few Free-TPU bin files (*lenet / mobilenet_v1 / squeezenet*) on github for test.

You can download **ALL Free-TPU bin files** from **[BaiDu Cloud](https://pan.baidu.com/s/1M3mcz8XVxJHIfwsAPLV0iw)** (Extraction code: ==w462==).

#### Examples
Suppose the demo have 3 folders: " images, tpubin, tpudemo ", and we are in tpudemo folder in command line.

- Test 1 image: 
```
sudo ./eepdemo_arm --bin ../tpubin/freetpu_a1c8/mobilenet1/nobn/eeptpu.bin --image ../images/ILSVRC2012_val_00000049.JPEG --net mobilenet
sudo ./eepdemo_arm --bin ../tpubin/freetpu_a1c8/mobilenet1/nobn/eeptpu.bin --image ../images/ILSVRC2012_val_00000049.JPEG --label 717 --net mobilenet
sudo ./eepdemo_arm --bin ../tpubin/freetpu_a1c8/mobilenet1/nobn/eeptpu.bin --image ../images/ILSVRC2012_val_00000049.JPEG --label 717 --net mobilenet --crop 1
```
- Test all images in folder:
```
sudo ./eepdemo_arm --bin ../tpubin/freetpu_a1c8/mobilenet1/nobn/eeptpu.bin --image image_folder_path --label label_file_path --net mobilenet --crop 1
```
*Note*: The demo application can pre-read all images in the folder by using '--prefetch 1', but do not place too many images in the folder if using prefetch.

#### Running Environment
Free-TPU demo application runs in Linux(ARM-v7 architecture), compatible with raspberry pi file system.


