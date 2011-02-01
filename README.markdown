# Contented
Contented aims to be an exceptionally stable and well-tested Rails app to serve
as a basis for launching new apps (particularly ones that need content such as a
blog, etc.) quickly without having to reinvent the wheel every time.


# Features
Currently there is only basic CRUD functionality in place for Articles and
Comments, but more functionality is forthcoming.

Contented is planned to add the following features in order of their perceived
necessity and utility to a generic content-driven application:

- Users
- Authentication (via AuthLogic: https://github.com/binarylogic/authlogic)
- Authorization (via CanCan: https://github.com/ryanb/cancan)
- Search
- Image attachment
- Video attachement
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


# Setup
Contented is setup and tested to use a PostgreSQL database.  Here's how to set it
up on a POSIX-like system:

### login as the postgres user
su - postgresql

### access the postgres console
psql

### create a new user with the password
create user contented with password "M394P455W0Rd!!!";

### create some databases
create database contented_development;
create database contented_test;

### grant permissions to the contented user
grant all privileges on database contented_development to contented;
grant all privileges on database contented_test to contented;

### run migrations from the Rails Root on the new database
rake db:migrate && rake db:migrate RAILS_ENV=test

### install the gem bundle
rake bundle:install


# Tests

## Rspec 2
Testing with Rspec 2 is used in a pretty straightforward manner here.

Run the entire suite with 'bundle exec rspec spec' from the application
root directory, or just use 'bundle exec rspec path/to/some/spec.rb' to
run individual specs.

I personally use the following BASH alias to save myself some time:
alias ber='bundle exec rspec spec -c --format nested' 

## Cucumber
Cucumber features are nested in subdirectories in /features based on the
controller or functionality to which they're relevant.  As such, it is
okay to run the entire suite from root using 'bundle exec cucumber', but
doing the same to run individual features (not immediately in /features)
will fail because the step definitions won't be required properly.

To properly run individual features that are nested within project
subdirectories, use the '--require features' flag from the application
root directory to properly require step definitions.

As with Rspec, I use a BASH alias to simplify the process:
alias bec='bundle exec cucumber --format pretty --require features'


# Contribute

##Test Coverage
Contented aims to be an *exceptionally well-tested* Rails application.  The goal
is to grow slowly and prioritize stability and longevity over speed.

Patches should be submitted with full Cucumber coverage, as well as RSpec
coverage at the Model, Controller, *and* View levels where it is sane to do so.

Please take a look at the existing test suite for a sense of the level to which
Contented is being tested.


##Workflow
If you have a patch or commit that you'd like to push upstream please fork
Contented, and submit a pull request to one the maintainers.  We'll let you
know if it's been accepted or if there's any additional work that needs to be
done before it's merged upstream.


##Maintainers (name/role/github)
Mike Zazaian (Petrified Shark Osciallator, Lycanthropic Turbine Engineer)
mkzzn

Derek Croft (Weasel Catapult Architect, Monkey Botulator, S(a)tan)
derekcroft
