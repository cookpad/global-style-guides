# Code Review

Code review is [the discipline of explaining your code to your peers](https://www.youtube.com/watch?v=PJjmw9TRB7s).

## Purpose

- Knowledge transfer
- Increased team awareness
- Finding alternative solutions

## Flow

1. Write a description to provide context for reviewers
  - Why are we doing this? What's the intended outcome?
  - For bugfixes provide screenshots / specs showing the bug
  - For features, provide a [demo gif](http://www.cockos.com/licecap/)
  - Provide a link to relevant GitHub issue where appropriate
2. Fix or address any hound comments
3. Respond to reviewer comments w/ new commits or comments
4. Comment :recycle: after having made changes to ask for a new review
5. Merge + deploy after receiving an approved review from at least 1 reviewer

### Reviewing Code

- Be aware of _negativity bias_. Ask, don't tell.
- Identify ways to simplify the code while still solving the problem
- Communicate which ideas you feel strongly about and those you don't
- Consider switching to Slack/Zoom if higher bandwith communication is needed
- Use the GitHub review tool: Only use _approve_ or _changes requested_ so your intention is clear
- Follow up on changes you request
- Help get the PR to a state where it can be approved

### Having Your Code Reviewed

- Try to keep PRs focused on _one concept_
- Keep PRs _short_, ideally 50-100 lines
- Incomplete features are fine, for example submitting a pending spec for review is welcome
- Be grateful for the reviewer's suggestions
- Don't take it personally. The review is of the code, not you.
- Explain why the code exists and try to rework the code so no explanation is necessary ("It's like that because of these reasons. Would it be more clear if I rename this class/file/method/variable?")
- Merge only once you feel confident in the code and its impact on the project.
