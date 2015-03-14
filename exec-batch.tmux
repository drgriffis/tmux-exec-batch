#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/scripts/variables.sh"
source "$CURRENT_DIR/scripts/helpers.sh"

set_trigger_binding() {
    local key_bindings=$(get_tmux_option "$key_option" "$default_key_option")

    local key
    for key in $key_bindings; do
        tmux bind-key "$key" send-keys "$CURRENT_DIR/scripts/exec-batch.sh" "C-m"
    done
}

main() {
    set_trigger_binding
}
main
