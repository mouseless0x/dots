#!/bin/bash

EVENT="$1"

# Get tmux session name (fallback if not in tmux)
TMUX_SESSION=$(tmux display-message -p '#S' 2>/dev/null || echo "no-tmux")

case "$EVENT" in
    UserPromptSubmit)
        # Record start time
        echo $(date +%s) > "/tmp/claude-start-$TMUX_SESSION"
        ;;
    Stop)
        # Calculate duration
        START_FILE="/tmp/claude-start-$TMUX_SESSION"
        if [[ -f "$START_FILE" ]]; then
            START=$(cat "$START_FILE")
            NOW=$(date +%s)
            ELAPSED=$((NOW - START))
            MINS=$((ELAPSED / 60))
            SECS=$((ELAPSED % 60))
            DURATION="${MINS}m ${SECS}s"
            rm "$START_FILE"
        else
            DURATION="unknown"
        fi

        dialog --notification \
            --title "Claude Code [$TMUX_SESSION]" \
            --message "Done in $DURATION"
        ;;
    Notification)
        dialog --notification \
            --title "Claude Code [$TMUX_SESSION]" \
            --message "Needs attention"
        ;;
esac
