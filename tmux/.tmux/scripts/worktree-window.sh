#!/usr/bin/env bash
# Pick a worktree under ~/wrk and open it as a window in session $1.
# If the worktree is already open in the session, switch to that window.
session=$(tmux display-message -p '#{session_name}')

dir=$("$HOME/.scripts/worktree" ls | fzf --reverse) || exit 0
[[ -n $dir ]] || exit 0
dir=$(cd "$dir" && pwd -P) || exit 1

open=$(tmux list-panes -s -t "$session" -F '#{window_id}|#{pane_current_path}' \
  | awk -F'|' -v d="$dir" '$2 == d { print $1; exit }')
if [[ -n $open ]]; then
  tmux select-window -t "$open"
  exit 0
fi

branch=$(git -C "$dir" symbolic-ref --quiet --short HEAD) || branch=${dir##*/}
IFS=/ read -ra parts <<< "$branch"
n=${#parts[@]}
windows=$(tmux list-windows -t "$session" -F '#{window_name}')

name=
for (( k = 1; k <= n; k++ )); do
  start=$(( n - k ))
  candidate=$(IFS=/; echo "${parts[*]:start}")
  if ! grep -Fxq -- "$candidate" <<< "$windows"; then
    name=$candidate
    break
  fi
done

if [[ -z $name ]]; then
  tmux display-message "worktree-window: no free window name for $branch"
  exit 1
fi

tmux new-window -t "$session:" -n "$name" -c "$dir"
