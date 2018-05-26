import sys
import argparse

parser = argparse.ArgumentParser()
parser.add_argument("mapFile", help="map file", type=str)
parser.add_argument("pathFile", help="path file", type=str)

args = parser.parse_args()

mapfile = open(args.mapFile)
pathfile = open(args.pathFile)

mappings = mapfile.readlines()
activeFunc = False

id2bbMap = {}

for line in mappings:
  words = line.split()
  if len(words) > 0:
    if words[0] == "Func":
      if words[1] != "main":
        activeFunc = True
    elif words[0] == "ENDMAP":
      activeFunc = False
    else:
      if activeFunc == True:
        id2bbMap[words[0]] = words[1]

paths = pathfile.readlines()

for line in paths:
  words = line.split()
  print id2bbMap[words[1]]
