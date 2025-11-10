Select *
FROM
    (SELECT * from job_postings_fact
     WHERE EXTRACT(MONTH FROM job_posted_date) = 1)
     AS Jan_jobs;
