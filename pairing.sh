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
                result="Co-Authored-By: $name <$email>"
                break 1
                break 2
            fi
        done < "$(pwd)/.pairs"

    echo "$result"
}

write_commit_message() {
    message=$1
    echo $message

    if [ "$message" = "Fail" ]; then
        echo "Not valid pair"
        exit 1
    fi

    echo "$message" >> "$COMMIT_MSG_FILE"
}

echo "Did you pair this with some team folk?"
exec < /dev/tty
read -p "Your pair alias: " pair

case $pair in

    no)
        exit 0
    ;;
    *)
        res="$(check_pair $pair)"
        echo $res
        write_commit_message "$res"
        echo $res
        exit 0
    ;;
esac

exit 1
