--������� ����������� � ������������ ��������� ������ ������ �� 2020 ���
select min(avail_balance) -- setting min 
from ACCOUNT -- indicting table
where OPEN_DATE BETWEEN '2020-01-01' AND '2020-12-31' -- setting date according to "open-date" column
select * from account 

select max(avail_balance) -- setting max 
from ACCOUNT -- indicting table
where OPEN_DATE BETWEEN '2020-01-01' AND '2020-12-31' --setting time interval

select * from ACCOUNT

select distinct OPEN_EMP_ID -- ������� ���������� ����������� � ������� ������� �� �����������
from account 


--������� ����� ������� ���� ������� � 1 ������ 2020 ���� ��� ����� ������� ��������� � � 2020 ����
select account_id -- choosing all id 
from account -- from table namend account
where LAST_ACTIVITY_DATE > '2020-04-01' or open_date > '2020-01-01' 
--    that were opened at these time interval 
-- includes both results that satisfy first condition and second condition 

--������� ����� ������� ���� ������� � ������ �� ������� 2020 ���� 
--� ����� �� ������ ���� ������� � ������ �� ���� 2020 ����

select open_date 
from account 
where OPEN_DATE not between '2020-01-01' and '2020-06-01'
and LAST_ACTIVITY_DATE between '2020-11-01' and '2020-12-01' 

--����� ������� ���������� �����������, � �������� ���������� � �������������

select * from employee

select count(emp_id), title, dept_id
from employee
group by title, dept_id 
order by count(emp_id)

--������� ���������� ����� ������� ���� ������� � 1 ���� 2019 ���� �� 31 ������� 2019 �  
--� ��������� �������� �� ����� 3000 (3000 ���� �����),
--������� ����������� �� �������� �������

select ACCOUNT_ID, OPEN_DATE, AVAIL_BALANCE --including colimns we need
from ACCOUNT 
where OPEN_DATE between '2019-06-01' and '2019-12-31' and AVAIL_BALANCE >= 3000 --setting required features
ORDER BY AVAIL_BALANCE DESC -- sorting in descending order

--�������� ������,
--�� �������� ������� ������� ��������� ������ ��� ������ � ��������� CD � CHK

select * from ACCOUNT

--SELECT AVG(AVAIL_BALANCE) FROM ACCOUNT
--WHERE PRODUCT_CD = 'CD' --and PRODUCT_CD = 'CHK' == ������ ���� ������ ������������?

SELECT AVG(avail_balance) from ACCOUNT
WHERE PRODUCT_CD IN ('CD','CHK')


--�������� ������, ������� ��������� ��������� ������ ������ �� ������� ���������
--(������� �������� ����)

select sum(avail_balance) as 'sum', OPEN_EMP_ID from account --added open_emp_id to check ascending order of emp id and 
-- named new column as sum 
group by OPEN_EMP_ID   -- grouped balance sum by employee 
order by OPEN_EMP_ID asc --sorted in ascending order


--��� ����� �����  ��������� ���������� (�������� ������� employee), 
--������� ���������� �� ������ �� 1 ������� 2020 ����

select * from CUSTOMER

select distinct TITLE
from EMPLOYEE
where START_DATE<'2020-10-01'

--������� ������ �������� ����������� � ����� MA � 
--� ������� �������� ������� ���������� �� 01 � �� ����������� � ������ Woburn
 
select CUST_ID, ADDRESS, CITY  from CUSTOMER --showing column and table we need
where state = 'MA' and POSTAL_CODE like '01___%' and city !='Woburn' -- using like opearator


select top 3 * from EMPLOYEE

--������� ���������� ������������ �������� ����������� � �������� ������������� � ��������
select  top 1 salary as 'max', ASSIGNED_BRANCH_ID, DEPT_ID
from employee 

select max(salary) as 'max', assigned_branch_id, dept_id
from employee
group by assigned_branch_id, dept_id
order by dept_id asc
-- ���������� ��������� �� ������ ������

--������� ���������� � ������� � ����� � ������� ������������ ���������� ����� �a�

select FIRST_NAME, last_name
from EMPLOYEE
where FIRST_NAME like '%a%' and LAST_NAME like '%a%'


�������������� ������� 

select emp_id, salary, TITLE 
from EMPLOYEE
where salary > 6000 or title = 'teller'

select sum(salary) as 'sum',
avg(salary) as avg, max(salary) as 'max', min(salary) as 'min' 
from EMPLOYEE

select first_name, last_name 
from EMPLOYEE
where FIRST_NAME like '_o%' or LAST_NAME like '%e'

select emp_id, salary
from EMPLOYEE
where salary >900 and salary <8000 

select distinct cust_id as 'cust', city as 'd_city' 
from customer

select max(salary) as 'max salary'
from employee 
where START_DATE > '2020-05-01' and title = 'teller'


select max(salary) as 'max salary', first_name
from employee 
where START_DATE > '2020-05-01' and title = 'teller'
group by SALARY

select sum (AVAIL_BALANCE) as summa,  
open_emp_id from account
group by open_emp_id
having sum(avail_balance) > 20000

select sum(salary), DEPT_ID 
from EMPLOYEE
where salary > 200
group by DEPT_ID
having sum(salary) > 3000

select sum(avail_balance), avg(avail_balance), product_cd
from account 
group by PRODUCT_CD
having sum(AVAIL_BALANCE) >= 3000 and 
avg(AVAIL_BALANCE) <= 7000
order by sum(AVAIL_BALANCE)

select * from employee emp 
inner join account acc
on emp.emp_id = acc.open_emp_id 

select sum(acc.avail_balance) as summa,
acc.open_emp_id, emp.first_name
from account acc
inner join employee emp
on acc.OPEN_EMP_ID = emp.EMP_ID
group by acc.open_emp_id, emp.first_name

select * from department dep 
left join employee emp
on dep.dept_id = emp.DEPT_ID
where emp.FIRST_NAME is null

select * from employee emp 
full join department dep 
on emp.DEPT_ID = dep.DEPT_ID

select * from employee emp, account acc
where emp.emp_id = acc.ACCOUNT_ID

select * from employee e1, employee e2
where e1.EMP_ID = e2.EMP_ID

select sum(AVAIL_BALANCE) as summa, PRODUCT_CD 
from account 
group by PRODUCT_CD
union
select sum(avail_balance), 'total' from account

select pr.name, pr.PRODUCT_CD
count(pr.product_cd)
from product pr, account acc
where acc.PRODUCT_CD = pr.PRODUCT_CD
group by pr.name, pr.product_cd
union 
select 'total', count(product_cd) from acc.product_cd

select datediff(year, OPEN_DATE, LAST_ACTIVITY_DATE), 
open_date, LAST_ACTIVITY_DATE
from account 