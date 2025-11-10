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
left JOIN company_job_count cjc on cjc.company_id = cd.company_id;