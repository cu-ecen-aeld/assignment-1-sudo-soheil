#!/bin/sh
if [ $# -ne 2 ]
then
    echo "Usage: $0 <filesdir> <searchstr>"
    exit 1
fi

filesdir=$1
searchstr=$2

if [ ! -d "$filesdir" ]
then
    echo "Directory $filesdir does not exist"
    exit 1
fi

if [ -z "$searchstr" ]
then
    echo "Search string is empty"
    exit 1
fi

num_files=$(find "$filesdir" -type f | wc -l)
num_matching_lines=$(grep -r "$searchstr" "$filesdir" | wc -l)

echo "The number of files are $num_files and the number of matching lines are $num_matching_lines"