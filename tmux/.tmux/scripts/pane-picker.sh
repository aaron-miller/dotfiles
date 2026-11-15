#!/usr/bin/env bash
# Pick any pane across all sessions and switch to it.
line=$(tmux list-panes -a -F '#{pane_id} #{session_name}:#{window_index}.#{pane_index} #{window_name} #{pane_current_command} #{pane_current_path}' \
  | fzf --reverse) || exit 0
pane=$(awk '{print $1}' <<< "$line")
[ -n "$pane" ] || exit 0
tmux switch-client -t "$pane"
