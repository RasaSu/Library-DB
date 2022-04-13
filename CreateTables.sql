CREATE DATABASE UniversityLibrary

CREATE TABLE tbl_Types
(
	TypeId int IDENTITY(1,1) PRIMARY KEY,
	TypeName varchar(20) NOT NULL
)

CREATE TABLE tbl_Members
(
	MemberId int IDENTITY(1,1) PRIMARY KEY,
	FirstName varchar(20) NOT NULL,
	LastName varchar(20) NOT NULL,
	PhoneNumber varchar(20) NOT NULL,
	Email varchar(40) NOT NULL,
	MemberType int FOREIGN KEY REFERENCES tbl_Types(TypeId)
)

CREATE TABLE tbl_Author
(
	AuthorId int IDENTITY(1,1) PRIMARY KEY,
	FirstName varchar(20) NOT NULL,
	LastName varchar(20) NOT NULL,
)

CREATE TABLE tbl_Books
(
	BookId int IDENTITY(1,1) PRIMARY KEY,
	Title varchar(40) NOT NULL,
	Translation varchar(20) NOT NULL,
	SubjectName varchar(20) NOT NULL,
	AuthorId int FOREIGN KEY REFERENCES tbl_Author(AuthorId)
)

CREATE TABLE tbl_Copies
(
	CopieId int IDENTITY(1,1) PRIMARY KEY,
	BookId int FOREIGN KEY REFERENCES tbl_Books(BookId)
)

CREATE TABLE tbl_Loans
(
	CopieId int FOREIGN KEY REFERENCES tbl_Copies(CopieId),
	MemberId int FOREIGN KEY REFERENCES tbl_Members(MemberId),
	CheckoutDate datetime NOT NULL,
	DueBackDate datetime NULL,
	ReturnedDate datetime NULL,
	CONSTRAINT PK_Loan PRIMARY KEY (CopieId, MemberId, CheckoutDate)
)
