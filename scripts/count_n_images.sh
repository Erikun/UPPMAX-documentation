#!/bin/bash
#
# Count the number of images.
#
# Usage:
#
#  ./scripts/count_n_images.sh
#
#
if [[ "$PWD" =~ scripts$ ]]; then
    echo "FATAL ERROR."
    echo "Please run the script from the project root. "
    echo "Present working director: $PWD"
    echo " "
    echo "Tip: like this"
    echo " "
    echo "  ./scripts/count_n_images.sh"
    echo " "
    exit 42
fi

grep -ER "\\!\\[" --include=*.md | wc --lines
