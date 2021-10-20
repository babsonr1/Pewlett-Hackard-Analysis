--Challenge One SQL Code
select e.emp_no,
	e.first_name,
	e.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
into retirement_titles
from employees as e
	inner join titles as ti
		on(e.emp_no = ti.emp_no)
	where(e.birth_date between '1952-01-01' and '1955-12-31')

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

select count(u.emp_no),
	ti.title
into retiring_titles
from unique_titles as u
	inner join titles as ti
		on(u.emp_no = ti.emp_no)
	where (u.to_date = '9999-01-01')
group by ti.title
order by count(u.emp_no) desc;

--Challenge Two SQL Code
select distinct on (e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	ti.title
into mentorship_eligibility
from employees as e
	inner join dept_emp as de
		on(e.emp_no = de.emp_no)
	inner join titles as ti
		on(e.emp_no = ti.emp_no)
	where (e.birth_date between '1965-01-01' and '1965-12-31')
	and (de.to_date = '9999-01-01')
order by (e.emp_no)
