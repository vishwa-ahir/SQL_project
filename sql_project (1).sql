show databases;
create database Project;
use  Project;

select * from hr_1;
select * from hr_2;

-- total empcount
select count(EmployeeCount) from hr_1;

-- total Attrition
select count(Attrition) from hr_1;

-- avg age
select avg(Age) from hr_1;

-- rename column name 
alter table hr_2 rename column `Employee ID` to Employee_id;

select YearsAtCompany, case 
when YearsAtCompany >= 18 then "Due_for_retirement"
else "On_service"
end as Retirement from hr_2
order by YearsAtCompany;

-- emp_id wise job saticfaction
select h.Employee_id, case
when JobSatisfaction <=2 then "High"
when JobSatisfaction =3 then "Medium"
else "Low"
end as Job_Saticfaction from hr_1 as js inner join hr_2 as h
on  h.Employee_id = js.EmployeeNumber
group by h.Employee_id;

-- employees wise performance rating
select Employee_id,PerformanceRating, case 
when PerformanceRating = 4 then "Low_ Rating"
else "High_Rating"
end as Performance_Rating from hr_2
order by Employee_id;

-- Unique dept wise job Role
select distinct(Department),jobRole from hr_1 inner join hr_2 on hr_1.EmployeeNumber=hr_2.Employee_id;

-- Department wise Attirition
SELECT
  Department,
  COUNT(*) AS total_employees,
  SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS total_attrition,
  ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_percentage
FROM hr_1
GROUP BY Department;


