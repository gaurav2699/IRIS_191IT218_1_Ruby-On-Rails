Ruby Version: ruby 2.6.1
# Necessary installation steps
- To install Ruby on Rails, go through the following document
- https://docs.google.com/document/d/1jW8vD1ziBLZ-ClZ4tpp7PPxH3obzI3Vk3LCAEBQkzkk/edit?usp=sharing
#### Add the following additional gems to the file Gemfile
- gem 'devise'
- gem 'bulma-rails', '~> 0.6.1'
- gem 'mini_magick', '~> 4.8'
# Complete steps to run the project
1. First clone the repository to your desired location
2. Install imagemagick (sudo apt-get install imagemagick)
2. Run the following commands in you teminal:
```
bundle install
rake db:create
rake db:migrate
rails server
```
# List of all implemented features
1. First User is the Librarian(Admin)
2. The librarian can upload books with images that can be issued from the Library.
3. All the uploaded books are displayed with an option to edit and delete.
4. A student(other than the first user, other users are students) is able to view all the books uploaded by the Librarian having a quantity greater than 0.
5. If a book has multiple images then it is displayed in the form of a carousel.
5. A create issue request button appears for every book.
6. A student is able see all the books approved by the library.
7. A return book button appears for every book, which will return the book to the library and will increase the quantity of that book.
8. Once the book is returned it does appear in my books.
9. The librarian has a dashboard in which all the issue requests are displayed in 3 different tabs as pending, rejected, and approved.
10. A student is able to see all the issue requests created by him/her.
11. The librarian is able to see all the books issued and returned to the library. A transaction shows the Student name, Book title, issue date, return date, and duration.
12. A student is able to see his/her transaction. 
13. A student is able to create a request for issuing the book. The request will be initially pending. Every request is recorded.
14. The librarian receives requests from all the students.
15. The request can be either pending, rejected, or approved.
16. Once the request is made it cannot be deleted whatsoever. 
17. The student is allowed to create a request for the same book if it is pending or approved and not returned back.
18. The request can either be approved or rejected by the librarian. If the request is approved then the quantity of the requested book is automatically decreased by 1.
19. The approved book is available under the My Books dashboard for whom the issue request has been approved, with an option to return to the library.
20. After the book is returned, the quantity for that book increases automatically by 1. The new transaction is made available under both the student's and the librarian’s Transactions dashboard.



# List of non-implemented/planned features
- All features implemented
# List of all the known bugs
- No known bugs
# References used
- IRIS ROR bootcamp
