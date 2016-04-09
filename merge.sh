#!/bin/bash
git fetch cm cm-13.0
git merge cm/cm-13.0
git push origin master
git push orion HEAD:6.0.1
