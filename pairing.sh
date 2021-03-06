#!/bin/bash

# Get Git Message Info - Not all is used but nice to have
COMMIT_MSG_FILE=$1
COMMIT_SOURCE=$2
SHA1=$3

check_pair() {
    pair_alias=$1
    result="Fail"
    while IFS=, read -r user_alias name email
    do
        if [[ "$user_alias" == "$pair_alias" ]]; then
            result="Co-authored-by: $name <$email>"
            break 1
            break 2
        fi
    done < "$(pwd)/.pairs"

    echo "$result"
}

write_commit_message() {
    message=$1

    if [ "$message" = "Fail" ]; then
        echo "Not valid pair"
        exit 1
    fi

    printf "\n$message" >> "$COMMIT_MSG_FILE"
}

list_possible_pairs() {
    while IFS=, read -r user_alias name
    do
        echo "$user_alias ($name)"
    done < "$(pwd)/.pairs"
}

# Assign STDIN to keyboard input, plain `read` does not stop
exec < /dev/tty

read -p "Did you pair this with some team folk? [Y|n] ([l] to list pairs)" answer

case $answer in
    [nN])
        exit 0
    ;;
    *)
        case $answer in
            [lL])
                echo "Possible pairs"
                echo "--------------"
                list_possible_pairs
                echo ""
            ;;
        esac
        read -p "Your pair alias: " pair
        res="$(check_pair $pair)"
        write_commit_message "$res"
        exit 0
    ;;
esac

exit 1
