# Workflow

Ensure [pt-flow](https://github.com/balvig/pt-flow) is installed and up to date <img src="https://badge.fury.io/rb/pt-flow.svg?style=flat" alt="Gem Version">

## Stories

1. `git start` to pick a story to work on from [Pivotal Tracker]()
2. `git finish` if done to submit a pull request for [code review](/code-review)
3. After completing code review merge in GitHub and [deploy]()

## WIP branches

1. `git finish --wip` to submit a WIP pull request early to ask for help or feedback
2. Remove [WIP] from title when ready for review

## Bigger releases ("epics")

TODO: Release branches

# Deploying

## Migrations

1. create a migration-only PR in the `global` API repo
2. migration files must be checked into the API `global` repo
3. deploy the migration-only PR

