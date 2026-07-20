show databases;
create database BankingDB;
use BankingDB;

CREATE TABLE Customers
(
	CustomerID INT,
    FirstName VARCHAR(50), 
    LastName VARCHAR(50),
    Email VARCHAR (100),
    Phone VARCHAR(15),
    accountcreation_date date 
 );  
drop table customers; #drop use for del/clr data
create table Accounts 
(
	AccountID INT,
    AccountType VARCHAR(20),
    Balance DECIMAL(10,2)
 );
 CREATE TABLE Transactions
 (
	TransationID INT,
    Transation_Date DATE,
    Amount Decimal(10,2),
    TransationType VARCHAR(20)
 );   
 CREATE TABLE Branches
 ( 
	BranchID INT,
    BranchName VARCHAR(150),
    BranchAddress VARCHAR(300),
    BranchPhone VARCHAR(15)
 );
 CREATE TABLE AccountBranches
 (
	AssinmentDate DATE 
 );
 CREATE TABLE Loans
 (
	LoanID INT,
    LoanAmmount DECIMAL(10,2),
    InterestRate DECIMAL(10,2),
    StartDate DATE,
    EndDate DATE 
 ); 
 ALTER TABLE Customers 
 ADD DateOfBirth DATE;
 select * from customers;
 
 ALTER table Customers MODIFY Phone VARCHAR(20);
 select * from customers;
 
 ALTER TABLE Customers Drop DateOfBirth;
 select * from Customers;
 
 ALTER TABLE Customers ADD primary key (CustomerID);
 select * from Customers;
 
 alter table Accounts add constraint chk_MinBalance check (Balance >= 1000 );
 select * from Accounts;
 
 alter table branches add primary key (branchID);
 
 alter table accounts add CustomerID int;
 
 alter table Accounts add constraint Fk_Accounts_Customers foreign key (CustomerID) references Customers(CustomerID);
 select * from Customers;
 
 #DML - Data Manipulation Language
 
 insert into Customers (CustomerID,FirstName,LastName,Email,Phone,accountcreation_date)
 values (001,"Tejal","Turambekar","kesarkartejal214@gmail.com","9637597214","2026-07-17");
 insert into Customers (CustomerID,FirstName,LastName,Email,Phone,accountcreation_date)
 values (002,"Payal","Kesarkar","kesarpayal0902@gmail.com","9372086354","2026-09-08");
 insert into Customers (CustomerID,FirstName,LastName,Email,Phone,accountcreation_date)
 values (003,"Sumit","Khaire","sumitkhiare@gmail.com",5487623259,"2026-12-26");
 select*from Customers;
 
 