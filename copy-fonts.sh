#!/bin/bash
# small script to copy all installed fonts on a mac to an easily accesible folder in ~/fonts/
cd ~
mkdir fonts
cp ~/Library/fonts/*.otf ~/fonts/
cp ~/Library/fonts/*.ttf ~/fonts/
cp ~/Library/fonts/*.rtf ~/fonts/

cp /Library/fonts/*.otf ~/fonts/
cp /Library/fonts/*.ttf ~/fonts/
cp /Library/fonts/*.rtf ~/fonts/

cp /Network/Library/fonts/*.otf ~/fonts/
cp /Network/Library/fonts/*.ttf ~/fonts/
cp /Network/Library/fonts/*.rtf ~/fonts/

cp /System/Library/fonts/*.otf ~/fonts/
cp /System/Library/fonts/*.ttf ~/fonts/
cp /System/Library/fonts/*.rtf ~/fonts/

