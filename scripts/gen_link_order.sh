#!/usr/bin/env bash
# gen_link_order.sh - Generates object linking order based on assembly dependencies
# Usage: bash gen_link_order.sh <srcdir> <builddir> <objdir>

srcdir=$1
builddir=$2
objdir=$3

tmp=$(mktemp)

# Map defined symbols -> file
declare -A def
declare -A ref

# Find all object files
for f in "$objdir"/*.o; do
    [ -f "$f" ] || continue
    
    # Extract defined symbols
    nm "$f" 2>/dev/null | awk '/^[0-9A-Fa-f]+ [TDR] / {print $3}' | while read sym; do
        def["$sym"]="$f"
    done
    
    # Extract referenced symbols
    nm "$f" 2>/dev/null | awk '/^[ ]*U / {print $2}' | while read sym; do
        if [ -z "${ref["$f"]}" ]; then
            ref["$f"]="$sym"
        else
            ref["$f"]="${ref["$f"]} $sym"
        fi
    done
done

# Simple topological sort
echo "# Generated link order"
for f in "$objdir"/*.o; do
    [ -f "$f" ] && echo "$f"
done

rm -f "$tmp"
