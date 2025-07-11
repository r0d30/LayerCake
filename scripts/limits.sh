#!/usr/bin/env bash
# limits.sh - LayerCake project limits and constraints checker
# Copyright (c) 2024-2025 Rodrigue Noel (r0d30)

# Maximum file sizes (in lines)
MAX_ASM_FILE_SIZE=2000
MAX_HEADER_SIZE=500
MAX_DOC_SIZE=5000
MAX_SCRIPT_SIZE=200

# Maximum project complexity
MAX_TOTAL_FILES=100
MAX_NESTING_DEPTH=5
MAX_FUNCTION_SIZE=50

# Code quality limits
MAX_LINE_LENGTH=120
MAX_COMMENT_GAP=10
MIN_COMMENT_RATIO=0.15

# Performance constraints
MAX_COMPILE_TIME=30  # seconds
MAX_MEMORY_USAGE=512 # MB
MAX_BINARY_SIZE=10   # MB

echo "LayerCake Project Limits and Constraints"
echo "========================================"
echo ""
echo "File Size Limits:"
echo "  Assembly files: $MAX_ASM_FILE_SIZE lines"
echo "  Header files: $MAX_HEADER_SIZE lines"
echo "  Documentation: $MAX_DOC_SIZE lines"
echo "  Scripts: $MAX_SCRIPT_SIZE lines"
echo ""
echo "Project Complexity:"
echo "  Total files: $MAX_TOTAL_FILES"
echo "  Nesting depth: $MAX_NESTING_DEPTH"
echo "  Function size: $MAX_FUNCTION_SIZE lines"
echo ""
echo "Code Quality:"
echo "  Line length: $MAX_LINE_LENGTH characters"
echo "  Comment gap: $MAX_COMMENT_GAP lines"
echo "  Comment ratio: $MIN_COMMENT_RATIO"
echo ""
echo "Performance:"
echo "  Compile time: $MAX_COMPILE_TIME seconds"
echo "  Memory usage: $MAX_MEMORY_USAGE MB"
echo "  Binary size: $MAX_BINARY_SIZE MB"

# Check current project against limits
check_limits() {
    echo ""
    echo "Current Project Status:"
    echo "======================="
    
    # Count files
    total_files=$(find . -name "*.asm" -o -name "*.sh" -o -name "*.md" -o -name "*.txt" | wc -l)
    echo "Total files: $total_files/$MAX_TOTAL_FILES"
    
    # Check largest files
    echo ""
    echo "Largest files:"
    find . -name "*.asm" -o -name "*.md" -o -name "*.txt" | head -10 | while read file; do
        lines=$(wc -l < "$file" 2>/dev/null || echo 0)
        echo "  $file: $lines lines"
    done
}

if [ "$1" = "--check" ]; then
    check_limits
fi
