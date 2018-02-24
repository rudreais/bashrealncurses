#!/bin/bash

lines=$(tput lines)
cols=$(tput cols)
mid=()
size=15

mid+=($(echo "$lines / 2" | bc))
mid+=($(echo "$cols / 2 - $size" | bc))

function main {
        function bluescreen {
                for ((i=0; i<=lines; i++))
                do
                        printf "\033[44m\033[K\033[0m\n"
                done
        }
        bluescreen
}

main
tput cup ${mid[0]} ${mid[1]}

function user_input {
        read -p $'\033[44m' test
        printf "\033[0m"
}

user_input