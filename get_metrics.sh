#!/bin/bash

ENDPOINT=$1
AUTH=$2
COLUMNS=$3
TAGS=$4

curl -s -u $AUTH $ENDPOINT \
	| tidy -q -asxml -n 2>/dev/null \
	| xpath -n -q -e '//tr[count(td)='$COLUMNS']/td/text()' \
	| python `dirname $0`/parse_metrics.py $COLUMNS $TAGS

