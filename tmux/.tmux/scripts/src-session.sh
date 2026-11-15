#!/usr/bin/env bash
# Pick a project in ~/src, name a new session for it, and switch to it.
dir=$(find ~/src -mindepth 1 -maxdepth 1 -type d | fzf --reverse) || exit 0
default=$(basename "$dir")
read -r -p "Session name [$default]: " name
name=${name:-$default}
if ! tmux has-session -t "=$name" 2>/dev/null; then
  tmux new-session -d -s "$name" -c "$dir"
fi
tmux switch-client -t "=$name"
