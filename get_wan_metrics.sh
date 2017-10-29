#!/bin/bash

AUTH=$1
COLUMNS=10

`dirname $0`/get_metrics.sh 192.168.1.1/statswan.cmd $AUTH $COLUMNS device=comtrend,type=wan

