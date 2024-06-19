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
('Tom Bombadil', 'Withywindle', '508-295-2171'),
('Meriadoc Brandybuck', 'Brandy Hall, Bucklebury', '203-685-9379'),
('Peregrin Took', '32 Thain St, Shire', '360-748-3720'),
('Barliman Butterbur', 'Inn of the Prancing Pony', '707-684-6237'),
('Éowyn of Ithilien', 'Emyn Arnen', '114-816-3312'),
('Faramir of Ithilien', 'Emyn Arnen', '114-816-3312'),
('Bergil Beregond', '9 Borlas Lane, Minas Tirith', '339-585-2952'),
('Bain Bowman', '24 Parganas Lake-town', '425-985-3848');
SELECT * FROM Borrower;


CREATE TABLE Book_Copies (BookID INT NOT NULL, BranchID INT NOT NULL, NumberOfCopies );
ALTER TABLE Book_Copies ADD FOREIGN KEY (BookId) REFERENCES Books(BookId);
ALTER TABLE Book_Copies ADD FOREIGN KEY (BranchID) REFERENCES Library_Branch(BranchID);


CREATE TABLE Books (BookID INT NOT NULL PRIMARY KEY IDENTITY(100, 1), Title, PublisherName INT NOT NULL);
ALTER TABLE Books ADD FOREIGN KEY (PublisherName) REFERENCES Publisher(PublisherName);


CREATE TABLE On_Loan (BookID INT NOT NULL, BranchID INT NOT NULL, CardNumber, DateOut, DateDue);
ALTER TABLE Book_Copies ADD FOREIGN KEY (BookId) REFERENCES Books(BookId);
ALTER TABLE Book_Copies ADD FOREIGN KEY (BranchID) REFERENCES Library_Branch(BranchID);


CREATE TABLE Publisher (PublisherName INT NOT NULL PRIMARY KEY IDENTITY(), PubAddress, PubPhone);


CREATE TABLE Authors (BookId INT NOT NULL, AuthorName);
ALTER TABLE Authors ADD FOREIGN KEY (BookId) REFERENCES Books(BookId);
