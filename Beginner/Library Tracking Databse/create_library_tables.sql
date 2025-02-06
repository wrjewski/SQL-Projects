USE LibraryDB;
GO

-- Create Author Table
CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL
);

-- Create Books Table
CREATE TABLE Books (
    BookID INT PRIMARY KEY IDENTITY(1,1),
    Title NVARCHAR(100) NOT NULL,
    Genre NVARCHAR(50) NOT NULL,
    PublicationYear INT,
    AuthorID INT NOT NULL,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

-- Create Members Table
CREATE TABLE Members (
    MemberID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    JoinDate DATE NOT NULL
);

-- Create BorrowingRecords Table
CREATE TABLE BorrowingRecords (
    RecordID INT PRIMARY KEY IDENTITY(1,1),
    MemberID INT NOT NULL,
    BookID INT NOT NULL,
    BorrowDate DATE NOT NULL,
    ReturnDate DATE,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);