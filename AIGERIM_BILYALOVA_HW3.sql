--task 1 
select * from BRANCH
select * from EMPLOYEE
select * from ACCOUNT
select account_id
from ACCOUNT
left join BRANCH
on open_branch_id = branch_id 
where ADDRESS = '422 Maple St.'

--task2
select first_name, LAST_NAME -- to show that we have two susans
from employee 
left join account 
on employee.emp_id  = open_emp_id
where OPEN_EMP_ID is null and CUST_ID is null
order by FIRST_NAME asc

--task 3 
select dept_id, count(emp_id) as 'количество сотрудников'
from EMPLOYEE
group by dept_id
having count(emp_id) >2
order by count(emp_id) asc

--task 4
select first_name, last_name, ASSIGNED_BRANCH_ID, title, city -- to check title and city 
from EMPLOYEE
left join BRANCH
on ASSIGNED_BRANCH_ID = BRANCH_ID
where CITY = 'Salem'
or TITLE = 'president'

--task 5
select datepart(year, start_date) as year, avg(salary) as average
from EMPLOYEE
group by datepart(year, START_DATE)

--task 6
select first_name as name, ACCOUNT_ID as account,  datediff(year,open_date, LAST_ACTIVITY_DATE)
from employee
inner join ACCOUNT
on emp_id = OPEN_EMP_ID
where datediff(year,open_date, LAST_ACTIVITY_DATE) >= 1 

select *from ACCOUNT

--task 7

select last_name, name as 'department name', ACCOUNt_id, datediff(day, OPEN_DATE, LAST_ACTIVITY_DATE)
from EMPLOYEE
left join DEPARTMENT
on employee.DEPT_ID = department.DEPT_ID
left join account
on EMP_ID = OPEN_EMP_ID
where datediff(day, open_date, LAST_ACTIVITY_DATE) >= 200
order by LAST_NAME asc


--task 8
select 'sum salary', sum(salary) from EMPLOYEE
union 
select 'sum balance', sum(avail_balance) from ACCOUNT

--task 9 
select cus.address, cus.city, count(ACCOUNT.account_id) as account
from CUSTOMER cus, account
where cus.cust_id = account.CUST_ID
group by cus.address, cus.CITY 
having count(ACCOUNT.account_id) >= 2


--task 10 

select emp.title, count(account_id)
from EMPLOYEE emp
full outer join account 
on emp.EMP_ID = ACCOUNT.OPEN_EMP_ID
group by title
order by title asc

select pr.name, pr.product_cd, 

select * from EMPLOYEE
select * from account

select orders.orderid, custo