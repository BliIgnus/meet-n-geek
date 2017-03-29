# MEET-N-GEEK
Meet, and geek application, by Tom LECHAUX and Hugues RIEUBLANDOU
Project for the Web Application Course

**Table of Contents**
- [Introduction](#introduction)
- [Getting Started](#getting-started)
- [Installing](#installing)
  - [Prerequisites](#prerequisites)
  - [Installation steps](#installation-steps)
    - [Get the project](#get-the-project)
    - [Get the database](#get-the-database)
    - [Get databse access rights](#get-databse-access-rights)
  - [Launch the server](#launch-the-server)
- [User guide](#)
  - [Open the application](#open-the-application)
  - [Valid usernames and passwords](#valid-usernames-and-passwords)
  - [Disconnetion](#disconnetion)
- [Our work](#our-work)
  - [Files](#files)
  - [Main page](#main-page)
  - [Database](#database)
- [Evolutions](#evolutions)
  - [Security](#security)
  - [Webpages](#webpages)
  - [Message system](#message-system)


# INTRODUCTION

You'll find here our final project for the Web Application Course.
It is a social network for gamers, usefull for create game lobbies and find people with common games and taste to play with.

Also, it's design to have an extended social aspect to meet people, and make more than just teammates : make friends.


# GETTING STARTED
Meet and Geek application can be found on GitHub at BliIgnus/meet-n-geek

You can have a copy of the application by forking the project on GitHub

# INSTALLING

## Prerequisites
YOU MUST HAVE NODE.JS INSTALLED ON YOUR COMPUTER TO GET THIS APPLICATION WORKING. IF NOT, CHECK OUT https://nodejs.org/en/ AND FOLLOW INSTALLATION STEPS.

YOU MUST HAVE XAMPP INSTALLED ON YOUR COMPUTER TO GET THIS APPLICATION WORKING. IF NOT, CHECK OUT https://www.apachefriends.org/fr/download.html AND FOLLOW INSTALLATION STEPS.

## Installation steps
### Get the project
- Fork the project on GitHub
- Clone it on your computer with the "git clone" command line
- Open a shell command window
- Set the shell's current directory in the "meet-n-geek" folder (by the "cd" command line)
- Install the dependencies with the following command line: "npm install"

### Get the database
- Open the XAMPP Control Panel application
- Start the Appache and MySQL modules
- When both of them have load (green color) click on the MySQL Admin button : it will open the PhPMyAdmin interface
- On PhPMyAdmin, select "New database"
- Name it "meetngeek" and select create
- Then, select "Import". Click on "browse" and select the "meetngeek.sql" file you find on the meet-n-geek directory
- Import the database by clicking on execute

### Get databse access rights
- On PhPMyAdmin select the meetngeek database, then select "Privileges"
- Create a new user with "meetngeek" username and "meetngeek" password
- Change the hostname from % to "localhost"
- Be sure to give all privileges to this user

## Launch the server
- Set the shell's current directory in the "meet-n-geek" folder (by the "cd" command line)
- Launch the application with the following command line: "node server.js"

# USER GUIDE

## Open the application
In your favorite web browser, connect to the following adress :
http://localhost:8080/

You'll be redirected to the sign in page if you're not connected yet.

## Valid usernames and passwords
To connect, you can use one of the following couples of username-password :

1. Username: aldarick@orange.fr - Password: aldarick
2. Username: blignus@gmail.com - Password: blignus
3. Username: presea@gmail.com - Password: presea
4. Username: paupau@popo.com - Password: paupau

We didn't design the sign up webpage at the moment, but we build a few relations between the users.
We invite you to switch between user to see the main page change.

## Disconnetion
We didn't implement a disconnection function yet. To disconnect, just turn off, then on again the node server.

# OUR WORK

## Files
We work on the following files :
- README.md (this file)
- server.js (server code)
- main.ejs (main page)
- sign_in.ejs (sign_in page)
- public/css/style.css (CSS file)
- meetngeek.sql (database) public
- main_data.json (JSON data)    
- package.json (project info)
- modules/database.js (extract data from db)
- modules/functions.js (functions such as format data)
- modules/userSession.js (sign_in process)


## Main page
The main page as been entirely built by ourselves, without using any overlay.
It's based on CSS feed EJS files.
The based file is HTML code modified and feed by Javascript.

Only the main page as been made so far.
You can't for now access on a game page, or on an user page by cliking on it, but it will be featured in the future.

You can access to the Steam webpage of a game though, by cliking on the "Get on Steam" button.

Note that those links, and games images are harvested from the official Steam website by getting the Steam Game ID.
Game images are displayed directly with the link to steam servers of the image.

The Javascript, with the server.js file, use the information in the main_data.json file. This file is filled by JSON formated data, about the current user, and is account details (Games he owned, friends he got...).

## Database
All the user data are in a MySQL database. Those data have currently been fed by the end. At term, the database will be edit when a new user register, or when action are made by the user on the site.

Functions get the data from the database to edit the JSON file, feeding the site main page.

Sessions cookies are used to determine whether or not your browser is connected to the website.

A pre-fill JSON file as been built for earlier test. You can see how it been used by replacing the "main_data.json" file by the "main_data-TEST.json" (after removing "-TEST" from its name) file in the project repertory.

# EVOLUTIONS

## Security
Actually, no security is implemented, and password are stored in the main database. Security will be an important thing to implement in the future.

## Webpages
Only the website main page is currently working properly. Other webpages (user profile, sign in, sign up formular, game informations, settings, messagery...) will be futher developped and included in the project.

## Message system
A message system will also be implemented. It will include :
- Standard messagery (Facebook style)
- Chatrooms, private or pubic, on games, lobbies etc...
