# Contented

## About
Contented aims to be an exceptionally stable and well-tested Rails app to serve
as a basis for launching new apps (particularly ones that need content such as a
blog, etc.) quickly without having to reinvent the wheel every time.


## Features
Currently there is only basic CRUD functionality in place for Articles and
Comments, but more functionality is forthcoming.

Contented is planned to add the following features in order of their perceived
necessity and utility to a generic content-driven application:

- Users
- Authentication (via AuthLogic: https://github.com/binarylogic/authlogic)
- Authorization (via CanCan: https://github.com/ryanb/cancan)
- Search
- Avatars
- Image attachments (via Dragonfly: https://github.com/markevans/dragonfly)
- Video attachement
- URL Slugs (via friendly_id: https://github.com/norman/friendly_id)
- RSS
- Mailer/notifications
- Favorites (articles)
- Likes (articles/comments)
- Pageview counter
- other kewl stuff
 
If you'd like to see any of these features in particular implemented please
tell us.  Ideas for new features are always welcome as well and may be
prioritized based on the need and whether your feature concept seems like it
would be immediately useful to the goal of the project.


##Setup

###PostgreSQL
Contented is setup and tested to use a PostgreSQL database.  To set it up on a
POSIX-like system go to a BASH shell and enter the following:

**login as the postgres user**  
_su - postgresql_

**access the postgres console**  
_psql_

**create a new user with the password**  
_create user contented with password "M394P455W0Rd!!!";_

**create some databases**  
_create database contented_development;_  
_create database contented_test;_

**grant permissions to the contented user**  
_grant all privileges on database contented_development to contented;_  
_grant all privileges on database contented_test to contented;_


###Rake Tasks
With the database setup exit out of the psql prompt, and then the postgresql
user, and navigate to the root directory of Contented.  Then run:

**run migrations from the Rails Root on the new database**  
_rake db:migrate && rake db:migrate RAILS_ENV=test_

**install the gem bundle**  
_rake bundle:install_


##Tests

###Rspec 2
Testing with Rspec 2 is used in a pretty straightforward manner here.

Run the entire suite with **'bundle exec rspec spec'** from the application
root directory, or just use **'bundle exec rspec path/to/some/spec.rb'** to
run individual specs.

**I personally use the following BASH alias to save myself some time:**   
_alias ber='bundle exec rspec -c --format nested'_

### Cucumber
Cucumber features are nested in subdirectories in /features based on the
controller or functionality to which they're relevant.  As such, it is
okay to run the entire suite from root using **'bundle exec cucumber'**, but
doing the same to run individual features (not immediately in /features)
will fail because the step definitions won't be required properly.

To properly run individual features that are nested within project
subdirectories, use the **'--require features'** flag from the application
root directory to properly require step definitions.

**As with Rspec, I use a BASH alias to simplify the process:**   
_alias bec='bundle exec cucumber --format pretty --require features'_


##Contribute

###Test Coverage
Contented aims to be an **exceptionally well-tested** Rails application.  The goal
is to grow slowly and prioritize stability and longevity over speed.

Patches should be submitted with full Cucumber coverage, as well as RSpec
coverage at the Model, Controller, *and* View levels where it is sane to do so.

Please take a look at the existing test suite for a sense of the level to which
Contented is being tested.


###Workflow
If you have a patch or commit that you'd like to push upstream please fork
Contented, and submit a pull request to one the maintainers on a topic branch.  We'll
let you know if it's been accepted or if there's any additional work that needs to be
done before it's merged upstream and/or into the master branch.


##Maintainers (github)

###Mike Zazaian (mkzzn)
###Derek Croft (derekcroft)
