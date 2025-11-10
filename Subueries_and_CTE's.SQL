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