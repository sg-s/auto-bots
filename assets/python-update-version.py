#!/usr/bin/python3


import os
from datetime import date

thisfile = 'setup.py'
lines = tuple(open(thisfile, 'r'))

outfile = open(thisfile + ".temp", 'w+')

today = date.today()
version = str(today.year)[-2:] + "." + str(today.month) + "." + str(today.day)


for line in lines:

    if "version=" in line:
        outfile.write("    version='" + version + "',\n")

    else:
        outfile.write(line)


outfile.close()

# delete the old file
os.remove(thisfile)

# rename the new file to the old file
os.rename(thisfile + ".temp", thisfile)
