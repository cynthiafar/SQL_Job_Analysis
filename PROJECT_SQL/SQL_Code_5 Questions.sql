/* TOP PAYING JOBS DA/* 

SELECT	
	job_id,
	job_title,
	job_location,
	job_schedule_type,
	salary_year_avg,
	job_posted_date,
    name AS company_name

FROM
    job_postings_fact

LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id

WHERE
    job_title_short = 'Data Analyst' AND 
    job_location = 'Anywhere' AND 
    salary_year_avg IS NOT NULL

ORDER BY
    salary_year_avg DESC
LIMIT 10;




/* SKILLS 4 TOP PAYING JOBS/* 

WITH top_paying_jobs AS (
    SELECT	
        job_id,
        job_title,
        salary_year_avg,
        name AS company_name
    
    FROM
        job_postings_fact
    
    LEFT JOIN 
        company_dim ON job_postings_fact.company_id = company_dim.company_id
   
    WHERE
        job_title_short = 'Data Analyst' AND 
        job_location = 'Anywhere' AND 
        salary_year_avg IS NOT NULL
    
    ORDER BY
        salary_year_avg DESC

    LIMIT 10
)

SELECT 
    top_paying_jobs.*,
    skills

FROM top_paying_jobs

INNER JOIN 
    skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id

INNER JOIN 
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id

ORDER BY
    salary_year_avg DESC;


/*DA IN DEMAND SKILLS /* 


SELECT	
	job_id,
	job_title,
	job_location,
	job_schedule_type,
	salary_year_avg,
	job_posted_date,
    name AS company_name

FROM
    job_postings_fact

LEFT JOIN 
    company_dim ON job_postings_fact.company_id = company_dim.company_id

WHERE
    job_title_short = 'Data Analyst' AND 
    job_location = 'Anywhere' AND 
    salary_year_avg IS NOT NULL

ORDER BY
    salary_year_avg DESC

LIMIT 10;


/* SKILLS BASED ON SALARY /* 

SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = True 
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25;

/* SKILLS WITH HIGH DEMAND AND HIGH SALARIES /* 


SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary

FROM job_postings_fact

INNER JOIN 
    skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id

INNER JOIN 
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id

WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = True 

GROUP BY
    skills_dim.skill_id

HAVING
    COUNT(skills_job_dim.job_id) > 10

ORDER BY
    avg_salary DESC,
    demand_count DESC

LIMIT 25;