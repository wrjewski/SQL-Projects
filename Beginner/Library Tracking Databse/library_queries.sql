USE LibraryDB;
GO

SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';

-- Check columns in the Books table
SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Books';

-- Check columns in the Authors table
SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Authors';



-- List all books and their authors
SELECT 
    B.Title AS BookTitle,
    B.Genre,
    B.PublicationYear,
    CONCAT(A.FirstName, ' ', A.LastName) AS AuthorName
FROM Books B
JOIN Authors A ON B.AuthorID = A.AuthorID;


-- Find all books currently borrowed
SELECT 
    M.FirstName + ' ' + M.LastName AS MemberName,
    B.Title AS BookTitle,
    BR.BorrowDate
FROM BorrowingRecords BR
JOIN Members M ON BR.MemberID = M.MemberID
JOIN Books B ON BR.BookID = B.BookID
WHERE BR.ReturnDate IS NULL;


-- Count the total number of books by genre
SELECT 
    Genre,
    COUNT(*) AS TotalBooks
FROM Books
GROUP BY Genre;


-- List members who joined in the last year
SELECT 
    FirstName + ' ' + LastName AS MemberName,
    JoinDate
FROM Members
WHERE JoinDate >= DATEADD(YEAR, -1, GETDATE());
