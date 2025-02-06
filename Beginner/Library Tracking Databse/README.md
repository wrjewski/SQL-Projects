# Library Database System

This project demonstrates a **Library Database System** using Microsoft SQL Server. It showcases SQL concepts such as database creation, table design, data insertion, and query writing. The system is designed to manage books, authors, members, and borrowing records for a library.

---

## Features
1. **Database**: `LibraryDB` is the main database for this project.
2. **Tables**:
   - `Authors`: Stores information about authors.
   - `Books`: Stores details about books, including their genres, publication years, and associated authors.
   - `Members`: Stores details about library members.
   - `BorrowingRecords`: Tracks which members have borrowed which books and their borrowing/return dates.
3. **Queries**:
   - List all books and their authors.
   - Find all books currently borrowed and by whom.
   - Count the total number of books by genre.
   - List members who joined in the last year.

---

## Project Structure
The project contains the following SQL files:
- `create_library_database.sql`: Script to create the `LibraryDB` database.
- `create_library_tables.sql`: Script to create the `Authors`, `Books`, `Members`, and `BorrowingRecords` tables.
- `insert_library_data.sql`: Script to populate the tables with sample data.
- `library_queries.sql`: Script with example queries for analyzing the data.

---

## Database Schema
### 1. Authors Table
| Column Name     | Data Type     | Description                     |
|------------------|--------------|---------------------------------|
| `AuthorID`       | INT (PK)     | Unique identifier for the author. |
| `FirstName`      | NVARCHAR(50) | First name of the author.       |
| `LastName`       | NVARCHAR(50) | Last name of the author.        |

### 2. Books Table
| Column Name        | Data Type     | Description                    |
|---------------------|--------------|--------------------------------|
| `BookID`           | INT (PK)     | Unique identifier for the book. |
| `Title`            | NVARCHAR(100)| Title of the book.             |
| `Genre`            | NVARCHAR(50) | Genre of the book.             |
| `PublicationYear`  | INT          | Year the book was published.   |
| `AuthorID`         | INT (FK)     | Links to the `AuthorID` in the `Authors` table. |

### 3. Members Table
| Column Name     | Data Type     | Description                    |
|------------------|--------------|--------------------------------|
| `MemberID`       | INT (PK)     | Unique identifier for the member. |
| `FirstName`      | NVARCHAR(50) | First name of the member.      |
| `LastName`       | NVARCHAR(50) | Last name of the member.       |
| `JoinDate`       | DATE         | Date the member joined the library. |

### 4. BorrowingRecords Table
| Column Name     | Data Type     | Description                    |
|------------------|--------------|--------------------------------|
| `RecordID`       | INT (PK)     | Unique identifier for the borrowing record. |
| `MemberID`       | INT (FK)     | Links to the `MemberID` in the `Members` table. |
| `BookID`         | INT (FK)     | Links to the `BookID` in the `Books` table. |
| `BorrowDate`     | DATE         | Date the book was borrowed.    |
| `ReturnDate`     | DATE         | Date the book was returned.    |

---

## Sample Queries
Here are some example queries included in the project:

1. **List all books and their authors**:
   ```sql
   SELECT 
       B.Title AS BookTitle,
       B.Genre,
       B.PublicationYear,
       CONCAT(A.FirstName, ' ', A.LastName) AS AuthorName
   FROM Books AS B
   JOIN Authors AS A ON B.AuthorID = A.AuthorID;

2. **Find all books currently borrowed**:
   ```sql
   SELECT 
       M.FirstName + ' ' + M.LastName AS MemberName,
       B.Title AS BookTitle,
       BR.BorrowDate
   FROM BorrowingRecords AS BR
   JOIN Members AS M ON BR.MemberID = M.MemberID
   JOIN Books AS B ON BR.BookID = B.BookID
   WHERE BR.ReturnDate IS NULL;

3. **Count the total number of books by genre**:
   ```sql
   SELECT 
        Genre,
        COUNT(*) AS TotalBooks
    FROM Books
    GROUP BY Genre;

4. **Count the total number of books by genre**:
   ```sql
   SELECT 
        FirstName + ' ' + LastName AS MemberName,
        JoinDate
    FROM Members
    WHERE JoinDate >= DATEADD(YEAR, -1, GETDATE());

## How to Run the Project
1. Clone or download the repository.
2. Open the SQL scripts in VS Code with the SQL Server (mssql) extension installed.
3. Follow these steps:
   - Run create_library_database.sql to create the LibraryDB database.
   - Run create_library_tables.sql to set up the tables.
   - Run insert_library_data.sql to populate the tables with sample data.
   - Run the queries in library_queries.sql to analyze the data.

## Skills Demonstrated
   - Database creation and management.
   - Table design with primary and foreign key relationships.
   - Writing SQL queries for data analysis.
   - Use of joins, aggregations, and conditional filtering.

## Future Improvements
   - Add stored procedures for commonly used queries.
   - Create views to simplify reporting.
   - Build a front-end application to integrate with the database.