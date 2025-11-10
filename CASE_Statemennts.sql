Select 
    COUNT(job_id) AS Number_of_jobs,
    CASE
        When job_location = 'Anywhere' THEN 'remote'
        WHEN job_location = 'New York' THEN 'Local'
        ELSE 'onsite'
    END AS location_category
FROM job_postings_fact
GROUP BY location_category;


--problem

select job_id, job_title, job_location,
    CASE
        When salary_year_avg > 250000 THEN 'High Salary'
        WHEN salary_year_avg BETWEEN 100000 AND 250000 THEN 'Standard Salary'
        WHEN salary_year_avg < 100000 THEN 'Low Salary'
        ELSE 'Not Disclosed'
    END AS salary_category

FROM
    job_postings_fact
WHERE
    salary_year_avg is not NULL AND job_title_short = 'Data Analyst';
ORDER BY salary_category DESC;



select * from job_postings_fact where
 (salary_year_avg is not NULL) AND job_title_short = 'Data Analyst'
ORDER BY salary_year_avg desc limit 10;