SELECT 
    job_title_short,
    company_id,
    job_location
FROM 
    january_jobs

UNION

-- Get jobs and companies from February
SELECT 
    job_title_short,
    company_id,
    job_location
FROM 
    february_jobs;

    SELECT 
    job_title_short,
    company_id,
    job_location
FROM 
    january_jobs

UNION ALL

-- Get jobs and companies from February
SELECT 
    job_title_short,
    company_id,
    job_location
FROM 
    february_jobs;


--- Practice problem
SELECT 
    q1_job_postings.job_title_short,
    q1_job_postings.job_location,
    q1_job_postings.job_via,
    q1_job_postings.salary_year_avg,
    q1_job_postings.job_posted_date :: date
FROM
(
select *
from january_jobs
UNION ALL
select *
from february_jobs
UNION ALL
select *
from march_jobs
) as q1_job_postings
where
 q1_job_postings.salary_year_avg > 70000 and q1_job_postings.job_title_short = 'Data Analyst';
