[![Build Status](https://travis-ci.org/sprestage/trakehner-db.png?branch=master)](https://travis-ci.org/sprestage/trakehner-db)[![Code Climate](https://codeclimate.com/github/sprestage/trakehner-db.png)](https://codeclimate.com/github/sprestage/trakehner-db)[![Dependency Status](https://gemnasium.com/sprestage/trakehner-db.png)](https://gemnasium.com/sprestage/trakehner-db)

The Unofficial Trakehner Database
=======
Code Fellows Ruby on Rails Bootcamp Class Project

Collaborators:  Susan Prestage, Nathaniel Barnes


Project Idea
=======
To implement a website for the Trakehner horse enthusiast, with emphasis for the Trakehner breeders.


Motivation
=======
Performing the research on the bloodlines of various Trakehners can be very tedious.  Almost none of the historical Trakehners
have pages, so most of the horses in a given pedigree have no links to further information, just a name.  As a horse breeder,
I want to easily look up pertinent data (pedigree, performance records, photos, inspection results, etc) for every ancestor and
every decendant of any given Trakehner horse.  I want this accessible on the web.  I want it fast and easy.  I want it available
for everyone to read.  I want only the owner of a horse to be able to change/enter data.  It should not be possible for a user
to delete a horse entirely, this should probably be an admin task to correct for gross mistakes or duplications.

This site is my solution to those problems.


Technical Details
=======

Uses Rails 4.0.1 and Ruby 2.0.0p353.


Deployment
=======
This project has been deployed to Heroku and can be found here: http://sprestage-trakehner-db.herokuapp.com.
Heroku also points to the custom domain http://www.unofficialtrakehnerdatabase.com which is now live!

Environment
=======
Solr and Sunspot are required to be installed and running on your system
to run this application.  You can do this with the following commands.
You may be able to skip the first step (not sure about this), since the
/config/sunspot.yml file is already checked into this repo.
<pre>
    > rails g sunspot_rails:install
    > rake sunspot:solr:start        <- this starts in the dev environment only
    > rake sunspot:reindex
</pre>
To run in the test environment, run the following:
<pre>
    > RAILS_ENV=test rake sunspot:solr:start
    > RAILS_ENV=test rake sunspot:reindex
    > RAILS_ENV=test rake sunspot:solr:stop
</pre>

Open Questions
=======
* Authentication with Devise, OmniAuth, or both.  Best guess is both.  Possibly starting with Devise and then
adding OmniAuth later.  Not sure yet.  -sprestage Wed, 10/23


Plan for the next couple of days (10/30/13)
=======
>
    [ ] Write up the various use cases
    [ ] Add use cases into sprint.ly
    [ ] Implement users <- implement this while implementing Devise
    [ ] Implement Devise authentication
    [ ] Implement OmniAuth


To Do List
=======
> ##home page:
>>      * login for Trakehner owners to add/modify horse pedigree
>>      * search for Trakehner horse by name, registry number

> ##show page (these might need to be broken into separate pages):
>>      * show individual horse pedigree
>>      * show all current stallions
>>      * show all children given either parent name or registry number

> ##stretch goal, probably out of scope
>>      * scrape all existing pedigree data from ATA website
>>      * scrape existing pedigree data from Trakehner Verband website (mostly in German)

> ##authentication and authorization
>>      * must have valid login (authentication)
>>      * must have authorization to alter data (authorization)


To Do List (completed items)
=======
>
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

