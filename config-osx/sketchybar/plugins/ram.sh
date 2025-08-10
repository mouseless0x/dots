#!/bin/sh

# Get memory statistics
MEMORY_STATS=$(vm_stat)

# Get page size (should be 16384 on modern Macs)
PAGESIZE=16384

# Extract values - using exact field positions from vm_stat output
ACTIVE=$(echo "$MEMORY_STATS" | grep "^Pages active:" | awk '{print $3}' | tr -d '.')
WIRED=$(echo "$MEMORY_STATS" | grep "^Pages wired down:" | awk '{print $4}' | tr -d '.')
INACTIVE=$(echo "$MEMORY_STATS" | grep "^Pages inactive:" | awk '{print $3}' | tr -d '.')
SPECULATIVE=$(echo "$MEMORY_STATS" | grep "^Pages speculative:" | awk '{print $3}' | tr -d '.')
COMPRESSED=$(echo "$MEMORY_STATS" | grep "^Pages occupied by compressor:" | awk '{print $5}' | tr -d '.')

# If compressed is empty, use zero
[ -z "$COMPRESSED" ] && COMPRESSED=0
[ -z "$ACTIVE" ] && ACTIVE=0
[ -z "$WIRED" ] && WIRED=0
[ -z "$INACTIVE" ] && INACTIVE=0
[ -z "$SPECULATIVE" ] && SPECULATIVE=0

# Calculate used memory (active + wired + compressed) 
USED_PAGES=$((ACTIVE + WIRED + COMPRESSED))
USED_BYTES=$((USED_PAGES * PAGESIZE))

# Get total memory in bytes
TOTAL_BYTES=$(sysctl -n hw.memsize)

# Calculate percentage
RAM_PERCENT=$(echo "scale=0; ($USED_BYTES * 100) / $TOTAL_BYTES" | bc)

# Ensure we have a valid percentage
if [ -z "$RAM_PERCENT" ] || [ "$RAM_PERCENT" = "0" ]; then
    # Calculate used including inactive pages
    TOTAL_USED=$((ACTIVE + WIRED + INACTIVE + SPECULATIVE + COMPRESSED))
    TOTAL_USED_BYTES=$((TOTAL_USED * PAGESIZE))
    RAM_PERCENT=$(echo "scale=0; ($TOTAL_USED_BYTES * 100) / $TOTAL_BYTES" | bc)
fi

# Use text instead of icon
sketchybar --set "$NAME" icon="RAM" label="${RAM_PERCENT}%"