#!/bin/bash

AUTH=$1
COLUMNS=9

`dirname $0`/get_metrics.sh 192.168.1.1/statsifc.html $AUTH $COLUMNS device=comtrend,type=lan

