## v0.3.15
- Add/pass view specs for primary nav link activation

## v0.3.14
- Add/pass specs for show_flash helper
  
## v0.3.13
- Move nav helpers dedicated file
- Add/pass helper specs for ActionParser helpers

## v0.3.12
- Add ActionParser, add/pass model specs for it
- Integrate new style and layout from downstream 'Incentive'
- Move categories from primary nav to categories/sidebar partial

## v0.3.11
- display 'Uncategorized' link in sidebar when uncategorized articles exist

## v0.3.10
- add uncategorized articles landing page
- add link to uncategorized articles page on show view for uncategorized articles

## v0.3.9
- add/pass specs for associated category link on show article view

## v0.3.8
- add basic destroy functionality to categories
- categorized articles are uncategorized on category deletion
- refactored uncategorized? article logic into categorized?

## v0.3.7
- refactor all cuke steps to use resource transforms where pertinent
- remove commit hashes from all versions in HISTORY

## v0.3.6
- modify 'wip' and 'default' cucumber profiles
- add 'todo' cucumber profile and use to tag unpassed features not in progress 

## v0.3.5
- strip out extraneous 'get all categories' logic from controller specs
- move category sidebar fetch logic into view and spec accordingly
- add view spec for articles/_form.html.haml and fetching Category.all  

## v0.3.4
- Add/pass all article/category selection scenarios
- Add category selection dropdown and handling to articles form
- Add model/view handling of uncategorized articles

## v0.3.3
- Add/pass feature for site branding redirecting to homepage

## v0.3.2
- Add/pass feature to assert presence of homepage articles

## v0.3.1
- Test/implement simple version module in /extras

## v0.3.0
- Completed implementation of sitewide categories sidebar partial
- Copmleted and tested all categories features
