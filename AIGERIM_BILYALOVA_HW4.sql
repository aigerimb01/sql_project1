use BANK_DB


--task 1 
select concat(LAST_NAME, ' ', FIRST_NAME) as name, TITLE, 
concat(substring(convert(varchar,start_date, 112), 1, 4), ' ', 'year') as year
from employee

--task2
select trim(' ' from ADDRESS) as trim, len(ADDRESS)+ len(city) as checking from CUSTOMER c
inner join ACCOUNT a
on c.CUST_ID = a.CUST_ID
group by address, city
having len(ADDRESS)+ len(city)> 22

select trim(ADDRESS) as trim_address from CUSTOMER c
where len(ADDRESS)+ len(city)> 22 

--кажется мой трим не работает 


--task 3

select e.FIRST_NAME, e.LAST_NAME, d.NAME, max(SALARY) as 'max salary'
from employee e
inner join DEPARTMENT d
on e.emp_id = d.DEPT_ID
group by d.NAME, e.FIRST_NAME, e.LAST_NAME


select * from EMPLOYEE
select * from DEPARTMENT



select * from customer cus, 
(select acc.cust_id, sum(avail_balance) as balance from account acc
group by acc.CUST_ID) acc2 
where acc2.CUST_ID = cus.CUST_ID



-- answer 
select FIRST_NAME,
(select name from DEPARTMENT d where d.DEPT_ID = EMPLOYEE.DEPT_ID) name
from EMPLOYEE 
where salary in (select max(salary) from EMPLOYEE group by DEPT_ID)


--task4 
select*from CUSTOMER

select 
case 
when substring(postal_code, 2, 1) = 1 
then 'one'
when substring(POSTAL_CODE, 2, 1) = 2
then 'two'
else 'other'
end name,
ADDRESS, CITY, POSTAL_CODE
from CUSTOMER


--task5

with b as (select 
sum(salary) as sum, DEPT_ID from EMPLOYEE
group by DEPT_ID)
select d.NAME from DEPARTMENT d, b
where d.DEPT_ID = b.dept_id


--task 6 
select ADDRESS, city, CUST_ID from CUSTOMER
where cust_id in 
(select count(account_id) from account
where AVAIL_BALANCE > 500
group by CUST_ID
having count(ACCOUNT_ID) >=2 )

--double check this task before submitting

--task 7 



with b as( select max(AVAIL_BALANCE) as max, OPEN_BRANCH_ID from ACCOUNT
group by OPEN_BRANCH_ID)
select ACCOUNT_id, account.OPEN_BRANCH_ID, b.max from ACCOUNT, b
where ACCOUNT.OPEN_BRANCH_ID = b.OPEN_BRANCH_ID


--task 8 

select * from ACCOUNT

select * from BRANCH

select ACCOUNT_id from ACCOUNT
where AVAIL_BALANCE = (select max(AVAIL_BALANCE) from ACCOUNT )


--task 9 

with b as (select sum(AVAIL_BALANCE) as sum_of, OPEN_BRANCH_ID from account 
group by OPEN_BRANCH_ID)
select city, b.sum_of from BRANCH, b
where  BRANCH.BRANCH_ID = b.OPEN_BRANCH_ID
union 
select 'TotalSum', sum(sum_of) from b
order by sum_of asc

--task 10 
select * from CUSTOMER
select * from account

select sum(AVAIL_BALANCE) as sum, CUST_ID
from ACCOUNT
group by CUST_ID
having sum(AVAIL_BALANCE) < (select sum(AVAIL_BALANCE) from account 
where CUST_ID = 10
group by cust_id)