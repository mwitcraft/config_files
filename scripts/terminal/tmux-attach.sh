#!/usr/bin/env bash

# SYNOPSIS: Interactively list and attach to active tmux sessions.

# Ensure tmux is available in current environment
if ! command -v tmux &>/dev/null; then
    echo "Error: tmux is not installed or not found in PATH." >&2
    exit 1
fi

# Fetch running tmux sessions
mapfile -t sessions < <(tmux list-sessions 2>/dev/null)

if [ ${#sessions[@]} -eq 0 ]; then
    echo -e "\033[33mNo active tmux sessions found.\033[0m"
    exit 0
fi

# Parse session names into an array
session_names=()
for line in "${sessions[@]}"; do
    session_names+=("${line%%:*}")
done

# Display console menu
echo -e "\n\033[36m--- Active tmux Sessions ---\033[0m"
for i in "${!sessions[@]}"; do
    printf " [%d] %s\n" "$((i + 1))" "${sessions[$i]}"
done

read -rp $'\nEnter number to attach (or Press Enter to exit): ' choice

# Validate input and attach to selected session
if [[ "$choice" =~ ^[0-9]+$ ]] && (( choice >= 1 && choice <= ${#session_names[@]} )); then
    selected_name="${session_names[$((choice - 1))]}"
    echo -e "\033[32mAttaching to session '$selected_name'...\033[0m"
    tmux attach-session -t "$selected_name"
else
    echo -e "\033[33mNo session selected. Exiting.\033[0m"
fi