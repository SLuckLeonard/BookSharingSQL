-- crud_operations.sql

-- CREATE operations

-- Adding a new book
INSERT INTO Books (title, description, cover_image_1) VALUES 
('New Book Title', 'Description of the new book.', NULL);

-- Adding a new edition
INSERT INTO Book_Editions (edition_name, book_id, publication_date) VALUES 
('Special Edition', 1, '2024-10-01');

-- Adding availability information
INSERT INTO Availability (location, book_id, format) VALUES 
('Chicago Public Library', 1, 'Paperback');

-- READ operations

-- Retrieve all books
SELECT * FROM Books;

-- Retrieve a book by ID
SELECT * FROM Books WHERE book_id = 1;

-- Retrieve all editions of a book
SELECT * FROM Book_Editions WHERE book_id = 1;

-- Retrieve availability of a book
SELECT * FROM Availability WHERE book_id = 1;

-- UPDATE operations

-- Update a book's description
UPDATE Books
SET description = 'Updated description of the book.'
WHERE book_id = 1;

-- Update an edition's publication date
UPDATE Book_Editions
SET publication_date = '2025-01-01'
WHERE edition_id = 1;

-- Update availability location
UPDATE Availability
SET location = 'Los Angeles Public Library'
WHERE availability_id = 1;

-- DELETE operations

-- Delete a book by ID
DELETE FROM Books WHERE book_id = 1;

-- Delete an edition by ID
DELETE FROM Book_Editions WHERE edition_id = 1;

-- Delete availability by ID
DELETE FROM Availability WHERE availability_id = 1;

-- Advanced Query Example

-- Retrieve books with their genres and tags
SELECT 
    b.title,
    b.description,
    GROUP_CONCAT(DISTINCT g.genre_name) AS genres,
    GROUP_CONCAT(DISTINCT t.tag_name) AS tags
FROM 
    Books b
JOIN 
    Book_Genres bg ON b.book_id = bg.book_id
JOIN 
    Genres g ON bg.genre_id = g.genre_id
JOIN 
    Book_Tags bt ON b.book_id = bt.book_id
JOIN 
    Tags t ON bt.tag_id = t.tag_id
GROUP BY 
    b.book_id;

-- Retrieve all books with their editions and availability
SELECT 
    b.title,
    GROUP_CONCAT(DISTINCT e.edition_name) AS editions,
    GROUP_CONCAT(DISTINCT a.location) AS availability_locations
FROM 
    Books b
LEFT JOIN 
    Book_Editions e ON b.book_id = e.book_id
LEFT JOIN 
    Availability a ON b.book_id = a.book_id
GROUP BY 
    b.book_id;
