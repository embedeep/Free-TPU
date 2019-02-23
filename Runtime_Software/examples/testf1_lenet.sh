#!/bin/bash
basepath=$(cd `dirname $0`; pwd)
basepath=${basepath}"/../eepdemo"
cd ${basepath}
sudo ./eepdemo_arm --bin ../tpubin/freetpu_a1c8/lenet/eeptpu.bin --image ../images/lenet/00000_7.pgm --label 7 --net lenet
cd - > /dev/null
