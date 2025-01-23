#!/bin/bash

groupofnames=("sudeep" "snigdha" "omar" "deepna" "vignesh")

for name in "${sortgroupofnames[@]}"; do
    echo "$name"
done

sortgroupofnames=($( for name in "${groupofnames[@]}"; do echo "$name"; done | sort))
