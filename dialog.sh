#!/bin/bash

lines=$(tput lines)
cols=$(tput cols)
mid=()
colors=("red" "green" "yellow" "blue" "magenta" "cyan" "lgrey")


mid+=($(echo "$lines / 2" | bc))
mid+=($(echo "$cols / 2" | bc))

function is_in {
        index=1
        for i in "${colors[@]}"
        do
                if [ "$1" == "$i" ]
                then
                        echo "$(echo "40 + $index" | bc)m"
                        return
                fi
                index=$(echo "$index + 1" | bc)
        done
        echo "44m"
}

source ./input.sh
source ./menu.sh

function main {
        function clear_screen {
                colors=$(is_in $1)
                for ((i=0; i<=lines; i++))
                do
                        printf "\033[$colors\033[K\033[0m\n"
                done
        }

        clear_screen
        menu 100 20 "my title"
        tput civis
        inputs arrow
}
main
tput cnorm