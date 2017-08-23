#!/usr/bin/env python
# convert2mp3.py 
# converts all files in the given folder to .mp3


import os
import subprocess

cwd = os.getcwd()

relevant_path = cwd
included_extensions = ['opus', 'wma','ogg']
file_names = [fn for fn in os.listdir(relevant_path) if any(fn.endswith(ext) for ext in included_extensions)]


for file_name in file_names:
	convert_this = os.path.join(cwd,file_name);
	convert_to = os.path.join(cwd,file_name) + ".mp3";
	c = 'ffmpeg -i "{}" -ab 256k "{}"'.format(convert_this,convert_to)
	subprocess.call(c,shell=True)

    