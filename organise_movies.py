#!/usr/bin/env python


# imports, setup
import os, glob, shutil, urllib3, time
from bs4 import BeautifulSoup
http = urllib3.PoolManager()



# define known movie formats 
movie_formats = ['avi','mov','m4v','mp4','mkv'];

root_folder = os.getcwd();

# find all files with known extentions 
allfiles = [];
containing_folder = [];
import os
for root, dirs, files in os.walk(root_folder):
    for file in files:
        if file.endswith(tuple(movie_formats)):
        	allfiles.append(file)
        	containing_folder.append(root)

# remove elements of this list with hidden files
rm_this = [i for i, s in enumerate(allfiles) if s[0] == '.']
for i in sorted(rm_this, reverse=True):
    del allfiles[i]
    del containing_folder[i]


assert len(allfiles)  == len(containing_folder), "Error in determining list of movie files"

# # for each of them, check if there is a folder with that name in the root_folder
for i in range(len(allfiles)):
	thisfile = allfiles[i];
	z = thisfile.rfind('.');
	movie_folder_name = thisfile[0:z];

	if (containing_folder[i] == root_folder):
		print(movie_folder_name)
		if (os.path.isdir(movie_folder_name)):
			print("Folder exists")
		else:
			print("Folder does not exist. Creating...")
			os.makedirs(movie_folder_name)
			print("Copying all files associated with this movie into the folder I just created...")
			move_these_files = glob.glob(movie_folder_name+'*');
			for file in move_these_files:
				if (file != movie_folder_name):
					shutil.move(file,os.path.join(root_folder,movie_folder_name,file))

# now that we have each movie in its own folder, we will attempt to rename folders to suit this syntax:
# Movie Name (YYYY)

# to do this, we're going to scrape the internet and figure shit out



# first get a list of all folders in the root folder
movie_folders = os.listdir(os.getcwd());
ddg_q_string = 'http://duckduckgo.com/html/?q=site:imdb.com '

for movie in movie_folders:
	# check if it's a hidden file/folder
	if not movie.startswith('.'):
		print("Old Name:")
		print(movie)
		# scrape duckgduckgo
		# why ddg? because it actually works, way better than google, at getting to the IMDB page we want to
		# why scrape, and not use the API? because i can't fucking figure it out

		r=http.request('GET', ddg_q_string + movie)
		time.sleep(5)

		# find the top link
		soup = BeautifulSoup(r.data,'html5lib');
		mylinks=soup.findAll("a",{"class":"result__a"})

		if len(mylinks) > 0:

			# get the title from IMDB
			r = http.request('GET', mylinks[0].get('href'))
			soup = BeautifulSoup(r.data,'html5lib')
			new_name = soup.title.string
			new_name = new_name.replace(' - IMDb','')
			print("New Name:")
			print(new_name)

		else:
			print("Error resolving name on IMDb. ")








