#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/variables.sh"
source "$CURRENT_DIR/helpers.sh"

batch_dir=$(get_tmux_option "$batch_loc_option" "$default_batch_loc_option")
echo
echo "Batches in $batch_dir:"
echo
PS3="Please select the batch file to execute: "
options=($batch_dir/*)
select opt in "${options[@]##*/}"
do
    tmux source-file $batch_dir/$opt
    break
done
