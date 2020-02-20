#!/bin/bash

echo "Did you pair this with some team folk?"

read -p "You pair alias: " pair

case $pair in

    no)
        exit 0
    ;;
    yes)
        echo "Hola $pair"
        exit 0
    ;;
esac

exit 1
