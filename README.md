## INSTRUCTIONS

Create an app that
1. Gives users the ability to search and filter movie listings. Using any movie API of
your choice, e.g https://api.themoviedb.org/
2. Lists the various movies, showcasing a preview image, title, date of release, and a
detail page that is displayed on clicking each movie

# REQUIRED TASKS:

1. The app should connect to the sample API to asynchronously get the data. Only
use standard libraries and, only if the standard libraries do not provide needed
functionality, justify in the README file the choice of a 3rd party library
highlighting reasons, pros, and cons of the decision.
2. The app must display a list of all the available movies with the following details
○ Movie poster image
○ Title
○ Year of production
○ Director
3. When the user taps on one of the movies the app should open a detailed screen
that will display the
○ Movie title
○ Director
○ A full-width poster if available
○ All the other details available in the API payload
4. Users should be able to save favorite movies, this data should be available
between app sessions (i.e closing and reopening the app)
5. Users should be able to search
6. The app must be written in Flutter, the latest available version



## DESCRIPTION OF THE FEATURES OF THE CREATED APP

Based on the UI provided which can be gotten here https://www.figma.com/file/Iryrl5FrMaO9x3LtyUpXKG/movs_app?node-id=44%3A95, I was able to implement it to the teeth. Adding both saving and deleting feature to favourites.

# SAVING

Saving is achieved by first clicking on either the coming soon banner or the trending poster. This action will take you to a full screen description of the movie. clicking on the far right send icon will initiate an alert box where you will confirm if you want to save the movie to your favourite list. Saving a movie item that has already been saved will initiate an alert box that the movie has already been saved.

# DELETING

Clicking on the text button called 'My list', you will be routed to a screen showing all the movies you have saved to favourites. Holding down a movie poster will initiate an alert box where you will confirm if you want to delete the movie item from your favourite.



