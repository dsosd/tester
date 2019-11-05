#!/bin/bash

RED_COLOR="\e[31m"
GREEN_COLOR="\e[32m"
CLEAR_COLOR="\e[0m"

HASH1=$(./automata $1 "$2"; sha256sum "$2".out | sed "s/[ ].*//g")
HASH2=$(./ref_bin_blob $1 "$2"; sha256sum "$2".out | sed "s/[ ].*//g")

if [ $HASH1 == $HASH2 ]; then
	echo -e "["$GREEN_COLOR" OK "$CLEAR_COLOR"] ""$2"
	return 0
else
	echo -e "["$RED_COLOR"FAIL"$CLEAR_COLOR"] ""$2"
	return 1
fi
