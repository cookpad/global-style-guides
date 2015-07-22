# Working on stories

## Pivotal Tracker, GitHub, and PT-Flow

Ensure [pt-flow](https://github.com/balvig/pt-flow) is installed and up to date <img src="https://badge.fury.io/rb/pt-flow.svg?style=flat" alt="Gem Version">

### Flow

1. `git start` to pick a story to work on from [Pivotal Tracker]()
2. `git finish` if done to submit a pull request for [code review](#code-review)
3. After completing code review merge in GitHub and [deploy]()

### WIP branches

1. `git finish --wip` to submit a WIP pull request early to ask for help or feedback
2. Remove [WIP] from title when ready for review

### Bigger releases ("epics")

TODO: Release branches

## Code Review

Code review is [the discipline of explaining your code to your peers](https://www.youtube.com/watch?v=PJjmw9TRB7s).

### Purpose

1. Knowledge transfer
2. Increased team awareness
3. Finding alternative solutions

### Flow

1. Provide a description to help reviewers
  - For bugfixes provide screenshots / specs showing the bug
  - For features, provide a [demo gif](http://www.cockos.com/licecap/)
  - For new features, provide a hypothesis and expected outcome
2. Fix or address any [hound comments]()
3. Respond to reviewer comments w/ new commits or comments
4. Comment :recycle: after having made changes to ask for a new review
5. Merge + deploy after receiving a :thumbsup: from at least 1 reviewer

## Translation

TODO: Cover translation flow
