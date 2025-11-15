/*
Question: What skills are required for the top-paying data analyst jobs?
- Use the top 10 highest-paying Data Analyst jobs from first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills,
helping job seekers understand which skills to develop that align with top salaries
*/

WITH top_paying_jobs AS ( 
    SELECT
        job_id,
        job_title,
        name as company_name,
        salary_year_avg
    FROM
        job_postings_fact  
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short LIKE '%Data Analyst%'
        AND job_location = 'Anywhere'
        AND salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)

SELECT 
    top_paying_jobs.* ,
    skills_dim.skills
FROM top_paying_jobs
INNER JOIN skills_job_dim on top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    top_paying_jobs.salary_year_avg DESC;


/*
📈 Top 10 Most Required Skills
The chart below visualizes the frequency of the top 10 skills.

The analysis reveals the following hierarchy of skills for securing a top-paying Data Analyst role:

SQL (Structured Query Language) is the most required skill, appearing in 8 out of 8 unique job postings. This confirms that advanced database querying is the foundation of any high-paid data role.

Python follows closely, indicating that these roles require more than basic analysis, involving advanced data manipulation, statistics, or machine learning (often facilitated by the Python library Pandas, which is also on the list).

Tableau is the leading visualization tool, required in nearly every job, emphasizing the critical need for strong data storytelling and reporting skills.

Cloud and Data Warehousing Tools like AWS (Amazon Web Services) and Snowflake are essential, showing that top-paying roles operate on modern, scalable data infrastructure.
*/