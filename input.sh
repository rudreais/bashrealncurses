#!/bin/bash

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
                x) echo 1;;
                esac
                done
        }
        case "$1" in
        arrow)
                arrow_input;;
        esac
}