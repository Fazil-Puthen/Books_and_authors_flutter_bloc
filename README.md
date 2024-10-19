Overview
This is a Flutter-based eCommerce application for buying books. It features a detailed view of individual books, an option to update book details, and a screen listing authors. The app is designed using the BLoC (Business Logic Component) and clean architecture and integrates with remote APIs to fetch data related to books and authors.

Key Features:
Book Listing: Displays a list of available books fetched from a remote API.
Book Detail View: Users can view more information about each book, such as the title, description, author name, publication date, and price.
Update Book Information: Users can edit book details using an edit dialog that updates the data remotely.
Author Listing: Users can view a list of authors fetched from a remote API.
Add Author: Users can add a new author through a bottom sheet dialog.
Project Structure
The project follows a modular and clean architecture based on the BLoC pattern, ensuring that business logic is separated from UI components.

Folder Structure:
- lib/
  - core/
    - constants/   # Stores constants such as API URLs, boxes
  - data/
    - repository/  # Repositories to interact with APIs
  - domain/
    - models/         ## Models for books and authors
    - repository/    # Business domain models
  - presentation/
    - screens/     # All UI screens
    - widgets/     # Reusable widgets for UI
  - bloc/
    - book/        # Book-related BLoC files (events, states, BLoC logic)
    - author/      # Author-related BLoC files
  - main.dart      # Entry point for the app
Core Features
1. Book Listing Screen
Fetches and displays a list of books from the API.
Each book shows its title, author, and price.
Users can tap on a book to view its detailed information.
2. Detailed Book View
Shows detailed information about a selected book.
Allows the user to view the book's title, description, author, published date, cover image, and price.
An edit button is provided to update the book information.
3. Update Book
Users can update the book details by tapping the "Edit" icon on the book detail screen.
A dialog opens with pre-filled data, and users can edit the title, description, published date, and cover image URL.
Changes are sent back to the API to update the book record.
4. Author Listing Screen
Fetches and displays a list of authors from the API.
Users can view author details like name, biography, and birthdate.
5. Add Author
Users can add a new author by clicking the floating action button.
A bottom sheet opens up where users can enter the author's name, biography, and birthdate.
Upon submission, the author is added to the list and persisted via the API.
Technologies Used
Flutter: For building the mobile app's user interface.
BLoC: For state management and handling business logic.
HTTP Package: For making API requests.
Dartz Package: For handling failures and successful responses.
REST APIs: For fetching and posting book and author data.
API Integration
The app integrates with a remote API to fetch and manage data for books and authors. The HTTP package is used to send GET and POST requests. Error handling is implemented using dartz to differentiate between success and failure cases.

Example API Endpoints:
Books
GET: /books - Fetches the list of books.
POST: /books - Adds a new book.
PATCH: /books/{id} - Updates an existing book.
Authors
GET: /authors - Fetches the list of authors.
POST: /authors - Adds a new author.
