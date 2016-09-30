# Workflow

Ensure [pt-flow](https://github.com/balvig/pt-flow) is installed and up to date <img src="https://badge.fury.io/rb/pt-flow.svg?style=flat" alt="Gem Version">

## Stories

1. `git start` to pick a story to work on from [Pivotal Tracker]()
2. `git finish` if done to submit a pull request for [code review](/code-review)
3. After completing code review merge in GitHub and _deploy_

**NOTE:** It is vital to deploy right after merging new code, so that _you_ can follow up on any bugs/issues, instead of it becoming the problem of the next person to deploy.

## WIP branches

It can often be helpful to start _early_ with a WIP pull request to get
initial feedback.

1. `git finish --wip` to submit a WIP pull request early to ask for help or feedback
2. Remove [WIP] from title when ready for final review

## Bigger releases ("epics")

For bigger features that consist of multiple stories, it is a good idea to create a _release
branch_.  Reviewers will then be able to review each _smaller_ PR as they come in.

1. `git co -b my_new_epic` to start a release branch
2. `git commit -m'init commit' --allow-empty` to add an empty commit
3. `git push -u origin my_new_epic` to push to GitHub
4. Create a PR from the new branch with information about the feature
5. Running `git start` and `git finish` from a release branch will automatically target that branch instead of master

## Discussions, ideas, new features, bug reports

- Submit a card on [Trello](https://trello.com/b/mlFCj2Zs/features-on-the-table) if you would like to start a general discussion/brainstorm on something
- Submit an issue on GitHub if you would like to discuss something technical
- Submit stories to Pivotal Tracker when they are more fully formed with hypothesis and design (or steps to reproduce for bugs)
