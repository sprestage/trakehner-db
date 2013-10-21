
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

Uses Rails 4.0.0 and Ruby 2.0.0.


Initial plans
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


Plan for the next couple of days (10/15/13)
=======
> ## 1. Write up the various use cases.
> ## 2. Name the project and start a github repository and transfer the ideas that are being collected into a read me.
> ## 3. Add use cases into sprint.ly
> ## 4. Figure out the various planning and  implementation decisions: db (postgres?), testing (minitest?), sprint.ly?, etc.
