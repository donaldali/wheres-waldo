# Where's Waldo

This is an implementation of the children's game [Where's Waldo (or Where's Wally)](http://en.wikipedia.org/wiki/Where's_Wally%3F) with a Rails back end and some front end JavaScript functionality for The Odin Project's [Project: Using a Rails Back End to Build "Where's Waldo" (a Photo Tagging App)](http://www.theodinproject.com/javascript-and-jquery/where-s-waldo-a-photo-tagging-app).

[**_Play it on Heroku_**](http://dna-wheres-waldo.herokuapp.com/ "Where's Waldo").

## Gameplay

Begin by providing a name (or play as a guest by providing a blank name), then select an image to find Waldo and friends from the 6 images of increasing difficulty.

In the main gameplay page, the characters you haven't yet found are shown on the right. Click a character you think you've found on the big image and select from the provided menu. Appropriate feedback will be provided and the gameboard updated as you find characters.
This is where the interaction between JavaScript on the front end and Rails on the back end takes place. JavaScript manipulates the menus and displays on the page and captures the player's selections, then makes Ajax requests to the Rails back end which knows where the characters are on an image.

After all characters are found, you are shown your score (how long it took you to find all characters) along with the top 20 scores for the board you have just played.

_Obviously, your score will greatly improve if you play the same image multiple times...consider your first score, your true score._

## Setup

To use locally, run `rake db:seed` after migrating your database to populate the database with the locations of all characters on all the images used to play the game.
