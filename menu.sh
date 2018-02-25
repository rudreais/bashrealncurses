#!/bin/bash


function menu {
        width="$1"
        height="$2"
        title="$3"
        max_col=$(tput cols)
        max_line=$(tput lines)

        function add_space {
                space="$1"
                for ((i=0; i<=space; i++))
                do
                        tput cuf1
                done
        }

        function print_box {
                index=0
                for ((i=0; i<=height; i++))
                do
                        index=$(echo "$index + 1" | bc)
                        tput cup $(echo "(($max_line - $height) / 2) + $index" | bc) $(echo "($max_col - $width) / 2" | bc)
                        printf "\033[47m"
                        for ((j=0; j<=width; j++))
                        do
                                printf " "
                        done
                        printf "\033[0m\n"
                done
        }

        function print_shadow {
                echo 1
        }

        function check_box {
                
                print_box
                tput cup $(echo "($max_line - $height) / 2 + 1" | bc) $(echo "($max_col - $width) / 2 + 1" | bc)
                printf "\033[47m\033[30m$title\033[0m\n"
                space=$(echo "($max_col - $width) / 2" | bc)
                add_space "$space"
                for ((i=0; i<$width-1; i++))
                do
                        printf "\e[47m\e[30m-\e[0m"
                done
                printf "\n"
                add_space "$space"
                printf "\e[47m\e[30m$2:\t\t|\e[0m"
                nb_choice="$1"
                new_space=$(echo "$space + 38" | bc)
                for ((j=0; j<nb_choice; j++))
                do
                        if [ "$j" == 0 ]
                        then
                                printf "\t\t\e[47m\e[30m$3\e[0m\n"
                        else
                                add_space "$new_space"
                                printf "\e[47m\e[30m$3\e[0m\n"
                                shift
                        fi
                done
        }
        check_box 3 \
        "choice 1" "test1" "test2" "test3"
}
