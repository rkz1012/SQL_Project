
CREATE Table january_jobs AS
    select 
      *
    FROM 
      job_postings_fact
    where (EXTRACT(MONTH FROM job_posted_date) = 1);