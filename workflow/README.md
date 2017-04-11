# Workflow

Ensure [trello_flow](https://github.com/balvig/trello_flow) is installed and up to date <img src="https://badge.fury.io/rb/trello_flow.svg?style=flat" alt="Gem Version">

## Stories

1. `git start` to pick/create a story to work on in Trello
2. `git finish` if done to submit a pull request for [code review](/code-review)
3. If necessary, [request and update translations](https://github.com/cookpad/global-web/blob/master/docs/operations.md#translations)
4. After completing code review merge in GitHub and _deploy_

**NOTE:** It is vital to deploy right after merging new code, so that _you_ can follow up on any bugs/issues, instead of it becoming the problem of the next person to deploy.

## WIP branches

It can often be helpful to start _early_ with a WIP pull request to get
initial feedback.

1. `git finish --wip` to submit a WIP pull request early to ask for help or feedback
2. Remove [WIP] from title when ready for final review

## Bigger releases ("epics")

For bigger features that consist of multiple stories that need to be released together, create a _release
branch_.  Reviewers will then be able to review each _smaller_ PR as they come in.

1. `git co -b my_new_epic` to start a release branch
2. `git commit -m'init commit' --allow-empty` to add an empty commit
3. `git push -u origin my_new_epic` to push to GitHub
4. Create a PR from the new branch with information about the feature
5. Running `git start` and `git finish` from a release branch will automatically target that branch instead of master

## Discussions and ideas around development

New ideas on how we can improve our development flow are always welcome!

- Avoid making proposals for new coding styles inside story-based PRs
- When proposing a change or new concept, submit an issue or isolated PR on GitHub
- Clearly show the before/after and any pain points that inspired the proposal
- Allow the issue or PR to sit long enough for everyone to have a look
- The [kaizen board](https://trello.com/b/dpyiKTut/kaizen) is a good place to go for "known pain points"
