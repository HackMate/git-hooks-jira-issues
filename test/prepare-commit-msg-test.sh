#!/bin/bash

source ../lib/assert.sh

# We import the functions, since they are easier to test.
source ../script/prepare-commit-msg

# Note: prepare-commit-msg may parse strings containing what could be considered an invalid key, but it will only return
#       the valid part.

assert "parse_issue_key invalid_commit_msg_without_issue"   ""
assert "parse_issue_key valid_MY_EXAMPLE_PROJECT-9999"      "MY_EXAMPLE_PROJECT-9999"
assert "parse_issue_key invalid_2013PROJECT-200"            "PROJECT-200"
assert "parse_issue_key valid_PRODUCT_2013-234"             "PRODUCT_2013-234"
assert "parse_issue_key invalid_loCA-200"                   "CA-200"
assert "parse_issue_key valid_R2D2-876"                     "R2D2-876"
assert "parse_issue_key invalid_FÖ-1"                       ""
assert "parse_issue_key valid_FD-100"                       "FD-100"

# Carefull, this will only work on the master!
skip_if "! git --version"
assert "branch_name"    "master"

# On a valid branch_name, add it as prefix, without changing the message.
mock_function "branch_name" "echo 'ID-12345'"
assert "prepare_commit_msg '# just a comment'" "ID-12345: # just a comment"

# On an invalid branch_name, return the input message untouched.
mock_function "branch_name" "echo 'invalid_branch_name'"
assert "prepare_commit_msg '# just a comment'" "# just a comment"
assert "prepare_commit_msg '# line1\n# line2'" "# line1\n# line2"


assert_end $0
