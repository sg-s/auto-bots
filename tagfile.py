#! /usr/bin/env python
# -*- coding: utf-8 -*-

""" Write tags to file
Usage:
    tagfile.py "TagName" FileName1 FileName2 

    You can use wildcards for the file name. Use quotes if spaces in tags.
    To check if it worked, use xattr -l FileName

from here: http://stackoverflow.com/questions/19720376/osx-mavericks-add-tags-programmatically

"""

import sys
import subprocess

def writexattrs(F,TagList):
    """ writexattrs(F,TagList):
    writes the list of tags to three xattr fields on a file-by file basis:
    "kMDItemFinderComment","_kMDItemUserTags","kMDItemOMUserTags
    Uses subprocess instead of xattr module. Slower but no dependencies"""

    Result = ""

    plistFront = '<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd"><plist version="1.0"><array>'
    plistEnd = '</array></plist>'
    plistTagString = ''
    for Tag in TagList:
        plistTagString = plistTagString + '<string>{}</string>'.format(Tag.replace("'","-"))
    TagText = plistFront + plistTagString + plistEnd

    OptionalTag = "com.apple.metadata:"
    XattrList = ["kMDItemFinderComment","_kMDItemUserTags","kMDItemOMUserTags"]
    for Field in XattrList:  
        XattrCommand = 'xattr -w {0} \'{1}\' "{2}"'.format(OptionalTag + Field,TagText.encode("utf8"),F)
        if DEBUG:
            sys.stderr.write("XATTR: {}\n".format(XattrCommand))
        ProcString = subprocess.check_output(XattrCommand, stderr=subprocess.STDOUT,shell=True) 
        Result += ProcString
    return Result

DEBUG = False


if __name__ == "__main__":
    if len(sys.argv) < 3:
        print __doc__
    else:
        TagList = [ sys.argv[1] ]
        # print TagList
        # Or you can hardwire your tags here
        # TagList = ['Orange','Green']
        FileList = sys.argv[2:]

        for FileName in FileList:
            writexattrs(FileName, TagList)