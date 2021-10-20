# Pewlett Hackard Analysis
## Overview
The purpose of this analysis is to incorporate csv files into sql code to identify trends and deal with large data sets. A framework was created to establish connections between six different csv files all correlating to employees of a company. Extrapolations and conclusions were then made based on the amount of people that are most likely going to retire in the next couple of years. The point for the project manager was to determine how much retirement will occur, in what positions, and who could qualify for a mentorship program. In terms of the class, the purpose was to experiment with postgreSQL and pgAdmin 4.
## Results
In the employee database, there have been several people that have been promoted, so only the most recent position had to be taken into account. This was done by using the following code:
```
select distinct on (e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
into unique_titles
from employees as e
	inner join titles as ti
		on(e.emp_no = ti.emp_no)
	where(e.birth_date between '1952-01-01' and '1955-12-31')
order by e.emp_no, ti.to_date desc;
```
The ```dictinct on()``` function allows for only the first row of a particular column to be looked at. In this case, this column was the employee number and was reverse order so the top row per employee number was the most recent position.

From the code that provided retiring_titles.csv, it can be seen that the most people eligible for retirement are senior engineers followed by senior staff. Next, the non-senior counterparts follow up respectively. The title with significantly less able to retire are managers with a total of 2 contenders.

Subsequently, in order to logically mentor new hirees, the CEO ordered a mentorship program that correlates to the title of the position. Proportionally, more people are able to mentor new hirees in the senior engineer positions. This was decided using the same expected retirees worksheet from the previous code and the birth dates. This was done to determine who is most likely to be able to mentor new people.
## Summary
49,088 people in this company could potentially retire in the next couple of years. 17,726 are senior engineers, 16,696 are senior staff, 6,311 are engineers, 5,116 are staff, 2,505 are technique leaders, 732 are assistant engineers, and 2 are managers. It is very difficult to hire a large amount of higher position jobs, as people might not be trained for the positions, so, most likely, people would be promoted and more people would be needed for the lower positions than it appears.

There are 34 people eligible to mentor in the assistant engineer position and none that are managers. These are the lowest two categories of potential mentors. Although the other categories have more people available to mentor, there are not nearly enough people to mentor everyone, assuming all of the retirees do, in fact, retire.
