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

function inputs {
        function arrow_input {
                while read -rsn1 ui; do
                case "$ui" in
                $'\x1b')
                read -rsn1 -t 0.1 tmp
                        if [[ "$tmp" == "[" ]]; then
                        read -rsn1 -t 0.1 tmp
                        case "$tmp" in
                        "A") echo "up";;
                        "B") echo "down";;
                        "C") echo "right";;
                        "D") echo "left";;
                        esac
                        fi
                        read -rsn5 -t 0.1
                        ;;
                q) break;;
                esac
                done
        }

        case "$1" in
        arrow)
                arrow_input;;
        esac
}

function menu

function main {
        function clear_screen {
                colors=$(is_in $1)
                for ((i=0; i<=lines; i++))
                do
                        printf "\033[$colors\033[K\033[0m\n"
                done
        }

        index=50
        tput cup 4 $index
        
        inputs arrow
}
main