Entity Validation
=================

What to test in model tests, and why?

Focus on API we are exposing to the rest of the app, tests are one consumer, as are the presentation tier, admin section, are background tasks.

How do we translate validations to business rules? Let's think about and discuss the following:

* User is not valid without email, name
* Group is not valid without name
* Membership is not valid without group/user
* Post is not valid without group/user/date, body
* Comment is not valid without post, user, body

Exercises
---------

Add validations using TDD to the following models

1. test that a Group is invalid without name
2. test that a Membership is invalid without unique group/user
3. test that a Post is invalid without unique group/user/date
4. test that a Post is invalid without body
5. test that a Comment is invalid without post
6. test that a Comment is invalid without user
7. test that a Comment is invalid without body
