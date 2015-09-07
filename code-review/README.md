# Code Review

Code review is [the discipline of explaining your code to your peers](https://www.youtube.com/watch?v=PJjmw9TRB7s).

## Purpose

- Knowledge transfer
- Increased team awareness
- Finding alternative solutions

## Flow

1. Write a description to provide context for reviewers
  - For bugfixes provide screenshots / specs showing the bug
  - For features, provide a [demo gif](http://www.cockos.com/licecap/)
  - For new features, provide a [hypothesis and expected outcome](http://www.thoughtworks.com/es/insights/blog/how-implement-hypothesis-driven-development)
2. Fix or address any [hound comments]()
3. Respond to reviewer comments w/ new commits or comments
4. Comment :recycle: after having made changes to ask for a new review
5. Merge + deploy after receiving a :thumbsup: from at least 1 reviewer

### Reviewing Code

- Be aware of  _negativity bias_. Ask, don't tell.
- Identify ways to simplify the code while still solving the problem.
- Communicate which ideas you feel strongly about and those you don't.
- Consider switching to Slack/Hangouts if higher bandwith communication is needed
- Sign off on the pull request with a :thumbsup:

### Having Your Code Reviewed

- Be grateful for the reviewer's suggestions.
- Don't take it personally. The review is of the code, not you.
- Explain why the code exists and try to rework the code so no explanation is necessary ("It's like that because of these reasons. Would it be more clear if I rename this class/file/method/variable?")
- Merge once you feel confident in the code and its impact on the project.
