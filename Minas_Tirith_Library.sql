CREATE DATABASE MinasTirith_Library;

USE MinasTirith_Library;

CREATE TABLE Library_Branch (BranchID INT NOT NULL PRIMARY KEY IDENTITY(1,1), BranchName VARCHAR(20) NOT NULL, BranchAddress VARCHAR(50) NOT NULL);
INSERT INTO Library_Branch VALUES
('Hobbiton', '501 Buckland Road, Hobbiton'),
('Bree', '42 Mount Barker Road, Bree'),
('Minas Tirith', '152 Prince of Scordia Road, Minas Tirith'),
('Dale', 'King Brand Way, Dale'),
('Edoras', 'Golden Hall of Meduseld, Edoras'),
('Sharpstown', '1 Weka St, Miramar');

SELECT * FROM Library_Branch;



CREATE TABLE Borrower (CardNumber VARCHAR(50) PRIMARY KEY NOT NULL, BorrowerName VARCHAR(100) NOT NULL, BorrowerAddress VARCHAR(50) NOT NULL, BorrowerPhone VARCHAR(20) NOT NULL);
INSERT INTO Borrower VALUES 
('B2171', 'Tom Bombadil', 'Withywindle', '508-295-2171'),
('B9379', 'Meriadoc Brandybuck', 'Brandy Hall, Bucklebury', '203-685-9379'),
('T3720', 'Peregrin Took', '32 Thain St, Shire', '360-748-3720'),
('B6237', 'Barliman Butterbur', 'Inn of the Prancing Pony', '707-684-6237'),
('I3312', 'Éowyn of Ithilien', 'Emyn Arnen', '114-816-3312'),
('IF3312', 'Faramir of Ithilien', 'Emyn Arnen', '114-816-3312'),
('B2952', 'Bergil Beregond', '9 Borlas Lane, Minas Tirith', '339-585-2952'),
('B3848', 'Bain Bowman', '24 Parganas, Lake-town', '425-985-3848');
SELECT * FROM Borrower;



CREATE TABLE Book_Copies (BookID INT NOT NULL, BranchID INT NOT NULL, NumberOfCopies INT NOT NULL);
INSERT INTO Book_Copies VALUES 
(103, 1, 2),
(101, 3, 5),
(100, 3, 1),
(105, 2, 3),
(104, 5, 2),
(102, 3, 5),
(106, 4, 1);
ALTER TABLE Book_Copies ADD FOREIGN KEY (BranchID) REFERENCES Library_Branch(BranchID);
SELECT * FROM Book_Copies;



CREATE TABLE Books (BookID INT NOT NULL PRIMARY KEY IDENTITY(100, 1), Title VARCHAR(50), PublisherID INT NOT NULL);
INSERT INTO Books VALUES 
('The Children of Húrin', 1961),
('Beren and Lúthien', 1961 ),
('Unfinished Tales of Númenor and Middle-earth', 1961 ),
('There and Back Again, A Hobbit''s tale', 1960),
('The Fall of Gondolin', 1962),
('The Adventures of Tom Bombadil', 1962),
('The Fall of Númenor', 1960);
SELECT * FROM Books;



ALTER TABLE Book_Copies ADD FOREIGN KEY (BookId) REFERENCES Books(BookId);



CREATE TABLE Publisher (PublisherID INT NOT NULL PRIMARY KEY IDENTITY(1960, 1), PubName VARCHAR(30), PubAddress VARCHAR(100), PubPhone VARCHAR(25) );
INSERT INTO Publisher VALUES
('George Allen & Unwin', '77 Fulham Palace Road, London, W6 8JA, England', '+44-0-20-7269-1610'),
('HarperCollins', '195 Broadway, New York, NY 10007', '212-207-7000'),
('Houghton Mifflin Harcourt', '9400 Southpark Center Loop, Orlando, FL 32819', '407-345-2000');
SELECT * FROM Publisher;

ALTER TABLE Books ADD FOREIGN KEY (PublisherID) REFERENCES Publisher(PublisherID);




CREATE TABLE On_Loan (BookID INT NOT NULL, BranchID INT NOT NULL, CardNumber, DateOut, DateDue);
INSERT INTO On_Loan VALUES
(103, 1, '823.912', '11-20-3021', '12-20-3021')
(104, 5, '741.64', '11-13-3021', '12-13-3021')
(105, 2, '299.792', '12-05-3021', '01-05-3022')
ALTER TABLE On_Loan ADD FOREIGN KEY (BookId) REFERENCES Books(BookId);
ALTER TABLE On_Loan ADD FOREIGN KEY (BranchID) REFERENCES Library_Branch(BranchID);




CREATE TABLE Authors (BookId INT NOT NULL, AuthorName);
ALTER TABLE Authors ADD FOREIGN KEY (BookId) REFERENCES Books(BookId);
