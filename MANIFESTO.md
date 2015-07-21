Based on a couple of discussions we've had recently, it seems there may be a few gaps between how we think about code review and quality, mainly "what is the purpose of code reviews?", and "what is good code?".

I think we'll have a much better time if we all share the same vision, so consider this an honest attempt to address the issue and "sell" one viewpoint.
My hope is that we're already mostly on the same page (or that I can somehow convince anyone on the fence :grin:), but of course any discussion is welcome and encouraged!

__NOTE:__ I'll try to focus on _mindset_ to avoid getting bogged down in details, but I also recognize the need for some sort of manual/best practices/style guide, so this repo will serve as the place for that going forward.

# Outline

- [What is the purpose of code reviews?](#what-is-the-purpose-of-code-reviews)
  1. Knowledge transfer
  2. Increased team awareness
  3. Finding alternative solutions
- [What is "gode code"?](#what-is-good-code)
  1. Simple to understand
  2. Readable
- [Why does readability matter?](#why-does-readability-matter)
  1. Once a commit is merged it's everyone's code
  2. It saves time
  3. It only takes a few cut corners to ruin something beautiful
  4. It's more fun!
- [What makes code readable?](#what-makes-code-readable)
  1. Writing less code
  2. Breaking code into smaller, simpler pieces
  3. Using great naming


# What is the purpose of code reviews?

I'll summarize here, but think everyone should watch [this video](https://www.youtube.com/watch?v=PJjmw9TRB7s), as it talks not only about the _why's_ but also the _how's_ of having a great code review culture.

It also highlights an important point: Code reviews are _not about finding bugs_:

> Code review is the discipline of explaining your code to your peers

In fact, code review is [proven to not be effective at catching bugs](http://research.microsoft.com/apps/pubs/default.aspx?id=180283). Instead the primary focus should be:

1. Knowledge transfer
2. Increased team awareness
3. Finding alternative solutions

# What is "good code"?

Ie, what "alternative solutions" are we trying to find?
Many answers to this of course, but the two characteristics I think most of the time trump all are:

1. Simple to understand
2. Readable

These two are very intertwined of course. "Understandability" is about the _simplicity of the concept itself_, "readability" is about _how that concept is presented_ in the form of code. I'll just refer to them both as "readability" below.

# Why does readability matter?

As long as the code works, is secure, and provides value to the users, does it matter how it reads...?
Well...the thing is...

#### 1. Once a commit is merged it's _everyone's code_

When releasing a new feature, you're essentially releasing it to 2 groups of users:

1. The users of the _website_
2. The users of the _code_ (ie other devs)

We should be as concerned with making the product released to group 2 easy to use and understand, as we are with the product released to group 1. That's why when people don't understand code I wrote, I always think of it as _my responsibility_ to remedy this, either by:

1. Reworking the code so no explanation is necessary (preferred)
2. Using pull requests to show code examples, screenshots etc (can be necessary _in support of_ 1.)

#### 2. It saves time

Time you spend improving code readability is time your coworker or future self saves. I really love this [blog about "easy" vs "simple"](https://jml.io/2012/02/simple-made-easy.html):

> Focusing on ease and ignoring simplicity means that you'll go really fast in the beginning, but will become slower and slower as the complexity builds.

> Focusing on simplicity will mean that you'll go slower in the beginning, because you'll have to do some work to simplify the problem space, but your rate of development will remain at a high constant.

#### 3. It only takes a few cut corners to ruin something beautiful

Writing code requires compromises, but is also a constant battle against cruft. If we start to think of compromising as being the default, we will lose that battle.

It will never be perfect and we all have to strike a balance and make progress at the same time, but a pull request is a critical moment for deciding whether to compromise or go the extra mile to make things better.

#### 4. It's more fun! :sunny:

In my opinion, being able to every day work with code that is simple, readable, and beautiful is just _so much more fun_ than the alternative. In fact, if I'm being honest, probably the main reason I'm so annoyingly passionate about this, is that it has a direct influence on how much I can enjoy my work.

I can give you any number of "business-level" reasons for the value of investing in simple code, but in the end the biggest motivator for me is that I want to continue to have fun working on this project for many years to come!


# What makes code readable?

Achieving this of course is a huge subject, but I believe that there are currently 3 main things that have been a recurring theme in the feedback seen in pull requests:

#### 1. Writing _less code_

Sounds stupid maybe, but I think this is probably the number one effective hack to keep things simple: Always try to do less!

Some questions to ask:

- "Do we really need that feature (or part of a feature)?"
- "Can we do something less complicated that will work just as well?"
- "This seems really hard/like too much work, is there a different approach I've overlooked?"
- "What's the simplest possible thing I could do here?"
- "Does Rails/Ruby already do something that I can make use of?"

#### 2. Breaking code into _smaller, simpler pieces_

I sometimes hear the argument: "but the feature itself is complex, that's why the code is complex". First check of course is as above: Try to do something less complicated. However, I believe even with bigger features, a lot of the time it can be a matter of _breaking things into smaller pieces_. A car is an incredibly complex system, but if you take me through it bit by bit starting with the wheels there's a better chance I'll understand :car:

In fact, I find I can often squint at a chunk of code to get an idea about its complexity. For example if I see something like this:

![Code blobs](https://dl.dropboxusercontent.com/u/3032793/blobs.png)

...I expect I may be in for a rough time. If I see this instead:

![Structured code](https://dl.dropboxusercontent.com/u/3032793/structure.png)

...at least I know I'll be able to go through bit by bit and the amount of information I have to parse at a time is reduced.

A basic guideline would be:

1. Prefer short, focused methods (aim for 1-liners, longer than 5 is a red flag)
2. Prefer small, focused classes (100+ lines is a red flag)

This goes hand in hand with:

#### 3. Using _great naming_

We all know this, but I think it bears repeating: Good naming is hard, but makes a _huge_ difference for the reader trying to understand a piece of code.

A very basic example from a recent PR:

```ruby
def show_country_suggestion?
  redirected_from_japan? || region_from_ip && Region.current.country_code != region_from_ip.country_code
end
```

Not that complicated, but still takes a while to understand when to show the country suggestion. Compare with:

```ruby
def show_country_suggestion?
  redirected_from_japan? || not_viewing_suggested_region?
end

private

  def not_viewing_suggested_region?
    suggested_region && Region.current != suggested_region
  end
```

It's more lines of code, but I can at a glance know that the suggestion dialog is shown, if the user is viewing a region different from the one we suggest. If I want to know the details of when/how that suggestion is made, I can continue to look at the private methods.

![Stop](https://33.media.tumblr.com/639c56ff91b20e19411b998c8622f53c/tumblr_msjlzfgOy11sgmt4po1_400.gif)
