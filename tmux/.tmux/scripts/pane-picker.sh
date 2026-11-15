#!/usr/bin/env bash
# Pick any pane across all sessions and switch to it.
# pane_current_command is the wrapper shell from tmux-bootstrap, so the foreground job is looked up on the pane's tty.
list=$(tmux list-panes -a -F '#{pane_id}|#{session_name}:#{window_index}.#{pane_index}|#{window_name}|#{@name}|#{pane_pid}|#{pane_tty}|#{pane_current_command}|#{pane_current_path}' \
  | while IFS='|' read -r id target win name pid tty cmd path; do
      fg=$(ps -t "${tty#/dev/}" -o pid=,stat=,args= | awk -v pane="$pid" '$1 != pane && $2 ~ /\+/ { n = split($3, p, "/"); print p[n]; exit }')
      printf '%s %s %s %s %s %s\n' "$id" "$target" "$win" "$name" "${fg:-$cmd}" "$path"
    done) || exit 0
line=$(fzf --reverse <<< "$list") || exit 0
pane=$(awk '{print $1}' <<< "$line")
[ -n "$pane" ] || exit 0
tmux switch-client -t "$pane"
