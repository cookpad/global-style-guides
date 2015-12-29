# I18n

For managing site translations we use [OneSky](http://oneskyapp.com).

Any features that introduce new text labels, we need to consider
tranlsations. Our current goal is to always release with English,
Spanish and Indonesian at minimum.


## Usage
- Use fully qualified name. eg. `recipes.show.title` rather than shorthand `.title`
- Scope _very_ generic phrases under `common.` eg. 'Delete' or 'Cookpad' are good candidates for common
- Don't use `zero:` key to display a "no results" message (it is intended only to allow proper grammar)
- Don't reuse a key for a different translation

## Onesky Flow
1. `en.yml` is our working master.
   [Import](http://ospft7w.oneskyapp.com/admin/project-group/projects/project-group/4526) `en.yml` ONLY to
   onesky
2. After translations have been entered in onesky, download all locale
   files, test then commit to the repo.


![Onesky](https://github.com/cookpad/guides/blob/master/i18n/onesky.png)
