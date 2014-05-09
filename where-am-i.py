#!/usr/bin/python
# finds out what your external and internal IP is and saves it to a file
# created by Srinivas Gorur-Shandilya at 16:52 on 14-March-2014. Contact me at http://srinivas.gs/
#
# Install instructions
#
# 1. Get this file, and allow it to be executable:
#    chmod a+x whereami.py
#
# 2. Create an empty .txt file called locations.txt in your dropbox
#
# 3. Modify line 43 in this file to reflect the path where ip.txt is
#
# 4. Modify your crontab (I suggest using Cronnix on a Mac) to run this command
#    /path/to/this/script/where-am-i.py every minute (on Cronnix, make every field a asterix)
#
# 5. verify that the crontab changes have stuck:
#    crontab -l
#    should show you:
#    *	*	*	*	*	/path/to/this/script/where-am-i.py
#
# tested and functional on Mac OS X 10.9.2

import subprocess
import socket
import os


# get external IP
p = subprocess.Popen('dig +short myip.opendns.com @resolver1.opendns.com', shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
for line in p.stdout.readlines():
    ip= str(line);

ip = ip[0:-1];


# get internal IP
p2 = subprocess.Popen('/sbin/ifconfig | grep "inet " | grep -v 127.0.0.1 | cut -d\  -f2', shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)

for line in p2.stdout.readlines():
    ip2= str(line);

ip2 = ip2[0:-1];


# get computer name
computerName = str(socket.gethostname());
sh = computerName.find('.');
computerName = computerName[0:sh];

filename = '/Users/sigbhu/odin-kalki-sync/';
filename = filename+computerName+'.txt';

# create file if it doesn't exist
if os.path.exists(filename):
    f = file(filename, "r+")
else:
    f = file(filename, "w+")


# save to file

f = open(filename, 'w');

# check if this computer name is already on file
f.write(computerName)
f.write(':')
f.write(ip)
f.write(':')
f.write(ip2)
f.close()

# add another section that modifies the hosts file to add short names for all the computers (except this one) and their IP addresses
