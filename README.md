The Unofficial Trakehner Database
=======
Code Fellows Ruby on Rails bootcamp, Silver Class Project

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

Uses Rails 4.0.0 and Ruby 2.0.0p247.


Plan for the next couple of days (10/21/13)
=======
> ## 1. Write up the various use cases
> ## 2. Add use cases into sprint.ly
> ## 3. Implement users
> ## 4. Implement authentication
> ## 5. Implement horses


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
> * Implement Twitter Bootstrap
> * Implement minitest
> * Create a landing page (must get away from default Rails page!)
> * Set up and get auto-deploy from Travis to Heroku working
> * Get deployment to Heroku working directly (before implementing Travis auto-deploy)
> * Set up and get Travis testing working
> * Implement postgres for test, dev, and prod
> * Set up Nathaniel as collaborator on Github, Heroku, and Travis
> * Point Travis to Github repo
> * Link the trakehner-db app on Heroku to the Github repo
> * Initial commit of trakehner-db to Github
> * Create initial rails app for trakehner-db
> * Create the trakehner-db repo on github
> * Set up Heroku to point to custom domain, www.unofficialtrakehnerdatabase.com
> * Set up new Heroku app, trakehner-db.herokuapp.com
> * Use AWS for CNAME and DNS
> * Purchase domain, www.unofficialtrakehnerdatabase.com


