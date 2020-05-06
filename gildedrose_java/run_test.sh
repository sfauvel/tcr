#!/bin/bash

# Run test and exit with 0 when sucess and 1 when fail.

# Execute tests
function run() {
    mvn test
}

# Run test and keep result in a variable
result="$(run)"
echo -e "$result"

# Identify when test fail or not
if [[ $result == *"BUILD FAILURE"* ]]; then
    exit 1
else
    exit 0
fi