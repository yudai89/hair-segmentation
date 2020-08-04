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

wget https://www.dropbox.com/s/l1pbdx38t0pmhu8/Dataset.zip
unzip -o Dataset.zip
rm -f Dataset.zip
