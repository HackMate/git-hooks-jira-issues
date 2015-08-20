git-hooks-jira-issues
=====================

Git, like many version control systems provides triggers for custom scripts located under: [.git/hooks](http://git-scm.com/book/be/v2/Customizing-Git-Git-Hooks)

This project provides two hooks:

0. [prepare-commit-msg:](script/prepare-commit-msg) This hook adds the ticket/issue number based on branch name to the commit message. This hook parses for the default [JIRA issue key format](https://confluence.atlassian.com/display/JIRA/Changing+the+Project+Key+Format) in the current branch name and adds it to the commit message if it exists.

0. [commit-msg:](script/commit-msg) This hook, will reject all commit messages that do not contain a JIRA issue key with the [default format](https://confluence.atlassian.com/display/JIRA/Changing+the+Project+Key+Format).


Currently both hooks have been tested on Debian like systems, as well as on Windows with git-bash. Both hooks have some minor issues (see TODOs).

Installation
------------

Go to your git-repository and use the following commands to download the commit-msg hook to your .git/hooks/ repository:

    wget -P .git/hooks/ https://raw.github.com/HackMate/git-hooks-jira-issues/master/script/commit-msg && \
    chmod -v u+x .git/hooks/commit-msg

The following will do the same for the prepare-commit-msg hook:

    wget -P .git/hooks/ https://raw.github.com/HackMate/git-hooks-jira-issues/master/script/prepare-commit-msg && \
    chmod -v u+x .git/hooks/prepare-commit-msg



Notes:
------

* Both hooks are build in a way that they will export their functionality, if they are included per "source", eg. "source preprare-commit-msg".
* This project was also created in part to test out the light weight bash-testing functionality provided by [assert.sh](https://github.com/lehmannro/assert.sh). With ./runTests.sh all available tests can be executed.


TODO
----
* Make hooks handle the first commit on an empty repository.
* Make hooks optionally configurable to ignore certain branches (master, develop etc.)
