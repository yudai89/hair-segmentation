#!/bin/bash
if [ -z "$1" ]
  then
    # navigate to ~/data
    echo "navigating to ./data/ ..."
    cd ./data/
  else
    # check if is valid directory
    if [ ! -d $1 ]; then
        echo $1 "is not a valid directory"
        exit 0
    fi
    echo "navigating to" $1 "..."
    cd $1
fi

echo "Now downloading Figaro1k.zip ..."

# wget http://projects.i-ctm.eu/sites/default/files/AltroMateriale/207_Michele%20Svanera/Figaro1k.zip
# The official link is not working for some reason, so temporarily use dropbox instead.


rm -rf Figaro1k
rm -rf CelebAMask-HQ

wget https://www.dropbox.com/s/35momrh68zuhkei/Figaro1k.zip

echo "Unzip Figaro1k.zip ..."

unzip -o Figaro1k.zip

echo "Removing unnecessary files ..."

rm -f Figaro1k.zip
rm -f Figaro1k/GT/Training/*'(1).pbm'
rm -f Figaro1k/.DS_Store
rm -rf __MACOSX

wget https://www.dropbox.com/s/1e0sw51ib8rk9y5/CelebAMask-HQ.zip
echo "Unzip CelebAMask-HQ"
unzip -o CelebAMask-HQ.zip

find CelebAMask-HQ/CelebAMask-HQ-mask-anno/*/ -name "*_hair.png" -print0 | xargs -0 -I {} mv {} Figaro1k/GT/Training/
cp -a CelebAMask-HQ/CelebA-HQ-img/. Figaro1k/Original/Training

rm -f CelebAMask-HQ.zip
rm -rf CelebAMask-HQ

echo "Finished!"
