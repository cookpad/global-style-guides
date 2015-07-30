# I18n

For managing site translations we use [OneSky](http://oneskyapp.com).

Any features that introduce new text labels, we need to consider
tranlsations. Our current goal is to always release with English,
Spanish and Indonesian at minimum.


## Naming keys
1. Do not use shorthand syntax in views, but use fully qualified name.
   eg. `recipes.show.title` rather than `.title`

## Common keys
1. Very generic phrases can be scoped under `common.` eg. 'Delete' or
   'Cookpad' are good candidates for common

## Onesky Flow
1. `en.yml` is our working master.
   [Import](http://ospft7w.oneskyapp.com/admin/project-group/projects/project-group/4526) `en.yml` ONLY to
   onesky
2. After translations have been entered in onesky, download all locale
   files, test then commit to the repo.


![Onesky](https://github.com/cookpad/guides/blob/master/i18n/onesky.png)

## I18n Best Practices

### DON'T use the zero key to display a "no results" message.

This is a very common misuse of pluralization; the main misconception
being that we can use the value of the zero pluralization to display a
special message in our app. This is misleading for translators who might
not even have pluralizations in their locale (Chinese, Japanese etc…). A
no_results translation is always clearer and doesn't need to infer
meaning from a numeric value.

