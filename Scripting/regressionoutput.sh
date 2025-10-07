#!/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

basedir="/home/kjlee_t@oppstar.local/Desktop/haha/MyChip/Regression/080925"

output_file="$basedir/summary.txt"

total_test_result=0
pass_test=0
fail_test=0


if [ -d "$basedir/Passed" ]; then
    pass_test=$(find "$basedir/Passed" -type f -name "*.out" | wc -l)
fi

if [ -d "$basedir/Failed" ]; then

    fail_test=$(find "$basedir/Failed" -type f -name "*.out" | wc -l)

fi

total_test_result=$((pass_test + fail_test))

if [ "$total_test_result" -gt 0 ]; then
    passingrate=$(awk "BEGIN {printf \"%.2f\", ($pass_test/$total_test_result)*100}")

else
    passingrate="0.00"
fi

{

    echo "Regression Summary"
    echo "=================="
    echo "Regression date          : $(basename "$basedir")"
    echo "Total test cases         : $total_test_result"
    echo "Passed                   : $pass_test"
    echo "Failed                   : $fail_test"
    echo "Passing rate (%)         : $passingrate"
    echo ""
    echo "Failing buckets:"
    
    for item in "$basedir/Failed"/*/; do

        [ -d "$item" ] || continue

        error_type=$(basename "$item")

        count=$(find "$item" -type f -name "*.out" | wc -l)

        echo "  - $error_type: $count"

    done

} > "$output_file"

echo "Summary written to $output_file"

