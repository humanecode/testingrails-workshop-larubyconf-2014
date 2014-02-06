Test Data & Fixtures
====================

Daily Standup App
-----------------

* Had Groups of Users
* Users can have a Membership to a Group
* Group Members can create a Post for a day
* Users can comment on a Post

* Create TODO list for features

(let's skip ahead and not use tdd for this section)

    $ rails g model group name
    $ rails g model membership group_id:integer user_id:integer
    $ rails g model post group_id:integer user_id:integer date:date body:text
    $ rails g model comment post_id:integer user_id:integer body:text

Sexy Migrations
---------------

* Use `references`

Foxy Fixtures
-------------

* Use names for references

Keep simple test data set, adjust or create specific edge cases in test setup.

No more than 12 records in a fixture, try for 3-7.

Exercises
---------

Create fixtures for the following models, adding AR associations as needed:

1. 3 Group fixtures (dev, ops, empty)
2. 3 new User fixtures (author, member, nonmember)
3. 3 Membership fixtures (author/member in dev, nonmember in ops)
3. 2 Post fixtures (today, yesterday)
4. ~4 Comment fixtures across posts

Load the fixtures into your development database using the following rake task:

1. `rake db:fixtures:load`
