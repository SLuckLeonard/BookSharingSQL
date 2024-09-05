# BookSharingSQL
Example SQL Table setup for an app for sharing books

# SQL Table Practice Project
This project demonstrates my SQL database design and CRUD operation skills using a simple book recommendation system as a test case. It mimics functionality that can later be expanded for use in a larger app environment, such as an Azure-hosted application. The goal of this project is to showcase my ability to design normalized relational tables, enforce constraints, handle CRUD operations, and perform queries in an optimized way.

# Features
- <b>Relational Database Structure:</b> The project contains a normalized set of tables with various relationships (one-to-many, many-to-many).
Constraints and Validations: The design includes primary keys, foreign keys, and various constraints (e.g., length limits, null checks).
- <b>Sample Data:</b> Populated with relevant sample data for testing and demo purposes.
- <b>CRUD Operations:</b> Demonstrates basic SQL CRUD operations (Create, Read, Update, Delete).
- <b>Advanced Queries:</b> Includes advanced queries that showcase the power of SQL joins and aggregations.

# Table Structure
- <b>Books:</b> Stores information about books, including title, description, and cover images.
- <b>Authors:</b> Information about authors of the books.
- <b>Genres:</b> Stores genres (e.g., Fantasy, Science Fiction) for categorizing books.
- <b>Tags:</b> Keywords or tags for describing books.
- <b>Availability:</b> Represents dietary restrictions or allergens for certain book themes.
- <b>Related_Books:</b> A many-to-many relationship to indicate related books.
- <b>Users:</b> Information about users who interact with the system.
- <b>User_Interactions:</b> Tracks likes, dislikes, saves, and shares for books by users.

# SQL Scripts
- <b>create_tables.sql:</b> Contains the SQL commands to create the normalized relational tables with appropriate constraints.
- <b>insert_data.sql:</b> Populates the database with sample data to demonstrate functionality.
- <b>crud_operations.sql:</b> Shows basic CRUD operations and includes some advanced queries to interact with the database.

# How to Run the Project

## Prerequisites
1. A MySQL or PostgreSQL instance installed locally or hosted on the cloud (e.g., via Azure, AWS, or a local environment like XAMPP or Docker).
2. A tool for interacting with the database (e.g., MySQL Workbench, pgAdmin, DBeaver, or the command line).

## Setup Instructions
1. Clone the Repository:

```bash
git clone https://github.com/your-username/sql-table-practice-project.git
cd sql-table-practice-project
```
2. Run the SQL Scripts:

- Use your preferred SQL interface to create the database and run the scripts in the /sql/ folder.
- First, run <b>create_tables.sql</b> to set up the structure.
- Then, execute <b>insert_data.sql</b> to populate the tables with sample data.
- You can test CRUD operations and perform queries by running <b>crud_operations.sql</b>.

3. Explore the Database:

- Query the tables to see how the data is organized and linked.
- Modify, delete, or insert data to test CRUD functionality.


# SQL Table Design Highlights
## Books Table
- Each book can have up to 5 cover images.
- A title column (supports special characters and emojis, with a max length of 50 characters).
- A description column with a maximum length of 150 characters.
- Associated with genres, tags, allergens/restrictions, and related books through relational tables.

## User_Interactions Table
- Tracks user engagement with the books, including likes, dislikes, saves, and shares.
- Demonstrates how a system could record and interact with users’ preferences and actions.

# CRUD Operations
- <b>Create:</b> Insert new books, genres, tags, and user interactions.
- <b>Read:</b> Query the database to retrieve books, including their genres, tags, and related information.
- <b>Update:</b> Modify existing data, such as updating book descriptions.
- <b>Delete:</b> Remove records from the database, such as deleting a book.

# Sample Query Examples
Here are a few example queries included in the project:

## Retrieve all books with their genres and tags:
``` sql
SELECT 
    b.title,
    GROUP_CONCAT(DISTINCT g.genre_name) AS genres,
    GROUP_CONCAT(DISTINCT t.tag_name) AS tags
FROM Books b
JOIN Book_Genres bg ON b.book_id = bg.book_id
JOIN Genres g ON bg.genre_id = g.genre_id
JOIN Book_Tags bt ON b.book_id = bt.book_id
JOIN Tags t ON bt.tag_id = t.tag_id
GROUP BY b.book_id;
```
## Update a book’s description:
```sql
UPDATE Books
SET description = 'New updated description.'
WHERE book_id = 1;
```

# Future Enhancements
This project is intended as a starting point for more complex SQL database operations. Some future enhancements might include:

- <b>Adding Constraints:</b> More complex business rules (e.g., restricting posts per user).
- <b>Advanced Joins:</b> More complex queries for retrieving data with multiple relationships.
- <b>Stored Procedures and Functions:</b> Implementing more advanced database features.
- <b>Cloud Integration:</b> Expanding the system into a Microsoft Azure SQL setup as part of a larger application.

# License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

# Contact
For questions or feedback, please contact me at samluckleonard@gmail.com