# I18n

For managing site translations we use [OneSky](http://oneskyapp.com).

Any features that introduce new text labels, we need to consider
tranlsations. Our current goal is to always release with English,
Spanish and Indonesian at minimum.


## Naming keys
1. Do not use shorthand syntax in views, but use fully qualified name.
   eg. `recipes.show.title` rather than `.title`

## Onesky Flow
1. `en.yml` is our working master.
   [Import](http://ospft7w.oneskyapp.com/admin/project-group/projects/project-group/4526) `en.yml` ONLY to
   onesky
2. After translations have been entered in onesky, download all locale
   files, test then commit to the repo.

## Common keys
1. Very generic phrases can be scoped under `common.` eg. 'Delete' or
   'Cookpad' are good candidates for common
