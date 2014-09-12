#! /bin/bash/
# MAC address randomiser
# works on Mac OS X
new_mac=$(openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//')
sudo ifconfig en0 ether $new_mac