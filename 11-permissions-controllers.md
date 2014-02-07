Permissions in Controllers
==========================

Did you know we can use helpers in our controllers?

Questions
---------

* How should a controller behave if an author tries to create a new post?
* How should a controller behave if a nonmember tries to create a new post?
* How should a controller behave if an anonymous user tries to create a new post?
* Won't this make our controllers more complicated?
* How can we manage this complexity?

Exercises
---------

Write separate PostsController tests for the following user roles:

1. Author: User that is a group member with a post for the day
2. Member: User that is a group member without a post for the day
3. Nonmember: User that is not a group member
4. Anonymous: User that is not logged in
