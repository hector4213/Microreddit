 <p align="center">
 <img src='/images/header.png' height='100'>
 </p>


![Heroku](https://pyheroku-badge.herokuapp.com/?app=ninteddit&style=plastic)

A minaturized version of reddit on rails, nintendo style. Check it out [here](https://ninteddit.herokuapp.com/)

## Table of contents

- [Table of contents](#table-of-contents)
  - [Features](#features)
  - [Screenshots](#Screenshots)
  - [Tech](#technologies-used)
  - [Deployment](#deployment)
  - [ERD](#entity-relationship-diagram)


---


## Features

### User Accounts and Registration

Users can signup, with a unique username and email, password are hashed with bcrypt and stored in the database.

<div align="center">
    <img src="/images/homepage.png"</img>
</div>

### Commenting

Comments are a great way for users to interact, replying to other users comments enhances user interaction even more.

<div align="center">
    <img src="/images/nestedcomment.png"</img>
</div>

### Profile and statistics

A User profile shows their account creation date , post count as well as points.

<div align="center">
    <img src="/images/profile.png"</img>
</div>

### Voting

Users have the ability to vote on both posts and comments

<div align="center">
    <img src="/images/voting.gif"</img>
</div>

### Searching posts

Posts can be search by title

<div align="center">
    <img src="/images/search.gif"</img>
</div>




Thanks to the simplicity and magic of Ruby on Rails, users of Micro reddit can:

- Register and login

- Create, Read, Update or Delete their posts

- Create, Read, Update or Delete their comments

- Posts as well as comments can be upvoted

- Post links to external URL's (like reddit)


- Profiles show total posts made and total points for their posts.

## Screenshots

Screens go here.

## Technologies Used

[<img src='https://github.com/hector4213/hector4213/blob/main/icons/ruby.png' height='100'>]() [<img src='https://github.com/hector4213/hector4213/blob/main/icons/rails.png' height='100'>]() [<img src='https://img.icons8.com/color/344/postgreesql.png' height='100'>]() [<img src='https://img.icons8.com/color/344/javascript.png' height='100'>]() [<img src='https://user-images.githubusercontent.com/5305599/49061716-da649680-f254-11e8-9a89-d95a7407ec6a.png' height='100'>]() 


## Deployment

[<img src='https://img.icons8.com/nolan/344/heroku.png' height='100'>]()

## Entity Relationship Diagram

By default Rails ships with SQLite3, personal preference made me change the dialect to Postgres

<p align="center">
<img src='/images/erd.png' />
 </p>
