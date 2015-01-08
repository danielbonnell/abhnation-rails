User Stories for The Abh Nation
====
#### USER CRUD OPS: HOME PAGE

As a user, I want to see the main page, so that I can navigate through the site.
Acceptance Criteria:
* [X] - I see the title of the website.
* [X] - I see the top bar nav menu.

#### USER CRUD OPS: REGISTER, LOG IN, LOG OUT

As a user, I want to register an account, so that I can view restricted content.
Acceptance Criteria:
* [X] - I have an option to register an account
* [X] - I must supply a username, email, and password.
* [X] - I am redirected to my account overview upon successful registration.
* [ ] - ~~I must confirm my email address.~~
* [ ] - ~~If I don’t confirm my email address within 24 hours, my account will be deleted.~~
* [X] - I see an error message if my registration credentials are invalid.

As a user, I want to log in, so that I can view restricted content.
Acceptance Criteria:
* [X] - I have an option to log in.
* [X] - I see an error message if my log in credentials are invalid.
* [X] - I see my avatar if I am logged in.
* [X] - I have an option to edit my profile if I am logged in.

#### USER CRUD OPS: EDIT PROFILE AND AVATAR

As an authenticated user, I want to log out, so that I others can’t access my account.
Acceptance Criteria:
* [X] - I have an option to log out.
* [X] - I no longer see my avatar if I am logged out.
* [X] - I no longer have an option to edit my profile if I am logged out.
* [X] - I no longer have an option to sign out if I am logged out.

As an authenticated user, I want to edit my profile, so that I can distinguish myself from other users.
Acceptance Criteria:
* [X] - I can update my name.
* [X] - I can update my location.
* [X] - I can update my age.
* [X] - I can update my website.

As an authenticated user, I want to edit my email, so that I can continue using my account when I get a new email address.
Acceptance Criteria:
* [X] - I can update my email address.
* [X] - I see an error if my new email address is invalid.
* [ ] - ~~I must confirm my email address.~~
* [ ] - ~~If I don’t confirm my email address within 24 hours, it will not be saved.~~

As an authenticated user, I want to opt out of using a custom avatar, because I don’t want to distinguish myself from other users.
Acceptance Criteria:
* [ ] - If my email address doesn’t have a Gravatar associated with it, I see the default avatar.

As an authenticated user, I want to use my Gravatar for my avatar, so that I can distinguish myself from other users.
Acceptance Criteria:
* [ ] - I see my Gravatar if the email address I used to register has a Gravatar associated with it.

As an authenticated user, I want to use an image from another site for my avatar, so that I can distinguish myself from other users.
Acceptance Criteria:
* [ ] - I have an option to use an image from another site as my avatar.
* [ ] - I see an error if the link I supplied is not a valid image format (jpg, gif, png).
* [ ] - I see an error if the file size of the link I supplied is too large.
* [ ] - I see the linked image I supplied as my new avatar.

As an authenticated user, I want to upload an image for my avatar, so that I can distinguish myself from other users.
Acceptance Criteria:
* [X] - I have an option to upload an image from my computer as my avatar.
* [X] - I see an error if the file I supplied is not a valid image format (jpg, gif, png).
* [X] - I see an error if the file size of the image I supplied is too large.
* [X] - I see the image I supplied as my new avatar.

#### USER CRUD OPS: REGISTER AND LOG IN WITH SOCIAL MEDIA

As a user, I want to register an account using my Google account, so that I don’t have to remember another login.
Acceptance Criteria:
* [ ] - I can register an account using Google.
* [ ] - I will be required to select a username.
* [ ] - I will see an error if my registration credentials are invalid.
* [ ] - I will see my account profile if I have successfully registered.
* [ ] - I will not be required to confirm my email address.

As a user, I want to register an account using my Facebook account, so that I don’t have to remember another login.
Acceptance Criteria:
* [ ] - I can register an account using Facebook.
* [ ] - I will be required to select a username.
* [ ] - I will see an error if my registration credentials are invalid.
* [ ] - I will see my account profile if I have successfully registered.
* [ ] - I will not be required to confirm my email address.

As a user, I want to register an account using my Twitter account, so that I don’t have to remember another login.
Acceptance Criteria:
* [ ] - I can register an account using Twitter.
* [ ] - I will be required to select a username.
* [ ] - I will see an error if my registration credentials are invalid.
* [ ] - I will see my account profile if I have successfully registered.
* [ ] - I will not be required to confirm my email address.

As a user, I want to log in using my Google account, so that I don’t have to remember another login.
Acceptance Criteria:
* [ ] - I can log in with Google.

As a user, I want to log in using my Facebook account, so that I don’t have to remember another login.
Acceptance Criteria:
* [ ] - I can log in with Facebook.

As a user, I want to log in using my Twitter account, so that I don’t have to remember another login.
Acceptance Criteria:
* [ ] - I can log in with Twitter.

#### USER CRUD OPS: VIEW ARTICLES

As a user, I want to view articles, so that I can learn more.
Acceptance Criteria:
* [ ] - I can see the title, category or subcategory, text, and author (if included) of an article.

As an authenticated user, I want to view restricted articles, so that I can learn more.
Acceptance Criteria:
* [ ] - I can’t see a link to the article in the nav bar unless I have authenticated.
* [ ] - If I navigate to the path of the article I see a 404 error unless I have authenticated.
* [ ] - I can see the title, category or subcategory, text, and author (if included) of an article if I have authenticated.

As a user, I want view a larger version of an image from an article, so that I can see the details more clearly.
Acceptance Criteria:
* [ ] - I can see a larger version of the image in an image viewer.
* [ ] - I can see just the image file itself in a new tab or window.
* [ ] - I can close the image viewer.
* [ ] - If there are multiple images in the same article, I can page through them in an image viewer.

#### ADMIN CRUD OPS: ADMIN PANEL

As an admin, I want to view the admin panel, so that I can see what tools are available to me.
Acceptance Criteria:
* [ ] - I can view the main page of the admin panel only if I am logged in and have admin access.
* [ ] - If I am not logged in or don’t have admin access, I can’t see a link to the admin panel in the side bar.
* [ ] - If I am not logged in or don’t have admin access, I get a 404 error when visiting the admin namespace.

#### ADMIN CRUD OPS: MODIFY USERS

As an admin, I want to view a list of all users, so that I can see who is using the site.
Acceptance Criteria:
* [ ] - I can see a paginated list of users.
* [ ] - I can order the list by name, date joined, rank (admin, moderator, user, restricted, banned), or email address.

As an admin, I want to view a list of all users, so that I can edit their profiles.
Acceptance Criteria:
* [ ] - I can edit the profile information of any user, including their username and rank.

As an admin, I want to view a list of all users, so that I can delete their accounts.
Acceptance Criteria:
* [ ] - I can delete a user’s account.

As an admin, I want to add new users to my site, for testing purposes.
Acceptance Criteria:
* [ ] - I can add a new user account.
* [ ] - I will not be required to confirm the email address of the new account.

#### ADMIN CRUD OPS: MODIFY CATEGORIES

As an admin, I want to view a list of all categories and subcategories, so that I can see what type of content the site has.
Acceptance Criteria:
* [ ] - I see a paginated list of categories ordered by name.
* [ ] - I can expand a category to see its subcategories.
* [ ] - I can collapse a category to hide its subcategories.

As an admin, I want to edit a category or subcategory, so that it better represents the content under it.
Acceptance Criteria:
* [ ] - I can edit the name of a category inline.
* [ ] - I can edit the name of a subcategory inline.

As an admin, I want to delete a category or subcategory, so that I can remove unused categories from the site.
Acceptance Criteria:
* [ ] - I can delete a category from the list.
* [ ] - I can delete a subcategory from the list.

As an admin, I want to view the details of a category or subcategory, so that I can see which articles belong to it.
Acceptance Criteria:
* [ ] - I can view a paginated list of articles that belong to a category ordered by name.
* [ ] - I can view a paginated list of articles that belong to a subcategory ordered by name.

As an admin, I want to create a new category, so that the site is better organized.
Acceptance Criteria:
* [ ] - I can create a new category.
* [ ] - The category must have a unique name.
* [ ] - I see an error if the specified name is already taken.

As an admin, I want to create a new subcategory, so that the site is better organized.
Acceptance Criteria:
* [ ] - I can create a new subcategory.
* [ ] - The subcategory must have a unique name.
* [ ] - The subcategory must belong to a parent category.
* [ ] - I see an error if the specified name is already taken.
* [ ] - I see an error if I fail to specify a parent category.

#### ADMIN CRUD OPS: MODIFY ARTICLES

As an admin, I want to view a list of articles, so that I see what content the site has.
Acceptance Criteria:
* [ ] - I can see a paginated list of all articles ordered by name.
* [ ] - I can see a paginated list of all articles ordered by category.

As an admin, I want to create an article, so that I can add new content to the site.
Acceptance Criteria:
* [ ] - I must specify a title.
* [ ] - I must specify a category or subcategory.
* [ ] - I must specify text for the article.
* [ ] - I see an error if I fail to specify a title, category or subcategory, or there is no text.
* [ ] - I can use markdown to format the article as I please.
* [ ] - I can include linked images in the article.
* [ ] - I can select whether or not to display the author of the article (user_id).
* [ ] - I see a link to the article in the nav bar under its category or subcategory.

As an admin, I want to edit an article, so that I can keep the site up to date.
Acceptance Criteria:
* [ ] - I can edit the title.
* [ ] - I can edit the category or subcategory.
* [ ] - I can edit the text.
* [ ] - I can delete images that belong to the article.
* [ ] - I can add new images to the article.
* [ ] - I see an error if I fail to specify a title, category or subcategory, or if the there is no text.
* [ ] - I can use markdown to format the article as I please.
* [ ] - I can include linked images in the article.
* [ ] - I can select whether or not to display the author of the article (user_id).
* [ ] - I see a link to the article in the nav bar under its category or subcategory.

As an admin, I want to delete an article, so that I can keep the site up to date.
Acceptance Criteria:
* [ ] - I can delete an article from the site.

~~As an admin, I want to upload images to include in the text of an article, so that I can increase the value of the article.~~
~~Acceptance Criteria:~~
* [ ] - ~~I can upload an image file from my computer to the site.~~
* [ ] - ~~I can choose to display the full-sized image in the article text.~~
* [ ] - ~~I can choose to include a thumbnail of the image in the article text.~~
* [ ] - ~~I can select the size of the thumbnail.~~
* [ ] - ~~I see an error if the image file size is too large.~~
* [ ] - ~~I see an error if the file is not a valid format (jpg, png, gif).~~

#### ADMIN CRUD OPS: MODIFY IMAGE GALLERIES

As an admin, I want to view a list of image galleries, so that I can see what galleries the site has.
Acceptance Criteria:
* [ ] - I can see a paginated list of all galleries ordered by name.
* [ ] - I can see a paginated list of all galleries ordered by category.

As an admin, I want to add a gallery, so that I can keep the site up to date.
Acceptance Criteria:
* [ ] - I must specify the title and category or subcategory.
* [ ] - I may optionally specify a description.
* [ ] - I see an error if I fail to specify a title, category, or subcategory.
* [ ] - I see a link to the image gallery in the nav bar under its category or subcategory.

As an admin, I want to edit a gallery, so that I can keep the site up to date.
Acceptance Criteria:
* [ ] - I can edit the title, category or subcategory, and description.
* [ ] - I see an error if I fail to specify a title, category, or subcategory.
* [ ] - I see a link to the image gallery in the nav bar under its category or subcategory.

As an admin, I want to delete a gallery, so that I can keep the site up to date.
Acceptance Criteria:
* [ ] - I can delete a gallery from the site.

As an admin, I want to add images to a gallery, so that I can keep the gallery organized.
Acceptance Criteria:
* [ ] - I can upload new images to the gallery.
* [ ] - I see an error if an image file type is invalid (jpg, gif, png).
* [ ] - I see an error if an image file size is too large.
* [ ] - I see the newly added images in the gallery.

As an admin, I want to delete images from a gallery, so that I can keep the gallery organized.
Acceptance Criteria:
* [ ] - I can delete images from a gallery.
* [ ] - I no longer see the deleted images in the gallery.

As an admin, I want to reorder images in a gallery, so that I can keep the gallery organized.
Acceptance Criteria:
* [ ] - I can order the images in the gallery by file name or upload time.
* [ ] - I see the images in the right order.

~~As an admin, I want to batch upload images to a gallery, so that I can be more efficient.~~
~~Acceptance Criteria:~~
* [ ] - ~~When adding images to a gallery, I can batch upload images.~~
* [ ] - ~~I see an error if an image file type is invalid (jpg, gif, png).~~
* [ ] - ~~I see an error if an image file size is too large.~~
* [ ] - ~~I see the newly uploaded images in the gallery.~~

#### ADMIN CRUD OPS: RESTRICTING ACCESS

As an admin, I want to restrict access to articles to authenticated users, so that I can keep select content private.
Acceptance Criteria:
* [ ] - I can require a user to authenticate to view an article.

As an admin, I want to restrict access to galleries to authenticated users, so that I can keep select content private.
Acceptance Criteria:
* [ ] - I can require a user to authenticate to view a gallery.
