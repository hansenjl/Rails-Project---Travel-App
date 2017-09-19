# Specifications for the Rails with jQuery Assessment

Specs:
- [x] Use jQuery for implementing new requirements
- [x] Include a show resource rendered using jQuery and an Active Model Serialization JSON backend.
    **City show view uses jQuery to render views and allow the user to view the next and previous city.

- [x] Include an index resource rendered using jQuery and an Active Model Serialization JSON backend.
    **Country index view uses jQuery to show/hide the cities belonging to each country.

- [x] Include at least one has_many relationship in information rendered via JSON and appended to the DOM.
    **Cities have many comments and they are displayed on the city page. Cities also have many users who have visited them and these are also displayed using jQuery.

- [x] Use your Rails API and a form to create a resource and render the response without a page refresh.
    **Comments can be created, displayed, and deleted on the city show page without a page refresh.

- [x] Translate JSON responses into js model objects.
    **New comments are translated into js model objects

- [x] At least one of the js model objects must have at least one method added by your code to the prototype.
    **The comment prototype has a formatComment prototype function.

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
