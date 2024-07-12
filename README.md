![Header Image](Images/denver.png "Title Tile")
=============================

...but a taste of what's to come...

You'll need to install psycopg like any other Python
package, using ``pip`` to download it from PyPI_::

    $ pip install psycopg2

OVERVIEW & PURPOSE
- 
A visualization of restaurants and hotels within the metropolitan area of Denver, Colorado.


Instructions on how to use and interact with the project
-
The project begins with retrieving data from the Yelp API, which is then systematically stored in an SQL database. Using Flask, we will access and read this stored data to dynamically generate and serve the relevant information on a webpage. Once the data is successfully hosted, we will leverage JavaScript and HTML, specifically using the Leaflet library, to develop interactive and visually engaging map-based visualizations. These visualizations will provide users with an intuitive and comprehensive overview of restaurants, hotels, and other points of interest in the Denver metropolitan area.

At least one paragraph summarizing efforts for ethical considerations made in the project
- 
In the course of this project, we have made several ethical considerations, particularly regarding the inclusion of cannabis/marijuana businesses in our search results. Denver, Colorado, is known for its legal cannabis industry, and while some users may find value in this information, others may prefer it to be excluded. Therefore, we have ensured that our application provides an option to filter out cannabis/marijuana businesses based on user preference. This approach respects the diverse needs and values of our users, promoting inclusivity and respect for different viewpoints.

One of the key ethical considerations in our project is deciding whether or not to include cannabis/marijuana businesses in our search results. Denver, Colorado, has a legal cannabis industry, and the presence of these businesses can be a point of contention for various users. Here are the considerations we made regarding this issue:

Inclusivity and Respect for Users' Preferences:

- Some users may find value in knowing the locations of cannabis businesses, either for patronage or to avoid them. Providing an option to include or exclude these businesses respects the diverse preferences and needs of our user base.
Public Perception and Legal Context:

- While cannabis is legal in Colorado, it remains a regulated substance, and the perception of its inclusion in searches can vary widely among users, especially those from regions where it remains illegal or socially stigmatized.
Transparency and User Control:

- Allowing users to toggle the visibility of cannabis businesses promotes transparency and gives them control over their search results. This empowers users to customize their experience according to their comfort levels and needs.
Impact on Business Owners:

- Including cannabis businesses in the search results can provide them with visibility and support from users who are looking for these services. Conversely, giving users the option to exclude them also respects the privacy and comfort of users who prefer not to engage with these businesses.

  
Implementation
To address these ethical considerations, we have implemented a feature that allows users to filter out cannabis/marijuana businesses from the search results. This ensures that users have the choice and flexibility to view the information that is most relevant and appropriate for them.


Code Adjustments: Here’s how you can implement the toggle feature for cannabis businesses...
-- 
Flask Route
--> app/routes.py

HTML
--> templates/index.html

JavaScript
--> static/js/logic.js

This implementation provides a way for users to toggle the visibility of cannabis businesses on the map, giving them control over their experience while ensuring ethical considerations are met.







  
References for the data source(s)
-
(insert text here)

  
References for any code used that is not your own
-
<a href='https://pngtree.com/freepng/natural-hills-and-mountains_4103445.html'>png image from pngtree.com/</a>


Project Workflow
-

**__1. Project Initialization__**:
Create a New Repository:
Create a new repository on GitHub named denver-viz.
Clone the repository to your local machine.
Set Up Project Directory:
Create a directory structure for the project:

**__2. Data Retrieval and Storage__**:
Retrieve Data from Yelp API:
Use the Yelp API to fetch data for restaurants and hotels in the Denver metropolitan area.
Set Up SQL Database:
Create an SQL database to store the data retrieved from the Yelp API.
Define models for restaurants, hotels, and cannabis businesses using SQLAlchemy.

**__3. Flask Application Development__**:
Initialize Flask Application:
Set up a Flask app in app/__init__.py.
Configure the Flask app in config.py.
Define routes for the web application in app/routes.py.
Create database models in app/models.py.
Populate the Database:
Write a script to populate the database with data from the Yelp API.

**__4. Frontend Development__**:
Create HTML Template:
Design an HTML template (index.html) to display the map and controls.
Add CSS for Styling:
Write CSS to style the map and controls in static/css/style.css.
Implement JavaScript with Leaflet:
Write JavaScript to initialize the map, add markers, and implement layer controls in static/js/logic.js.

**__5. Integrate Frontend with Backend__**:
Render Data on the Map:
Use Flask to pass data from the database to the frontend.
Render the map with markers for restaurants, hotels, and optionally cannabis businesses.

**__6. Implement User Interactions__**:
Add Controls for Filtering Data:
Implement controls to toggle the visibility of cannabis businesses on the map.
Update the map based on user interactions.

**__7. Testing and Deployment__**:
Test the Application:
Test the web application locally to ensure all features work correctly.
Deploy the Application:
Deploy the Flask application to a hosting service (e.g., Heroku).

**__8. Ethical Considerations__**
Decide on Displaying Cannabis Businesses:
Make an informed decision on whether to include or exclude cannabis businesses in the visualization.
