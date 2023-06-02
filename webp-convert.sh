#!/bin/bash

helpFunction()
{
   echo ""
   echo "Usage: $0 -m 6 -q 75"
   echo -e "\t-m compression method (0=fast, 6=slowest), default=4"
   echo -e "\t-q quality factor (0:small..100:big), default=75"
   exit 1 # Exit script after printing help
}

while getopts "m:q:" opt
do
   case "$opt" in
      m ) parameterM="$OPTARG" ;;
      q ) parameterQ="$OPTARG" ;;
      ? ) helpFunction ;; # Print helpFunction in case parameter is non-existent
   esac
done

if [ -z ${parameterM} ]; then paramM=4; else paramM=${parameterM}; fi
if [ -z ${parameterQ} ]; then paramQ=75; else paramQ=${parameterQ}; fi

PARAMS=('-m $paramM -q $paramQ -mt -af -progress')

if [ $# -ne 0 ]; then
    PARAMS=$@;
fi

shopt -s nullglob nocaseglob extglob

walk_dir () {
    for pathname in "$1"/*; do
        if [ -d "$pathname" ]; then
            walk_dir "$pathname"
        elif [ -e "$pathname" ]; then
            case $pathname in
                *.jpg|*.jpeg|*.tif|*.tiff|*.png)
                    printf "%s\n -------------"
                    printf "%s\n starting job for : " . $pathname
                    printf "%s\n"
                    cwebp $PARAMS $pathname -o "${pathname%.*}".webp;
                    printf "%s\n-------------"
                    
            esac
        fi
    done
}
walk_dir $(pwd)
