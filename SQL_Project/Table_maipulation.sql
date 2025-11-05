select * from job_applied;CREATE TABLE job_applied_new(
    job_id INT,
    application_sent_date DATE,
    custom_resume BOOLEAN,
    resume_file_name VARCHAR(255),
    cover_letter_sent BOOLEAN,
    cover_letter_file_name VARCHAR(255),
    status VARCHAR(50) 
);

INSERT INTO job_applied (job_id, application_sent_date, custom_resume, resume_file_name, cover_letter_sent, cover_letter_file_name, status)
VALUES
(1, '2024-01-15', TRUE, 'resume_jan2024.pdf', TRUE, 'coverletter_jan2024.pdf', 'Under Review'),
(2, '2024-02-20', FALSE, 'standard_resume.pdf', FALSE, NULL, 'Applied'),
(3, '2024-03-05', TRUE, 'resume_mar2024.pdf', TRUE, 'coverletter_mar2024.pdf', 'Interview Scheduled'),
(4, '2024-04-10', FALSE, 'standard_resume.pdf', FALSE, NULL, 'Rejected'),
(5, '2024-05-18', TRUE, 'resume_may2024.pdf', TRUE, 'coverletter_may2024.pdf', 'Offer Extended');

select * from job_applied;

ALTER TABLE job_applied
ADD contact varchar(50);

update job_applied
set contact = 'someone'
where job_id = 1;

UPDATE job_applied
set contact = 'someone2'
where job_id = 2;

UPDATE job_applied
SET contact = 'someone3'
WHERE job_id = 3;

UPDATE job_applied
SET contact = 'someone4'
WHERE job_id = 4;

UPDATE job_applied
SET contact = 'someone5'
WHERE job_id = 5;

ALTER Table job_applied
RENAME COLUMN contact to contact_name;

alter Table job_applied
alter COLUMN contact_name TYPE Text;

ALTER TABLE job_applied
drop COLUMN contact_name;
