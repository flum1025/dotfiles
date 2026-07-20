#!/bin/bash

if [ $# -eq 0 ]; then
  echo "Usage: $0 /path/to/parent_dir"
  exit 1
fi

PARENT_DIR="$1"

if [ ! -d "$PARENT_DIR" ]; then
  echo "Error: Directory '$PARENT_DIR' does not exist."
  exit 1
fi

dirs=($(find "$PARENT_DIR" -maxdepth 1 -mindepth 1 -type d | sort))

if [ ${#dirs[@]} -eq 0 ]; then
  echo "No subdirectories found in $PARENT_DIR"
  exit 1
fi

for dir in "${dirs[@]}"; do
  tmux split-window -h -c "$PARENT_DIR/$dir"
  tmux select-layout tiled
done
