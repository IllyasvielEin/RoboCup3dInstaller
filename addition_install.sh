#!/bin/bash

cd SimSpark || exit

# for developers manual
sudo apt install tetex-extra latex2html imagemagick
# for API documentations
sudo apt install doxygen

sudo apt install libwxgtk2.8-dev

test -d rsgedit && (cd rsgedit && mkdir build && cd build && cmake .. && make && sudo make install)

test -d simspark-utilities && (cd simspark-utilities && mkdir build && cd build && cmake .. && make && sudo make install)