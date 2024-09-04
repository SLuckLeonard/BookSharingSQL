-- create_tables.sql

-- Drop tables if they exist
DROP TABLE IF EXISTS User_Interactions;
DROP TABLE IF EXISTS Related_Books;
DROP TABLE IF EXISTS Book_Tags;
DROP TABLE IF EXISTS Book_Genres;
DROP TABLE IF EXISTS Availability;
DROP TABLE IF EXISTS Book_Editions;
DROP TABLE IF EXISTS Tags;
DROP TABLE IF EXISTS Genres;
DROP TABLE IF EXISTS Books;
DROP TABLE IF EXISTS Authors;
DROP TABLE IF EXISTS Users;

-- Creating the Books table
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    description VARCHAR(150),
    cover_image_1 BLOB,
    cover_image_2 BLOB,
    cover_image_3 BLOB,
    cover_image_4 BLOB,
    cover_image_5 BLOB,
    CONSTRAINT chk_title CHECK (CHAR_LENGTH(title) <= 50)
);

-- Creating the Authors table
CREATE TABLE Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    bio TEXT
);

-- Creating the Genres table
CREATE TABLE Genres (
    genre_id INT AUTO_INCREMENT PRIMARY KEY,
    genre_name VARCHAR(25) NOT NULL,
    CONSTRAINT chk_genre_name CHECK (CHAR_LENGTH(genre_name) <= 25)
);

-- Creating the Tags table
CREATE TABLE Tags (
    tag_id INT AUTO_INCREMENT PRIMARY KEY,
    tag_name VARCHAR(25) NOT NULL,
    CONSTRAINT chk_tag_name CHECK (CHAR_LENGTH(tag_name) <= 25)
);

-- Creating the Book_Editions table
CREATE TABLE Book_Editions (
    edition_id INT AUTO_INCREMENT PRIMARY KEY,
    edition_name VARCHAR(50) NOT NULL,
    book_id INT NOT NULL,
    publication_date DATE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id) ON DELETE CASCADE
);

-- Creating the Availability table
CREATE TABLE Availability (
    availability_id INT AUTO_INCREMENT PRIMARY KEY,
    location VARCHAR(100) NOT NULL,
    book_id INT NOT NULL,
    format VARCHAR(50) NOT NULL, -- Format like 'Hardcover', 'Paperback', 'eBook', etc.
    FOREIGN KEY (book_id) REFERENCES Books(book_id) ON DELETE CASCADE
);

-- Creating the Book_Genres table (Many-to-Many relationship between Books and Genres)
CREATE TABLE Book_Genres (
    book_id INT NOT NULL,
    genre_id INT NOT NULL,
    PRIMARY KEY (book_id, genre_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id) ON DELETE CASCADE,
    FOREIGN KEY (genre_id) REFERENCES Genres(genre_id) ON DELETE CASCADE
);

-- Creating the Book_Tags table (Many-to-Many relationship between Books and Tags)
CREATE TABLE Book_Tags (
    book_id INT NOT NULL,
    tag_id INT NOT NULL,
    PRIMARY KEY (book_id, tag_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id) ON DELETE CASCADE,
    FOREIGN KEY (tag_id) REFERENCES Tags(tag_id) ON DELETE CASCADE
);

-- Creating the User_Interactions table
CREATE TABLE User_Interactions (
    interaction_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    book_id INT NOT NULL,
    like_dislike BOOLEAN DEFAULT NULL,
    saved BOOLEAN DEFAULT FALSE,
    shared BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id) ON DELETE CASCADE
    -- Assuming a Users table exists, add this: FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

-- Creating the Related_Books table
CREATE TABLE Related_Books (
    book_id INT NOT NULL,
    related_book_id INT NOT NULL,
    PRIMARY KEY (book_id, related_book_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id) ON DELETE CASCADE,
    FOREIGN KEY (related_book_id) REFERENCES Books(book_id) ON DELETE CASCADE
);

-- Creating the Users table
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);
