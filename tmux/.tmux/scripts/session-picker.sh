#!/usr/bin/env bash
# Pick another tmux session with fzf. $1 is the current session name.
session=$(tmux list-sessions -F '#S' | grep -vxF "$1" | fzf --reverse) || exit 0
tmux switch-client -t "$session"
