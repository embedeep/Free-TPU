#!/bin/bash
basepath=$(cd `dirname $0`; pwd)
basepath=${basepath}"/../tpudemo"
cd ${basepath}
sudo ./eepdemo_arm --bin ../tpubin/freetpu_a3c8/mobilenet1/nobn/eeptpu.bin --image ../images/classify/ILSVRC2012_val_00000049.JPEG --label 717 --net mobilenet
cd - > /dev/null