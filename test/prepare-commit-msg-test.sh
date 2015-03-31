#!/bin/bash

source ../lib/assert.sh

# We import the functions, since they are easier to test.
source ../script/prepare-commit-msg

# Note: prepare-commit-msg may parse strings containing what could be considered an invalid key, but it will only return
#       the valid part.

assert "parse_issue_key invalid_commit_msg_without_issue"   ""
assert "parse_issue_key prefix/MY_EXAMPLE_PROJECT-9999"     "MY_EXAMPLE_PROJECT-9999"
assert "parse_issue_key PROJECT-200-postfix"                "PROJECT-200"
assert "parse_issue_key 2013PROJECT-200"                    "PROJECT-200"
assert "parse_issue_key PRODUCT_2013-234"                   "PRODUCT_2013-234"
assert "parse_issue_key loCA-200"                           "loCA-200"
assert "parse_issue_key invalid_FÖ-1"                       ""

# Carefull, this will only work on the master!
skip_if "! git --version"
assert "branch_name"    "master"

# On a valid branch_name, add it as prefix, without changing the message.
mock_function "branch_name" "echo 'ID-12345'"
file_input=$(create_tmp_file "# just a comment")
assert "prepare_commit_msg $file_input && cat $file_input" "ID-12345 # just a comment"

# On an invalid branch_name, return the input message untouched.
mock_function "branch_name" "echo 'invalid_branch_name'"
file_input=$(create_tmp_file "# just a comment")
assert "prepare_commit_msg $file_input && cat $file_input" "# just a comment"
file_input=$(create_tmp_file "# line1
# line2")
assert "prepare_commit_msg $file_input && cat $file_input" "# line1\n# line2"


assert_end $0
