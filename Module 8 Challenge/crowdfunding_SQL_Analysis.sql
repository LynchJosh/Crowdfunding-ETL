-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 
SELECT DISTINCT cf_id, backers_count
FROM campaign
WHERE outcome = 'live'
ORDER BY backers_count DESC;


-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.
SELECT DISTINCT(b.cf_id), ca.backers_count
FROM backers AS b
INNER JOIN campaign as ca 
ON ca.cf_id=b.cf_id
WHERE ca.outcome= 'live'
ORDER BY backers_count DESC;


-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 
SELECT con.first_name, con.last_name, con.email,
(ca.goal-ca.pledged) AS remaining_goal_amount
INTO email_contacts_remaining_goal_amount
FROM campaign AS ca
INNER JOIN contacts AS con
ON con.contact_id=ca.contact_id
WHERE ca.outcome='live'
ORDER BY remaining_goal_amount DESC;

 
DROP TABLE email_contacts_remaining_goal_amount; 

-- Check the table
SELECT * FROM email_contacts_remaining_goal_amount;

-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 
SELECT b.email, b.first_name, b.last_name, ca.cf_id, ca.company_name, ca.description, ca.end_date, (ca.goal-ca.pledged) AS "Left of Goal"
INTO email_backers_remaining_goal_amount
FROM backers AS b
JOIN campaign as ca 
ON ca.cf_id=b.cf_id
INNER JOIN contacts as c ON c.contact_id=ca.contact_id
ORDER BY b.last_name, b.first_name

-- Check the table
SELECT * FROM email_backers_remaining_goal_amount;




