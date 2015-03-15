#!/bin/bash

# Run all scripts under test/ that end with *-test.sh
cd test/
for test in $(ls -1 *-test.sh); do
    echo "Running: $test"
    bash $test
done
