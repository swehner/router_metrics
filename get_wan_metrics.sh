#!/bin/bash

AUTH=$1
COLUMNS=10

curl -s -u $AUTH 192.168.1.1/statswan.cmd \
	| tidy -q -asxml -n 2>/dev/null \
	| xpath -q -e '//tr[count(td)='$COLUMNS']/td/text()' \
       	| python parse_metrics.py $COLUMNS device=comtrend,type=wan

