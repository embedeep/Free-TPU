#!/bin/bash
basepath=$(cd `dirname $0`; pwd)
basepath=${basepath}"/../eepdemo"
cd ${basepath}
sudo ./eepdemo_arm --bin ../tpubin/freetpu_c8a3/mobilenet1/eeptpu.bin --image ../images/classify/ILSVRC2012_val_00000013.JPEG --label 370 --net mobilenet --crop 1
cd - > /dev/null