
#! /bin/bash


cd basicmath
./run.sh
mv energy_consumption.txt energy_consumption_bm.txt
cd ..

cd crc32
./run.sh
mv energy_consumption.txt energy_consumption_crc.txt
cd ..

cd dijkstra
./run.sh
mv energy_consumption.txt energy_consumption_dj.txt
cd ..

cd dhrystone
./run.sh
mv energy_consumption.txt energy_consumption_ds.txt
cd ..

cd fft
./run.sh
mv energy_consumption.txt energy_consumption_fft.txt
cd ..

cd patricia
./run.sh
mv energy_consumption.txt energy_consumption_pt.txt
cd ..

cd sha 
./run.sh
mv energy_consumption.txt energy_consumption_sha.txt
cd ..

cd stringsearch
./run.sh
mv energy_consumption.txt energy_consumption_ss.txt
cd ..

cd whetstone
./run.sh
mv energy_consumption.txt energy_consumption_ws.txt
cd ..
