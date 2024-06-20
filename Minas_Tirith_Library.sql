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



CREATE TABLE Books (BookID INT NOT NULL PRIMARY KEY IDENTITY(100, 1), Title VARCHAR(50), PublisherName INT NOT NULL);
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



CREATE TABLE On_Loan (BookID INT NOT NULL, BranchID INT NOT NULL, CardNumber, DateOut, DateDue);
ALTER TABLE Book_Copies ADD FOREIGN KEY (BookId) REFERENCES Books(BookId);
ALTER TABLE Book_Copies ADD FOREIGN KEY (BranchID) REFERENCES Library_Branch(BranchID);


CREATE TABLE Publisher (PublisherName INT NOT NULL PRIMARY KEY IDENTITY(), PubAddress, PubPhone);


CREATE TABLE Authors (BookId INT NOT NULL, AuthorName);
ALTER TABLE Authors ADD FOREIGN KEY (BookId) REFERENCES Books(BookId);
