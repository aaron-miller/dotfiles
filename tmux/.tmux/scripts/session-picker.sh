#!/usr/bin/env bash
# Pick another tmux session with fzf.
current=$(tmux display-message -p '#{session_name}')
session=$(tmux list-sessions -F '#S' | grep -vxF "$current" | fzf --reverse) || exit 0
tmux switch-client -t "$session"
