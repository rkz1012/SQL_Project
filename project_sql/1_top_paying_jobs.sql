/*
Question: What are the top-paying data analyst jobs?
- Identify the top 10 highest-paying Data Analyst roles that are available remotely.
- Focuses on job postings with specified salaries (remove nulls).
- Why? Highlight the top-paying opportunities for Data Analysts, offering insightsinto emp
*/

SELECT
    job_id,
    job_title,
    name as company_name,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date
FROM
    job_postings_fact  
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short LIKE '%Data Analyst%'
    AND job_location = 'Anywhere'
    AND salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10;



/*

💰 Salary and Role Insights
1. The True Average and the Outlier
The salaries for these top 10 remote jobs range from $185,000.00 to a staggering $650,000.00.

Overall Mean Salary: $264,606.15

Median Salary: $211,000.00

The high mean is heavily influenced by one extreme outlier: the "Data Analyst" role at Mantys with a $650k salary. The median of $211,000 is a much more representative measure of a typical top-tier Data Analyst salary.

2. Salary by Job Seniority
Excluding the single $650k outlier, the salary structure strongly correlates with job title seniority:

Seniority/Role Type	Average Salary	Key Roles
Director/Assoc. Dir.	$260,546.17	Director of Analytics, Associate Director- Data Insights
Principal	$193,333.33	Principal Data Analyst
Senior	$185,000.00	Senior Data Analyst
Key Insight: To consistently command a salary above $200,000, you are generally required to hold a Director/Associate Director title, which implies a greater scope of responsibility, team management, and strategic influence.

🏢 Company and Posting Insights
3. Top-Paying Companies
Company Name	Average Yearly Salary
Mantys	$650,000.00
Meta	$336,500.00
AT&T	$255,829.50
Pinterest Job Advertisements	$232,423.00
Uclahealthcareers	$217,000.00
Key Insight: While the list includes large established corporations (Meta, AT&T), the two single highest-paying positions came from Mantys and Meta, suggesting that high-paying roles are often concentrated in tech companies and rapidly growing or well-funded startups.

4. Job Posting Trends (2023)
The postings were not evenly distributed throughout the year:

Month Posted	Count
August	3
January	2
December	2
February, June, July	1 each
Key Insight: The highest volume of top-paying remote Data Analyst jobs were posted in August, followed by the start and end of the year (January and December). This trend suggests a potential seasonal spike in hiring for high-value roles toward the end of Q3 and Q4.
*/