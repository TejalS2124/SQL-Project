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
 insert into Customers (CustomerID,FirstName,LastName,Email,Phone,accountcreation_date)values
 (005,"Daya","Mestry","daya@gmail.com",5648571523,"2026-10-20"),
 (006,"Tejaswini","Kadam","tejaswini@gmail.com",2565896414,"2026-01-30");
  insert into Customers (CustomerID,FirstName,LastName,Email,Phone,accountcreation_date)values
 (007,"Pratik","Raykar","pratik@gmail.com",346461223164,"2026-05-25"),
 (008,"Tejaswini","Mishra","tejas@gmail.com",316846154,"2026-10-30");
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
 update customers
 set lastname= Null where firstname= "Daya";
  update customers
 set email= Null where firstname= "payal";
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
  insert into accounts(AccountID,AccountType,Balance,CustomerID)values
 (105,"Salary",70000,005),
 (106,"Current",80000,006);
 insert into accounts(AccountID,AccountType,Balance,CustomerID)values
 (107,"Current",60000,007),
 (108,"Current",80000,008);
 select * from Accounts;
 select * from Accounts order by Balance;
 select * from Accounts order by Balance limit 2;
 select * from Accounts where Balance > 15000;
select * from Accounts where Balance > 15000 and AccountType="Savings";
select * from Accounts where Balance > 20000 or AccountType="Salary";
select * from Accounts where Balance between 5000 and 16000;

show tables;
desc customers;
desc Accounts;

#Branches
insert into Branches(BranchID,BranchName,BranchAddress,BranchPhone) values
(1,"Kotak","Andheri",4549564845),
(2,"HDFC","Worli",2148659853),
(3,"BankOfIndia","Prabhadevi",3265874556),
(4,"BankOfBaroda","Sion",5487653248),
(5,"HDFC","Dadar",5487651313);
insert into Branches(BranchID,BranchName,BranchAddress,BranchPhone) values
(6,"Kotak","Dadar",54876516464),
(7,"BankOfIndia","Sion",1544131644);
select * from branches;

# to find the unique accountType
select distinct (AccountType) from accounts;

#Group By
select min(balance),AccountType from accounts group by AccountType;
select max(balance),AccountType from accounts group by AccountType;
select count(balance),AccountType from accounts group by AccountType;
select sum(balance),AccountType from accounts group by AccountType;
select avg(balance),AccountType from accounts group by AccountType;

#in one line group by use like
select min(balance)as minimum_balance,
max(balance)as maximum_balance,
Count(balance) as count_balance,
avg(balance) as average_balance,
sum(balance) as sum_balance,
accountType from accounts group by AccountType;

select max(balance) from accounts;

select distinct(Branchname)from branches;
select distinct(BranchAddress)from branches;
select Branchname from branches group by Branchname;

#NULL handling
select * from Customers;
select * from Customers where email is null;
select * from customers where lastname is null;
select * from Customers where lastname is not null;

delete  from customers where lastname="mistry";
select * from Accounts;
delete from Accounts where CustomerID=4;

#Loans
insert into loans(LoanID,LoanAmmount,InterestRate,startDate,EndDate) values
(21,20000000,5.6,"2025-07-23","2027-07-20"),
(22,35000000,11.5,"2024-12-09","2028-08-25"),
(23,40000000,10.2,"2024-05-30","2026-11-10"),
(24,25000000,8.7,"2025-02-15","2027-02-23"),
(25,70000000,15.5,"2024-07-12","2028-09-15"),
(26,85000000,6.9,"2025-11-20","2027-05-12");
select*from loans;
select*from loans where StartDate>"2024-10-12";
select max(InterestRate)from loans;
select InterestRate  from loans order by InterestRate desc limit 1;

#Cases
select LoanID , LoanAmmount,
case
    when LoanAmmount<30000000 then "Basic Loan"
    when LoanAmmount<70000000 then "Standard Loan"
    else "Premium Loan"
    end
    as Loan_Type from Loans;
    
    select*from Accounts;
    
    #change a column header name to table
    alter table Loans change column LoanAmmount LoanAmount int;
    
#transaction
 insert into transactions (TransationID,Transation_Date,Amount,TransationType)values
 (101,"2026-07-01",15000,"Deposit"),
 (102,"2026-10-15",30000,"Withdrawal"),
 (103,"2026-08-30",25000,"Deposit"),
 (104,"2026-11-25",1200,"Deposit"),
 (105,"2026-02-10",15000,"Withdrawal"),
 (106,"2026-01-01",30000,"Withdrawal"),
 (107,"2026-07-12",12000,"Deposit");
 
 select*from Transactions;
 
 #accountbranches
 insert into accountbranches(AssinmentDate)values
 ("2026-01-10"),("2026-02-15"),("2026-03-20"),("2026-04-05"),("2026-05-18");
 select*from accountbranches;
 
 #windows function;
 #rank without partition
 select AccountID,Balance, rank() over (order by Balance) from accounts;
 select AccountID,Balance, rank() over (order by Balance desc) from accounts;
 #dense_Rank
 select AccountID,Balance, dense_rank() over (order by Balance desc)from accounts;
 #rank with partition
 select AccountID,Balance,AccountType, rank() over 
 (partition by AccountType order by Balance desc) from accounts;
 select AccountID,Balance,AccountType, dense_rank() over 
 (partition by AccountType order by Balance desc) from accounts;
 #percent rank
 select AccountID,Balance, percent_rank() over (order by Balance) from accounts;
 set sql_safe_updates=0;
 update accounts set Balance=80000 where AccountID=105;
 
 #lead and Lag
select AccountID,Balance, lead(Balance) over (order by Balance desc)
 as Lead_Balance from accounts;
select AccountID,Balance, lag(Balance) over (order by Balance desc) 
as Lag_Balance from accounts;
  
  
  select AccountID, AccountType,Balance from accounts 
  where AccountType="Savings" or AccountType="Current";
  #membership
  select AccountID, AccountType,Balance from accounts 
  where AccountType in("Savings","Current");
  
  
  select LoanID,LoanAmount, rank() over (order by LoanAmount desc) from loans;
  update loans set LoanAmount=85000000 where LoanID=25;
  select LoanID,LoanAmount, dense_rank() over (order by LoanAmount desc) from loans;
  select LoanID,LoanAmount, percent_rank() over (order by LoanAmount) from loans;
  
  select LoanID,LoanAmount, lead(LoanAmount) over (order by LoanAmount desc)
  as Lead_Amount from loans;
  select LoanID,LoanAmount, lag(LoanAmount) over (order by LoanAmount desc)
 as Lag_Amount from loans;
 
 #Having clause
 select min(Balance),AccountType from accounts group by AccountType;
 select min(Balance),AccountType from accounts group by AccountType order by min(Balance);
 select min(Balance),AccountType from accounts group by AccountType having 
 (min(Balance)>10000) order by min(Balance);
 
 select min(Amount),TransationType from transactions group by TransationType;
  select min(Amount),TransationType from transactions group by TransationType order by min(Amount);
 select min(Amount),TransationType from transactions group by TransationType having
 (min(Amount)>1200) order by min(Amount);
 select TransationID,Amount,TransationType, dense_rank() over 
 (partition by Transationtype order by Amount desc) from transactions;

 delete from transactions;
 select * from transactions;
  insert into transactions (TransationID,Transation_Date,Amount,TransationType)values
 (101,"2026-07-01",15000,"Cash"),
 (102,"2026-10-15",30000,"UPI"),
 (103,"2026-08-30",25000,"Debit"),
 (104,"2026-11-25",1200,"Cash"),
 (105,"2026-02-10",15000,"UPI"),
 (106,"2026-01-01",30000,"UPI"),
 (107,"2026-07-12",12000,"Cash");
 
 #inbuilt function
 select now();
 select current_date();
 select sysdate();
 select current_timestamp();
 select datediff(now(),accountcreation_date)as total_days from customers;
 select datediff(now(),accountcreation_date)as total_days from customers order by total_days limit 1;
 select * from loans;
 select datediff(Enddate,StartDate)as duration_loan from loans;
 select date_add(now(),interval 6 month);
  select date_add(now(),interval 6 day);
  select CustomerID,date_add(accountcreation_date,interval 6 month) as lockingperiod from customers;
  
  select max(accountcreation_date) from customers;
  select greatest("2026-07-16","2026-08-16","2026-08-17") as the_greatest_date from customers limit 1;
  select greatest(450,345,234,567)as the_greatest_value from accounts limit 1;
  select least(450,345,234,567) from accounts limit 1;
  
  #stringFunctions
  select upper(FirstName),lower(LastName), concat(FirstName," ",LastName) as full_Name from customers;
  select upper(FirstName),lower(LastName), upper(concat(FirstName," ",LastName)) as full_Name from customers;
  select upper(FirstName),lower(LastName), lower(concat(FirstName," ",LastName)) as full_Name from customers;
   select (FirstName),(LastName), concat(FirstName," ",LastName) as full_Name from customers;
 
 select length(FirstName) from customers;
 select left(FirstName,2), right(FirstName,2) from customers;
 select left(FirstName,2) from customers;
 
 #MathFunction
 select 3+5,5-3,3*2,3/3,6%4;
 select * from Accounts;
 update accounts set Balance= Balance-2000 where AccountID=101;
 set sql_safe_updates=0;
 select round(270.367,2),floor(234.23);
 select ceil(234.23),floor(234.23);
 select ceil(234.56),floor(234.51);
 select truncate(234.23,1);
 select round(23.56,1),truncate(23.56,1);
 select abs(-235),abs(235);
 select mod(24,7),24%7;
 select power(2,4);
 select exp(2);
 
 
 
 
 