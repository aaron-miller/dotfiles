#!/usr/bin/env bash
# Pick a project in ~/src and open it as a new window in session $1.
session="$1"
dir=$(find ~/src -mindepth 1 -maxdepth 1 -type d | fzf --reverse) || exit 0
tmux new-window -t "$session:" -n "$(basename "$dir")" -c "$dir"
