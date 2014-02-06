Domain Logic
============

Revisit hexegonal architexture, which logic is core, and which is only in presentation?

Groups and Users
* what groups exist?
* what users belong to a group?
* is user a member of this group?
* adding a user to a group
* removing a user from a group
* can this user be added to this group?
* can this user be removed from this group?

Posts and Comments
* what are the posts for this group on this date?
* is there a post for this user on this group on this date?
* add a post for this user on this group on this date
* add a comment for this user on this post
* can a post be added for this user on this group on this date?
* can a comment be added for this user on this post?

Drive the design by demonstrating need for functionality with tests.

Tests are the first consumer of the domain.

Focus on exposing the API we want to support, hiding AR as much as we can.

Exercises
---------

Add the following logic to it using TDD:

1. Check if a user is a member of a group: `Group#is_member?(user)`
2. Add a user as a member of a group: `Group#add_member(user)`
3. Remove a user's membership in a group: `Group#remove_member(user)`
4. Retrieve the posts for a given day: `Group#posts_for(date)`
5. Retrieve a post for a given user and day: `Group#post_for(user, date)`
6. Add a new post: `Group#add_post(user, date, body)`
7. Add a new comment: `Post#add_comment(user, body)`
