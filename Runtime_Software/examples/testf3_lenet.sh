#!/bin/bash
basepath=$(cd `dirname $0`; pwd)
basepath=${basepath}"/../tpudemo"
cd ${basepath}
sudo ./eepdemo_arm --bin ../tpubin/freetpu_a3c8/lenet/eeptpu.bin --image ../images/lenet/7.jpg --label 7 --net lenet
cd - > /dev/null
