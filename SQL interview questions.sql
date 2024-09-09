/* Write a query to find theemployees who have salary greater than their 
managers salary from Employee_data1 */

select * from employee_data1;

select e1.employeeid,e1.salary,e1.employeename 
from employee_data1 e1
join employee_data1 e2
on e1.managerid=e2.employeeid
where e1.salary > e2.salary
order by employeeid;

/*Write a SQL query to calculate the cumulative sum of sales for each
employee. The query should return the EmployeeID, SalesDate, and
CumulativeSales columns, with the final output ordered by EmployeeID.*/

select * from employee_data;

select employeeid,salesdate,
sum(salesamount) over (partition by employeeid order by salesdate) as cum_salary
from employee_data
order by employeeid;

/* Given a table Employees, write a query to find the third highest
salary */

create table employees(employeeid int,name varchar(20),salary int);
insert into employees values(1,'Rahul',6000);
insert into employees values(2,'Priya',7000);
insert into employees values(3,'Ankit',8000);
insert into employees values(4,'Snehal',9000);
insert into employees values(5,'Ajay',9000);
insert into employees values(6,'Riya',5000);

select * from employees;

with cte as
(salary,
 dense_rank() over(order by salary desc) as salary_rank
 from employees)
select salary
from cte
where salary_rank=3;

/*Given a table Purchases, write a query to find employees who
bought a product for at least 3 consecutive days */

create table purchases(employeeid int,purchasedate date);
insert into purchases values(1,'2024-08-01');
insert into purchases values(1,'2024-08-02');
insert into purchases values(1,'2024-08-03');
insert into purchases values(2,'2024-08-01');
insert into purchases values(2,'2024-08-03');
insert into purchases values(3,'2024-08-02');
insert into purchases values(3,'2024-08-03');
insert into purchases values(3,'2024-08-04');
insert into purchases values(4,'2024-08-02');

select * from purchases;

select distinct p1.employeeid
from purchases p1
join purchases p2
on p1.employeeid=p2.employeeid
and date_add(p1.purchasedate,interval 1 day)=p2.purchasedate
join purchases p3
on p2.employeeid=p3.employeeid
and date_add(p2.purchasedate,interval 1 day)=p3.purchasesdate





















