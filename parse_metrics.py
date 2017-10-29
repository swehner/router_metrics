#!/usr/bin/python3

import sys

def group(lst, n):
    """group([0,3,4,10,2,3], 2) => [(0,3), (4,10), (2,3)]
    
    Group a list into consecutive n-tuples. Incomplete tuples are
    discarded e.g.
    
    >>> group(range(10), 3)
    [(0, 1, 2), (3, 4, 5), (6, 7, 8)]
    """
    return zip(*[lst[i::n] for i in range(n)]) 


COLUMNS = int(sys.argv[1])
EXTRATAGS = sys.argv[2]

lines = map(lambda x: x.strip().lower().translate(None, bytearray(range(128, 255))), sys.stdin.readlines())
matrix = group(lines, COLUMNS)
if COLUMNS==10:
  matrix = [[l[0]] + list(l[2:]) for l in matrix]

for i in range(1, len(matrix)):
  labels = map('.'.join, zip(['rx']*4 + ['tx']*4, matrix[0][1:]))
  datapoints = map(lambda x: '='.join(x), zip(labels, matrix[i][1:]))
  for datapoint in datapoints:
    print("networkInterface,{},interface={} {}".format(EXTRATAGS, matrix[i][0], datapoint))

