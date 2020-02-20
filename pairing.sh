#!/bin/bash

check_pair() {
    pair_alias=$1

    while IFS= read -r line
    do
    echo "$line"
    done < .pairs
}


echo "Did you pair this with some team folk?"

read -p "You pair alias: " pair

case $pair in

    no)
        exit 0
    ;;
    yes)
        check_pair "chelo"
        exit 0
    ;;
esac

exit 1
