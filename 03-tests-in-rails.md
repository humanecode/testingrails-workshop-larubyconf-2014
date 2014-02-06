Writing Tests in Rails
======================

TDD
---

* Red
* Green
* Refactor

Who has done it?

What does it _feel_ like?

API Inception
-------------

* An API within an API
* Design in the small
* Component boundaries
* AR as an internal API

(whiteboard)

Exercises
---------

Create User::ValidTest file (test/models/user/valid_test.rb)

Create the following test methods *before* adding the validations to User:

1. test that a User is invalid without email
2. test that a User is invalid with an existing email
