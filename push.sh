#!/bin/bash
dir=${PWD}
cd ${THUGDIR}/falcon
git push origin master
git push orion HEAD:6.0.1
cd ${dir}
