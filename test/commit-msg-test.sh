#!/bin/bash

source ../lib/assert.sh

EXPECTED_ERROR_CODE=198
EXPECTED_SUCCESS=0

resource_path=resources/commit-msg-test
commit_msg=../script/commit-msg

assert_raises "$commit_msg $resource_path/invalid_2013PROJECT-200"              $EXPECTED_ERROR_CODE
assert_raises "$commit_msg $resource_path/invalid_commit_msg_without_issue"     $EXPECTED_ERROR_CODE
assert_raises "$commit_msg $resource_path/invalid_FÖ-1"                         $EXPECTED_ERROR_CODE
assert_raises "$commit_msg $resource_path/invalid_loCA-200"                     $EXPECTED_ERROR_CODE
assert_raises "$commit_msg $resource_path/valid_FD-100"                         $EXPECTED_SUCCESS
assert_raises "$commit_msg $resource_path/valid_MY_EXAMPLE_PROJECT-9999"        $EXPECTED_SUCCESS
assert_raises "$commit_msg $resource_path/valid_PRODUCT_2013-234"               $EXPECTED_SUCCESS
assert_raises "$commit_msg $resource_path/valid_R2D2-876"                       $EXPECTED_SUCCESS

assert "$commit_msg $resource_path/invalid_2013PROJECT-200" "commit-msg: Aborting commit due to missing issue key"

assert_end $0
