#!/usr/bin/env bash
# Pick a project in ~/src and open it as a new window in the current session.
session=$(tmux display-message -p '#{session_name}')
dir=$(find ~/src -mindepth 1 -maxdepth 1 -type d | fzf --reverse) || exit 0
tmux new-window -t "$session:" -n "$(basename "$dir")" -c "$dir"
