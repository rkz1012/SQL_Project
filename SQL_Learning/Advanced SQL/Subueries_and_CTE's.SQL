Select *
FROM
    (SELECT * from job_postings_fact
     WHERE EXTRACT(MONTH FROM job_posted_date) = 1)
     AS Jan_jobs;


--- CTE's
with feb_jobs AS (
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 2
)
SELECT *
FROM feb_jobs;


--- subquery example
SELECT
  company_id,
  name AS company_name
FROM
  company_dim
WHERE
  company_id IN (
    SELECT
      company_id
    FROM
      job_postings_fact
    WHERE
      job_no_degree_mention = TRUE
      ORDER BY company_id
  );



  ---CTE example

with company_job_count AS
(
select 
    company_id,COUNT(*)
from 
    job_postings_fact
GROUP BY 
    company_id
)

select cd.name as company_name, cjc.count as total_jobs
from company_dim cd
left JOIN company_job_count cjc on cjc.company_id = cd.company_id
order by total_jobs DESC;

---DA in chennnai
with company_job_count AS
(
select 
    company_id,COUNT(*),job_location
from 
    job_postings_fact
GROUP BY 
    company_id,job_country,job_location
HAVING
    job_country = 'India' 
)

select cd.name as company_name, cjc.count as total_jobs, cjc.job_location
from company_dim cd
left JOIN company_job_count cjc on cjc.company_id = cd.company_id 
where cjc.count IS NOT NULL and cjc.job_location like '%Chennai%'
order by total_jobs DESC;

--- problem1
---Determine the size category ('Small', 'Medium', or 'Large') for each company by first identifying the number of job postings they have. Use a subquery to calculate the total job postings per company. A company is considered 'Small' if it has less than 10 job postings, 'Medium' if the number of job postings is between 10 and 50, and 'Large' if it has more than 50 job postings. Implement a subquery to aggregate job counts per company before classifying them based on size.


SELECT
    cd.name AS company_name, -- Added company name
    company_counts.total_jobs,
    CASE
        WHEN company_counts.total_jobs < 10 THEN 'Small'
        WHEN company_counts.total_jobs BETWEEN 10 AND 50 THEN 'Medium'
        WHEN company_counts.total_jobs > 50 THEN 'Large'
        ELSE 'Unknown'
    END AS company_size_category
FROM
    company_dim AS cd -- Start with the company dimension table
INNER JOIN
    (
        -- Subquery: Calculate the total job postings per company
        SELECT
            company_id,
            COUNT(job_id) AS total_jobs
        FROM
            job_postings_fact
        GROUP BY
            company_id
    ) AS company_counts ON cd.company_id = company_counts.company_id -- Join on company_id
ORDER BY
    company_counts.total_jobs DESC;

--- practice problem
with remote_job_skills AS
(
select 
    skill_id,count(*)as skill_count
FROM
    skills_job_dim as skills_to_job
INNER JOIN job_postings_fact as job_postings on job_postings.job_id = skills_to_job.job_id
WHERE
    job_postings.job_work_from_home = TRUE AND job_postings.job_title_short = 'Data Analyst'
GROUP BY
    skill_id
)

select skill.skill_id,skills as skill_name,skill_count
from remote_job_skills
INNER JOIN skills_dim  as skill on skill.skill_id = remote_job_skills.skill_id
ORDER BY skill_count DESC
limit 5;