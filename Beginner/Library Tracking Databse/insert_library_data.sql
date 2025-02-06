USE LibraryDB;
GO

-- Insert Authors
INSERT INTO Authors (FirstName, LastName)
VALUES
    ('J.K.', 'Rowling'),
    ('George', 'Orwell'),
    ('J.R.R.', 'Tolkien');

-- Insert Books
INSERT INTO Books (Title, Genre, PublicationYear, AuthorID)
VALUES
    ('Harry Potter and the Sorcerer''s Stone', 'Fantasy', 1997, 1),
    ('1984', 'Dystopian', 1949, 2),
    ('The Hobbit', 'Fantasy', 1937, 3);

-- Insert Members
INSERT INTO Members (FirstName, LastName, JoinDate)
VALUES 
    ('Alice', 'Smith', '2022-01-10'),
    ('Bob', 'Johnson', '2021-06-15'),
    ('Charlie', 'Brown', '2023-03-20');

-- Insert Borrowing Records
INSERT INTO BorrowingRecords (MemberID, BookID, BorrowDate, ReturnDate)
VALUES 
    (1, 1, '2023-01-15', '2023-02-15'),
    (2, 2, '2023-02-01', NULL), -- Not returned yet
    (3, 3, '2023-03-01', '2023-03-10');