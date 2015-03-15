git-hooks-jira-issues
=====================

Git, like many version control systems provides triggers for custom scripts located under: [.git/hooks](http://git-scm.com/book/be/v2/Customizing-Git-Git-Hooks)

This project provides two hooks:


0. [prepare-commit-msg:](script/prepare-commit-msg) This hook adds the ticket/issue number based on branch name to the commit message. This hook parses for the default [JIRA issue key format](https://confluence.atlassian.com/display/JIRA/Changing+the+Project+Key+Format) in the current branch name and adds it to the commit message if it exists.

0. [commit-msg:](script/commit-msg) This hook, will reject all commit messages that do not contain a JIRA issue key with the [default format](https://confluence.atlassian.com/display/JIRA/Changing+the+Project+Key+Format).


Installation
------------

Got to your git-repository and copy both hooks located under script/ into the .git/hooks folder.

