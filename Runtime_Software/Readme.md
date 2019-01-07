### FREE-TPU Runtime Software
eepdemo_arm is the FREE-TPU's demo application.

#### Usage
```
./eepdemo_arm -h
Usage: 
    ./eepdemo_arm [-options]
where options include:
    -h               print this help message
    --bin            <bin file path>        
    --image          <image jpg path or folder path>
    --label          <label or label file path>      
    --net            <net name> 

```

#### Example
Test 1 image: 
```
sudo ../eepdemo_arm --bin ../bin/mobilenet_v1/eeptpu.bin --image ./images/ILSVRC2012_val_00000012.JPEG --net mobilenet
sudo ../eepdemo_arm --bin ../bin/mobilenet_v1/eeptpu.bin --image ./images/ILSVRC2012_val_00000012.JPEG --label 286 --net mobilenet
```
Test images folder:
```
sudo ../eepdemo_arm --bin ../bin/mobilenet_v1/eeptpu.bin --image image_folder_path --label label_file_path --net mobilenet
```
Note: The demo application reads all images in the folder first, so do not place too many images in the folder to test.


#### Dependency
opencv 2.3.1 
