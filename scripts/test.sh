#!/bin/bash
distro="$(cat /etc/*-release | grep ID_LIKE | sed 's/.*[=]//')"

if [[ "$distro" == "Ubuntu" ]] || [[ "$distroFamily" == "Debian" ]]; then
    printf "MANJARO"
    
    printf $distro " " $distroFamily
else
    printf "Debian"

    printf $distro " " $distroFamily
fi
