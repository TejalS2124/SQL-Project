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
 insert into Customers (CustomerID,FirstName,LastName,Email,Phone,accountcreation_date)values
 (004,"Daya","Mestry","daya@gmail.com",5648571523,"2026-10-20"),
 (005,"Rushi","Injale","rushi@gmail.com",2565894723,"2026-02-15");
 
 select*from Customers;
 
 #Update 
 
 update Customers set email="dayamestry@gmail.com" where FirstName= "Daya";
 update Customers set LastName="mistry" where FirstName= "Daya";
 update Customers set phone=9372086455 where CustomerID= "002";
 update Customers set accountcreation_date="2025-03-18" where FirstName= "Rushi";
 update Customers set FirstName="Rushikesh" where CustomerID= "005";
 
 set sql_safe_updates=0;
 
 #delete
 
 delete from Customers where firstName="Rushikesh";
 start transaction;
 rollback;
 delete from Customers;  # it is work like truncate.
 truncate table Customers;  #all table values can be deleted.
 
 #DQL-Data Query language
 select * from Customers;
 select * from Customers where FirstName= "Tejal";
 select email,phone from Customers where FirstName="Tejal";
 select * from Customers where Firstname like "%l"; #endswith
 select * from Customers where Firstname like "t%"; #startwith
 select email,phone from Customers where FirstName like "d%";
 select * from Customers where Firstname like "%t%";
  select * from Customers order by firstName;
 select * from Customers order by firstName desc;
 select * from Customers order by accountcreation_date desc;
 select * from Customers order by accountcreation_date desc limit 1; #latest customer
  select * from Customers order by accountcreation_date desc limit 1 offset 1;
  
  #ACCOUNTS TABLE
  
 insert into accounts(AccountID,AccountType,Balance,CustomerID)values
 (101,"Savings",20000,001),
 (102,"Savings",15000,002),
 (103,"Salary",10000,003),
 (104,"Current",20000,004);
 select * from Accounts;
 select * from Accounts order by Balance;
 select * from Accounts order by Balance limit 2;
 select * from Accounts where Balance > 15000;
select * from Accounts where Balance > 15000 and AccountType="Savings";
select * from Accounts where Balance > 20000 or AccountType="Salary";
select * from Accounts where Balance between 5000 and 16000;
 