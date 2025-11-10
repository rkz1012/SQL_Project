Select 
    COUNT(job_id) AS Number_of_jobs,
    CASE
        When job_location = 'Anywhere' THEN 'remote'
        WHEN job_location = 'New York' THEN 'Local'
        ELSE 'onsite'
    END AS location_category
FROM job_postings_fact
GROUP BY location_category;