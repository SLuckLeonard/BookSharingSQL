-- insert_data.sql

-- Inserting data into Authors
INSERT INTO Authors (name, bio) VALUES 
('J.K. Rowling', 'British author, best known for the Harry Potter series.'),
('George R.R. Martin', 'American novelist and short story writer, known for A Song of Ice and Fire series.'),
('J.R.R. Tolkien', 'English writer, best known for The Lord of the Rings and The Hobbit.');

-- Inserting data into Genres
INSERT INTO Genres (genre_name) VALUES 
('Fantasy'),
('Science Fiction'),
('Mystery'),
('Non-Fiction'),
('Biography');

-- Inserting data into Tags
INSERT INTO Tags (tag_name) VALUES 
('Bestseller'),
('Classic'),
('Award-Winning'),
('New Release'),
('Must-Read');

-- Inserting data into Book_Editions
INSERT INTO Book_Editions (edition_name, book_id, publication_date) VALUES 
('Hardcover', 1, '1997-06-26'),
('Paperback', 1, '1998-08-01'),
('eBook', 1, '2012-05-01'),
('Hardcover', 2, '1996-08-06'),
('Paperback', 2, '1997-06-01'),
('eBook', 2, '2011-09-01'),
('Deluxe Edition', 1, '2024-01-01');

-- Inserting data into Availability
INSERT INTO Availability (location, book_id, format) VALUES 
('Online Store', 1, 'Hardcover'),
('Local Bookstore', 1, 'Paperback'),
('Online Store', 2, 'eBook'),
('Local Bookstore', 2, 'Hardcover'),
('New York Public Library', 3, 'Hardcover');

-- Inserting data into Books
INSERT INTO Books (title, description, cover_image_1, cover_image_2, cover_image_3, cover_image_4, cover_image_5) VALUES 
('Harry Potter and the Sorcerer\'s Stone', 'The first book in the Harry Potter series.', NULL, NULL, NULL, NULL, NULL),
('A Game of Thrones', 'The first book in the A Song of Ice and Fire series.', NULL, NULL, NULL, NULL, NULL),
('The Hobbit', 'A fantasy novel and children\'s book by J.R.R. Tolkien.', NULL, NULL, NULL, NULL, NULL);

-- Inserting data into Book_Genres
INSERT INTO Book_Genres (book_id, genre_id) VALUES 
(1, 1), -- Harry Potter and the Sorcerer's Stone is Fantasy
(2, 1), -- A Game of Thrones is Fantasy
(3, 1); -- The Hobbit is Fantasy

-- Inserting data into Book_Tags
INSERT INTO Book_Tags (book_id, tag_id) VALUES 
(1, 1), -- Harry Potter and the Sorcerer's Stone is a Bestseller
(2, 1), -- A Game of Thrones is a Bestseller
(3, 1); -- The Hobbit is a Bestseller

-- Inserting data into Related_Books
INSERT INTO Related_Books (book_id, related_book_id) VALUES 
(1, 3), -- Harry Potter and the Sorcerer's Stone is related to The Hobbit
(2, 1); -- A Game of Thrones is related to Harry Potter and the Sorcerer's Stone

-- Inserting data into Users
INSERT INTO Users (username, email) VALUES 
('booklover123', 'booklover123@example.com'),
('fantasyfan', 'fantasyfan@example.com'),
('literaturebuff', 'literaturebuff@example.com');

-- Inserting data into User_Interactions
INSERT INTO User_Interactions (user_id, book_id, like_dislike, saved, shared) VALUES 
(1, 1, TRUE, TRUE, FALSE), -- User 1 likes and saves Harry Potter
(2, 2, TRUE, FALSE, TRUE), -- User 2 likes and shares A Game of Thrones
(3, 3, FALSE, FALSE, FALSE); -- User 3 does not interact with The Hobbit
