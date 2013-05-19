#!/bin/bash

cd /usr/local/src
git clone git://github.com/ggreer/the_silver_searcher.git
cd the_silver_searcher
git pull

./build.sh

make install
