-----create database DSA_db

-----tables
create table employee(
staffid varchar (10),
FirstName varchar (100),
lastName varchar (100),
Gender Varchar(100),
Date_of_Birth date,
HireDate Date
primary key (staffid)
)
select * from employee

-----insert---
insert into employee(staffid, firstname, LastName, gender,Date_of_Birth, hiredate)
values ( 'AB201', 'Ayan', 'Olakun', 'female', '1992-08-22', '2018-02-09'),
( 'AB212', 'okorie', 'mercy', 'female','1988-10-09', '2018-10-09'),
( 'AB223', 'joshua', 'chukwuemeka', 'male','1980-10-09', '2022-02-09'),
( 'AB234', 'sanni', 'ibrahim', 'male','1958-10-09', '2019-09-23'),
( 'AB254', 'mercy', 'olanipekun', 'female','1982-10-09', '2020-02-09'),
( 'AB249', 'johnson', 'mercy', 'female','1982-10-09', '2019-12-09'),
( 'AB298', 'ayomide', 'halleluyah', 'female', '1982-10-09','2018-07-11'),
( 'AB260', 'deborah', 'justin', 'female','1982-10-09', '1988-02-09'),
( 'AB281', 'wale', 'olanipekun', 'male','1982-10-09', '2018-02-09')

INSERT INTO Employee (Staffid, FirstName, LastName, Gender, Date_of_Birth, HireDate)
Values ('AB296', 'Yusuf','olaide','Male','1990-10-10', '2022-01-20'),
('AB294', 'olajide','Ayodeji','Female','1976-10-10', '1990-01-20')

select * from employee


----first of all  create salary table---
create table salary(
salary_id int identity (1,1) not null,
staff_id varchar (255),
firstname varchar (255),
lastname varchar (255),
department varchar (max),
salary decimal (10,3)---(10:precision,3:sacle)
)
select * from salary


drop table employee
---import CSV files into DB---
---employee,csv
--salary,CSV
---payment,CSV

select * from Employee

select * from salary


alter table salary
alter column salary decimal (10,3)



-----create table for payment


CREATE TABLE payment(
paymentid int identity (1,1) primary key,
Account_No bigint not null,
staffid int,
Bank varchar (255) default 'Zenith Bank',
payment_method varchar (50) check (payment_method = 'Cash' or payment_method ='transfer')
)

select * from payment
drop table payment

select * from payment

------15/05/2025------------
select * from employee
select *from salary
select * from payment

----USE	OFSQL COMMAND------


---UPDATE
UPDATE EMPLOYEE
SET lastname = 'Abubakar'
where staffid ='AB234'
select * from employee


UPDATE Salary
set department = 'information tech'
where staffid = 'AB234'

select * from salary

---create STATE _OF_ORIGIN


ALTER table employee
add [State of Origin] varchar (100)

select * from employee

ALTER table employee 
drop column [State of origin]

update employee
set [state of origin] = 'Lagos'
where staffid ='AB200'


update employee
set [state of origin] = 'Niger'
where staffid ='AB289'

update employee
set [state of origin] = 'Plateau'
where staffid ='AB281'
 
select * from employee


------Analysis----
----total number of staff

select staffid
from employee


select count(staffid) as Totalemployee
from employee



---calculate total number of staff from state---

select[state of origin], count(staffid) as Totalemployee
from employee
group by [state of origin]

select * FROM employee



select[state of origin], count(staffid) as Totalemployee
from employee
group by [state of origin]
order by totalemployee desc

------calcualte the total number of staff from each department---

select [state of origin], count(distinct staffid) as TotalEmployee
from employee
group by [state of origin]

-----calculate the total number of staff from each department

select department, count(distinct staffid) as TotalEmployee
from salary
group by [department]
order by TotalEmployee desc




update salary 
set department = 'information tech'
where staffid IN ('AB401','AB249')


select * from salary
  


  ------HAVING----- 


  select department, count (distinct staffid) as TotalEmployee 
  from salary
  group by department 
  Having count(distinct staffid) >=3


  ------RELATIONAL OPERATOR
  ----LESS THAN <
  ------GREATER THAN >

  SELECT * FROM SALARY 
  WHERE SALARY > 500000

    SELECT * FROM SALARY 
  WHERE SALARY < 500000


  ----RANGE OPERATORS
  -----BETWEEN 
  ------NOT BETWEEN

    SELECT * FROM SALARY 
  WHERE SALARY BETWEEN 50000 AND  200000


    SELECT * FROM SALARY 
  WHERE SALARY NOT BETWEEN 100000 AND 500000


  ----- PROJECT---

  REVENUE 
  PRODUCT: BEVERAGES, DRINKS, BUSCUIT
  SELECT PRODUCT, SUM(REVENUE) AS TOTAL_REVENUE 
  FROM TRANSACTION 
  GROUP BY PRODUCT



  -----18/05/2025
  ----LIST OPERATORS
----1. IN
----2. NOT IN



Select * from employee
where staffid IN ('AB270','AB286','AB401')



Select * from employee
where FirstName IN ('johnson','mercy','okorie')


Select * from employee
where staffid NOT IN ('AB270','AB286','AB401')

Select * from employee
where FirstName NOT  IN ('johnson','mercy','okorie')
    


-----logical operatior
----AND
----OR



---- AND
select * from employee 
where Firstname = 'ADEBOWALE' AND GENDER = 'FEMALE'




select * from employee 
where Firstname = 'ADEBOWALE' AND GENDER = 'MALE'



----- OR
select * from employee 
where Firstname = 'ADEBOWALE' OR GENDER = 'FEMALE'



select * from employee 
where Firstname = 'ADEBOWALE' OR GENDER = 'BOY'



select * from salary 
where FirstName = 'johnson' AND department = 'Account'



select * from salary 
where FirstName = 'johnson' OR department = 'Account'


select * from salary 
where FirstName = 'johnson' OR department = 'Information Tech'


-----UPDATE----
Update salary
set staffid = 'AB350'
where staffid = 'AB401'



---- INCREASE IN SALARY---

---5% OR 0.05

update salary
set salary = salary * 0.05

update salary
set salary = salary * 1.05



----CREATE VIEW NEW_SALARY AS
update salary
set salary =salary - (salary * 0.05)

select* from salary

SELECT * FROM EMPLOYEE
WHERE GENDER = 'MALE' OR DATE_OF_BIRTH <= '1990-01-01'
AND [STATE OF ORIGIN] = 'LAGOS'


---SQL JOIN

SELECT * FROM Salary
SELECT * FROM EMPLOYEE
SELECT * FROM PAYMENT



----JOIN two table together--
SELECT EMPLOYEE.STAFFID,
SALARY.SALARY_ID,
EMPLOYEE.FIRSTNAME,
EMPLOYEE.GENDER,
EMPLOYEE.HIREDATE,
SALARY.DEPARTMENT,
SALARY.SALARY
from employee

join salary 
on salary.staffid =employee.staffid



SELECT EMPLOYEE.STAFFID,
EMPLOYEE.FIRSTNAME,
EMPLOYEE.GENDER,
EMPLOYEE.HIREDATE,
SALARY.SALARY_ID,
SALARY.DEPARTMENT,
SALARY.SALARY
from employee

Inner join salary 
on salary.staffid =employee.staffid




SELECT EMPLOYEE.STAFFID,
EMPLOYEE.FIRSTNAME,
EMPLOYEE.GENDER,
EMPLOYEE.HIREDATE,
SALARY.SALARY_ID,
SALARY.DEPARTMENT,
SALARY.SALARY
from employee

left join salary 
on salary.staffid =employee.staffid


---join3 tables


SELECT EMPLOYEE.STAFFID,
SALARY.SALARY_ID,Payment.paymentid,
EMPLOYEE.FIRSTNAME,
EMPLOYEE.GENDER,
EMPLOYEE.HIREDATE,
SALARY.DEPARTMENT,
SALARY.SALARY,payment.account_no, payment.bank,Payment.payment_method
from employee

join salary 
on salary.staffid =employee.staffid
join payment on payment.staffid= employee.staffid





SELECT EMPLOYEE.STAFFID,
SALARY.SALARY_ID,Payment.paymentid,
EMPLOYEE.FIRSTNAME,
EMPLOYEE.GENDER,
EMPLOYEE.HIREDATE,
SALARY.DEPARTMENT,
SALARY.SALARY,payment.account_no, payment.bank,Payment.payment_method
from employee

left join salary 
on salary.staffid =employee.staffid
left join payment on payment.staffid= employee.staffid



-----sub queries

select * from employee
select * from salary
select * from (
select  staffid,firstname,lastname, gender,hiredate
from employee) as employee
join ( 
select staffid,department,salary
from salary) as salary
on employee.staffid= salary.staffid


---analysis

select * from salary

---top 3 highest paid employee

select top 3 * FROM (
SELECT STAFFID,FIRSTNAME, LASTNAME,SALARY
from salary ) as salary

order by salary desc


---get second highest paid employee

select max(Salary) as secondhighestsalary
from salary
where salary < (select max (salary) from salary)

select top 1 staffid, firstname, lastname, salary as second_highest_salary
from salary 
where salary < (select max (salary) from salary)
order by salary desc


----AVERAGE SALARY BY DEPARTMENT

SELECT DEPARTMENT, AVG (SALARY) AS AVERAGESALARY
FROM (
SELECT DEPARTMENT,SALARY 
FROM SALARY) AS DEPARMENTSALARY
GROUP BY DEPARTMENT



SELECT DEPARTMENT, avg (salary) as averagesalary
from salary
group by department

----SQL view

create view vw_emplysalary_tbl
as

SELECT EMPLOYEE.STAFFID,
SALARY.SALARY_ID,Payment.paymentid,
EMPLOYEE.FIRSTNAME,
EMPLOYEE.GENDER,
EMPLOYEE.HIREDATE,
SALARY.DEPARTMENT,
SALARY.SALARY,payment.account_no, payment.bank,Payment.payment_method
from employee

join salary 
on salary.staffid =employee.staffid
join payment on payment.staffid= employee.staffid

select * from vw_emplysalary_tbl



---union & union all


create table DSA_Mall_Ikeja (
CustomerID Int not null,
FirstName varchar (max),
LastName varchar (max),
Customer_gender nvarchar (max),
TransactionDate Date Default Getdate(),
[Address] varchar (max),
Transaction_Amount decimal (18,4)
)

select * from DSA_Mall_Ikeja
   
select * from  [dbo].DSA_MALL_Ghana

select * from DSA_Mall_portharcourt




select * from DSA_Mall_Ikeja
 union all
select * from  [dbo].DSA_MALL_Ghana
union all
select * from DSA_Mall_portharcourt




----create column (branch)
create view vw_DSA_MALL_transactions
as

select 
'DSA MALL GHANA' as branch, customerid as [CUSTOMER ID],
firstname as [FIRST NAME], lastname as [LAST NAME], customer_gender as GENDER,TRANSACTIONDATE as [DATE],
[ADDRESS],transaction_amount as [TRANSACTION AMOUNT]
from [dbo].[DSA_MALL_Ghana]
UNION

select 
'DSA_MALL_ikeja' as branch, customerid as [CUSTOMER ID],
firstname as [FIRST NAME], lastname as [LAST NAME], customer_gender as GENDER,TRANSACTIONDATE as [DATE],
[ADDRESS],transaction_amount as [TRANSACTION AMOUNT]
from [dbo].[DSA_Mall_ikeja]

UNION

select 
'DSA _MALL_portharcourt' as branch, customerid as [CUSTOMER ID],
firstname as [FIRST NAME], lastname as [LAST NAME], customer_gender as GENDER,TRANSACTIONDATE as [DATE],
[ADDRESS],transaction_amount as [TRANSACTION AMOUNT]
from [dbo].[DSA_Mall_portharcourt]

select * from dbo.vw_DSA_MALL_transactions


---total sales per branch

select branch, sum([transaction amount])as [total sales]
from[dbo].vw_DSA_MALL_transactions
group by Branch
order by [total sales] desc


select GENDER, sum([transaction amount])as [total sales]
from[dbo].vw_DSA_MALL_transactions
group by GENDER
order by [total sales] desc


---total sales per branch

select branch, avg([transaction amount])as [average sales]
from[dbo].vw_DSA_MALL_transactions
group by Branch
order by [average sales] desc

select GENDER, avg([transaction amount])as [average sales]
from[dbo].vw_DSA_MALL_transactions
group by GENDER
order by [average sales] desc


----DATE analysis

select * from dbo.vw_DSA_MALL_transactions
where [date]='2025-04-15'


select GENDER, sum([transaction amount])as [average sales]
from[dbo].vw_DSA_MALL_transactions
where [date] = '2025-04-15'
group by GENDER


----analysis base on branch

---add gender



select branch, sum([transaction amount]) as revenue
from [dbo].[vw_DSA_MALL_transactions]
where branch='DSA MALL ikeja'and [date]='2025-05-21'
group by branch,gender


-----26/05/2025

CASE WHEN

Select * from  employee

alter table employee
Add [State Of Origin] varchar (255)


select staffid,'ayomid' from employee

update employee  
set [state of origin] = 
case 
when 'staffid' = 'AB200' then 'Delta'
when 'staffid' = 'AB212' then 'Lagos'
when 'staffid' = 'AB223' then 'Oyo'
when 'staffid' = 'AB234' then 'Bauchi'
when 'staffid' = 'AB240' then 'Port harcourt'
when 'staffid' = 'AB249' then 'Lagos'
when 'staffid' = 'AB254' then 'Edo'
when 'staffid' = 'AB260' then 'Ekiti'
when 'staffid' = 'AB268' then 'Delta'
when 'staffid' = 'AB270' then 'Lagos'
when 'staffid' = 'AB278' then 'Lagos'
when 'staffid' = 'AB281' then 'Kano'
when 'staffid' = 'AB282' then 'Edo'
when 'staffid' = 'AB286' then 'Oyo'
when 'staffid' = 'AB298' then 'Delta'
when 'staffid' = 'AB200' then 'Lagos'
Else [State Of Origin] -- keep the current value
End



