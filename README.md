# Rails Travel Tracker App

## Overview

This App allows you to track cities and countries you have visited and rank your visit. You can see where other users have visited and the most popular places to visit both by rating and by number of visitors.

### Logging In
On the main page, you must sign up or log in to add visits, cities, or countries. You can still see other user's visits and the countries/cities ranked without logging in. Once you have logged in, you will be on your user page which will display all cities you have visited and allow you to add cities.

---
### New Visit
Once you log in, you can add places you have visited using the "Add a Visit" link in the navigation bar. You must enter a rating for every visit along with a city and country. You may add a city by selected from one already created or creating a new city and country. A new visit will not be saved if you only enter a city or if you only enter a country.

---
### Home
The home link will bring you back to the main page that you saw before logging in. It displays all of the users and the places they have visited.

---
### New City
You can also add a city without adding a visit. Each city must be associated with a country. Cities cannot be a duplicate of a city that has already been created.

---
### New Country
You can also add a country without adding a visit. Countries cannot be duplicates of countries that already exist.

---
### Most Visited Country
This link in the navigation bar will display the country that has the total most visits and the cities of that country.

---
## Installation
To use the application locally, fork and clone the repo. Then run `bundle install` from the directory. Next run `rake db:migrate` to load the databases. Then, run `rails s` and navigate to `localhost:3000` in your browser.

---

## Contributing
Feel free to submit a pull request.

---

## License

This is created with a MIT license.
