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