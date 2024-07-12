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
We've got our data read in from the Yelp API, and then Kris stored that data in an SQL database. Using Flask, we will read information on that database and store it on a webpage. Once it is read in and hosted, we will incorporate some JavaScript and HTML (using leaflet) to create the visualizations on that webpage.


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
(insert text here)

