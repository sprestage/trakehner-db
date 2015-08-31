[![Build Status](https://travis-ci.org/sprestage/trakehner-db.png?branch=master)](https://travis-ci.org/sprestage/trakehner-db) [![Code Climate](https://codeclimate.com/github/sprestage/trakehner-db.png)](https://codeclimate.com/github/sprestage/trakehner-db) [![Dependency Status](https://gemnasium.com/sprestage/trakehner-db.png)](https://gemnasium.com/sprestage/trakehner-db)  [![Security Status](http://rails-brakeman.com/sprestage/trakehner-db.png)](http://rails-brakeman.com/sprestage/trakehner-db) [![endorse](https://api.coderwall.com/sprestage/endorsecount.png)](https://coderwall.com/sprestage)
[![Coverage Status](https://coveralls.io/repos/sprestage/trakehner-db/badge.svg?branch=master&service=github)](https://coveralls.io/github/sprestage/trakehner-db?branch=master)

The Unofficial Trakehner Database
=======
Code Fellows Ruby on Rails Bootcamp Class Project

Collaborators:  Susan Prestage, Nathaniel Barnes


Project Idea
=======
To implement a website for the Trakehner horse enthusiast, with emphasis for Trakehner breeders.


Motivation
=======
Performing research on the bloodlines of various Trakehners can be
very tedious.  Almost none of the historical Trakehners have pages,
so most of the horses in a given pedigree have no links to further
information, just a name.  As a horse breeder, I want to easily look
up pertinent data (pedigree, performance records, photos, inspection
results, etc) for every ancestor and every decendant of any given
Trakehner horse.  I want this accessible on the web.  I want it fast
and easy.  I want it available for everyone to read.  I want only the
owner of a horse to be able to change/enter data.  It should not be
possible for a user to delete a horse entirely, this should probably
be an admin task to correct for gross mistakes or duplications.

This site is my solution to those problems.


Technical Details
=======

Updated to use Rails 4.2 and Ruby 2.1.4.


Deployment
=======
This project has been deployed to Heroku and can be found here: http://sprestage-trakehner-db.herokuapp.com.
Heroku also points to the custom domain http://www.unofficialtrakehnerdatabase.com.

Policy and roles plan
=======

<pre>
Five roles:

    visitors to the site -  can look and search horses and breeders;
                            cannot see new h/b, edit h/b, delete h/b,
                            cannot see sign up anywhere.
                            sign up new users is only by email to me and
                            Nathaniel...this is the way the ATA does it.
    owners -    can see edit horses they own only (will eventually include
                  editing horse
                owner info)
                cannot see new h/b, edit breeder, delete h/b
    breeders -  can edit self
                cannot see new h/b, edit horse, edit breeders other than
                self cannot see delete horse/breeder, sign up
    ata -   can see edit horse and edit breeder
            cannot see new or delete h/b (we should reconsider this when
            the time comes)
    admin - me and Nathaniel
            can see all the things
</pre>


Testing
=======

To run the tests, type the following at the command line:
~~~~
  $ rake test
~~~~
Note: <code>rake test:all</code> was deprecated as of rails 4.2.

To run a single test file, do this:
~~~~
  $ rake test test/features/admin/admin_test.rb
~~~~

If you get a message like this:
~~~~
  rake aborted!
  PG::ConnectionBad: could not connect to server: Connection refused
      Is the server running on host "localhost" (::1) and accepting
      TCP/IP connections on port 5432?
~~~~
your postgresql is probably not running.  This can be checked using:
~~~~
  $ pg_ctl -D /usr/local/var/postgres status
~~~~
To start postgresql, use a command like this:
~~~~
  $ pg_ctl -D /usr/local/var/postgres -l ~/postgres-server.log start
~~~~


Common runtime errors seen
=======
This one is caused by having no horses in the database.
~~~~
  Showing /Users/susan/Documents/myProjects/codefellows/trakehner-db/app/views/home/index.html.erb where line #17 raised:

  undefined method `image_url' for nil:NilClass
~~~~
Fix by running
~~~~
  $ rake db:seed
~~~~


To Do List (completed items)
=======
    [x] Implement horses
    [x] Implement AWS S3 hosting of horse images
    [x] Implement Twitter Bootstrap
    [x] Implement minitest
    [x] Create a landing page (must get away from default Rails page!)
    [x] Set up and get auto-deploy from Travis to Heroku working
    [x] Get deployment to Heroku working directly (before implementing Travis auto-deploy)
    [x] Set up and get Travis testing working
    [x] Implement postgres for test, dev, and prod
    [x] Set up Nathaniel as collaborator on Github, Heroku, and Travis
    [x] Point Travis to Github repo
    [x] Link the trakehner-db app on Heroku to the Github repo
    [x] Initial commit of trakehner-db to Github
    [x] Create initial rails app for trakehner-db
    [x] Create the trakehner-db repo on github
    [x] Set up Heroku to point to custom domain, www.unofficialtrakehnerdatabase.com
    [x] Set up new Heroku app, trakehner-db.herokuapp.com
    [x] Use AWS for CNAME and DNS
    [x] Purchase domain, www.unofficialtrakehnerdatabase.com

Presentation Bragging Points
=======

###Environment
    [x] Travis and Heroku continuous deployment.
    [x] Live site (unofficialtrakehnerdatabase.com), through NameCheap.com
    [x] Use AWS for CNAME and DNS
    [x] AWS S3 hosting of all horse images.
    [x] Image upload by user (stores on AWS).
    [x] Using PostgreSQL

###Look and Feel
    [x] Twitter Bootstrap.

###Testing
    [x] Testing with minitest
    [x] Code coverage checking with SimpleCov is at 85%.

###Features
    [x] Scrape existing pedigree data from ATA (American Trakehner) website.
    [x] Sorting by horse and breeder names.
    [x] Search by horse and breeder substring.

    [x] search by image present
    [x] code climate
    [x] case-insensitive and substring searching
    [x] pedigree and progeny
    [x] list all of a breeder's horses
    [x] link to breeder from show horse page
    [x] link to horses from breeder's page
    [x] about, with pro links
    [x] contact page
    [x] policies so only admin can create, edit, destroy
    [x] implemented simple_form on edit/new horse pages
    [x] i18n support for translations!!!  Yeay!!!

