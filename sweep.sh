#!/bin/bash
# Local stand-in for the repository's build workflow: compile every definition, then replay every capture.
export RUNNER_TEMP=/tmp

echo "COMPILING"
bad=0
total=0
for program in $(find . -name '*.p4'); do
    total=$((total + 1))
    if ! p4c-bm2-ss "$program" -o /tmp/compile.json >/dev/null 2>&1; then
        bad=$((bad + 1))
        echo "  COMPILE FAIL $program"
    fi
done
echo "  compiled $((total - bad)) of $total, failures $bad"

echo
echo "REPLAYING"
pass=0
fail=0
for test in .github/tests/test_*.py; do
    if python3 "$test" >/tmp/replay.out 2>&1; then
        pass=$((pass + 1))
    else
        fail=$((fail + 1))
        echo "  FAILED $test"
        grep -E '^(FAILED|Ran|AssertionError|OSError)' /tmp/replay.out | tail -3 | sed 's/^/      /'
    fi
done
echo
echo "  test files passed $pass  failed $fail"
