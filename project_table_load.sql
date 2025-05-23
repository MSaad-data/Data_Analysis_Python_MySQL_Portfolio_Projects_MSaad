-- Project Title 
-- "Stack Overflow Post Analysis: A SQL Portfolio Project"

-- Creation of database with name "project" 

CREATE DATABASE project;

 -- using "project" database 
 
USE project;

-- creation of tables:

CREATE TABLE badges (
    id INT PRIMARY KEY,
    user_id INT,
    name VARCHAR(255),
    date DATE
);

INSERT INTO badges (id, user_id, name, date) VALUES
(1, 1001, 'Gold Contributor', '2024-01-01'),
(2, 1002, 'Silver Helper', '2024-01-05'),
(3, 1003, 'Bronze Reviewer', '2024-02-10'),
(4, 1001, 'Silver Helper', '2024-03-15'),
(5, 1004, 'Gold Contributor', '2024-04-20'),
(6, 1001, 'Gold Contributor', '2024-05-05'),
(7, 1002, 'Bronze Reviewer', '2024-06-10'),
(8, 1003, 'Silver Helper', '2024-07-10'),
(9, 1004, 'Gold Contributor', '2024-08-01'),
(10, 1001, 'Bronze Reviewer', '2024-09-01');


CREATE TABLE comments (
    id INT PRIMARY KEY,
    post_id INT,
    user_id INT,
    creation_date DATE,
    text TEXT
);

INSERT INTO comments (id, post_id, user_id, creation_date, text) VALUES
(1, 2001, 1001, '2024-01-01', 'Great explanation!'),
(2, 2002, 1002, '2024-01-05', 'This helped a lot.'),
(3, 2003, 1003, '2024-01-10', 'Can you clarify?'),
(4, 2004, 1001, '2024-01-15', 'Excellent resource.'),
(5, 2005, 1004, '2024-01-20', 'Thank you for sharing.'),
(6, 2001, 1002, '2024-01-25', 'I agree, very useful.'),
(7, 2003, 1003, '2024-02-01', 'This solved my issue.'),
(8, 2004, 1001, '2024-02-05', 'Thanks for the info.'),
(9, 2005, 1004, '2024-02-10', 'Could use more detail.'),
(10, 2006, 1002, '2024-02-15', 'Good job on this one!');


CREATE TABLE post_history (
    id INT PRIMARY KEY,
    post_history_type_id INT,
    post_id INT,
    user_id INT,
    text TEXT,
    creation_date DATE
);

INSERT INTO post_history (id, post_history_type_id, post_id, user_id, text, creation_date) VALUES
(1, 1, 2001, 1001, 'Initial post creation', '2024-01-01'),
(2, 2, 2002, 1002, 'Edited post for clarity', '2024-01-05'),
(3, 3, 2003, 1003, 'Comment added by moderator', '2024-01-10'),
(4, 1, 2004, 1001, 'First version of the post', '2024-01-15'),
(5, 2, 2005, 1004, 'Reworded answer', '2024-01-20'),
(6, 3, 2001, 1002, 'User updated answer with additional info', '2024-01-25'),
(7, 1, 2003, 1003, 'Post originally created', '2024-02-01'),
(8, 3, 2004, 1001, 'Moderators edited content', '2024-02-05'),
(9, 2, 2005, 1004, 'User revised explanation', '2024-02-10'),
(10, 3, 2006, 1002, 'Moderators flagged inappropriate content', '2024-02-15');


CREATE TABLE post_links (
    id INT PRIMARY KEY,
    post_id INT,
    related_post_id INT,
    link_type_id INT
);

INSERT INTO post_links (id, post_id, related_post_id, link_type_id) VALUES
(1, 2001, 2002, 1),
(2, 2002, 2003, 2),
(3, 2003, 2004, 1),
(4, 2004, 2005, 3),
(5, 2005, 2006, 2),
(6, 2001, 2004, 3),
(7, 2002, 2006, 1),
(8, 2003, 2005, 2),
(9, 2004, 2006, 3),
(10, 2005, 2001, 2);



CREATE TABLE tags (
    id INT PRIMARY KEY,
    tag_name VARCHAR(255)
);

INSERT INTO tags (id, tag_name) VALUES
(1, 'SQL Joins'),
(2, 'SQL Optimization'),
(3, 'SQL Indexing'),
(4, 'SQL Subqueries'),
(5, 'SQL Group By'),
(6, 'SQL Database Normalization'),
(7, 'SQL Window Functions');


CREATE TABLE users (
    id INT PRIMARY KEY,
    display_name VARCHAR(255),
    reputation INT,
    creation_date DATE
);

INSERT INTO users (id, display_name, reputation, creation_date) VALUES
(1001, 'Alice', 1500, '2024-01-01'),
(1002, 'Bob', 1200, '2024-01-05'),
(1003, 'Charlie', 800, '2024-01-10'),
(1004, 'Dave', 1800, '2024-01-15'),
(1005, 'Eve', 1000, '2024-01-20'),
(1006, 'Frank', 2000, '2024-01-25'),
(1007, 'Grace', 1300, '2024-02-01'),
(1008, 'Hank', 1100, '2024-02-05'),
(1009, 'Ivy', 900, '2024-02-10'),
(1010, 'Jack', 1600, '2024-02-15');


CREATE TABLE votes (
    id INT PRIMARY KEY,
    post_id INT,
    vote_type_id INT,
    creation_date DATE
);

INSERT INTO votes (id, post_id, vote_type_id, creation_date) VALUES
(1, 2001, 1, '2024-01-01'),
(2, 2002, 2, '2024-01-05'),
(3, 2003, 1, '2024-01-10'),
(4, 2004, 2, '2024-01-15'),
(5, 2005, 1, '2024-01-20'),
(6, 2001, 2, '2024-01-25'),
(7, 2003, 1, '2024-02-01'),
(8, 2004, 2, '2024-02-05'),
(9, 2005, 1, '2024-02-10'),
(10, 2006, 2, '2024-02-15');


CREATE TABLE posts (
    id INT PRIMARY KEY,
    title VARCHAR(255),
    post_tag_id INT,
    creation_date DATE,
    score INT,
    view_count INT,
    user_id INT
);

INSERT INTO posts (id, title, post_tag_id, creation_date, score, view_count, user_id)
VALUES
(2001, 'How to solve SQL JOIN issues?', 1, '2023-01-01', 10, 100, 1002),
(2002, 'Best practices for writing SQL queries', 2, '2023-01-02', 15, 150, 1004),
(2003, 'Understanding INNER JOIN in SQL', 1, '2023-01-03', 20, 200, 1010),
(2004, 'What is a LEFT JOIN?', 1, '2023-01-04', 25, 250, 1005),
(2005, 'Database indexing techniques', 3, '2023-01-05', 30, 300, 1002),
(2006, 'Explaining SQL subqueries', 4, '2023-01-06', 35, 350, 1003),
(2007, 'How to optimize SQL queries?', 2, '2023-01-07', 40, 400, 1008),
(2008, 'Database normalization concepts', 6, '2023-01-08', 45, 450, 1006),
(2009, 'SQL Aggregate Functions explained', 5, '2023-01-09', 50, 500, 1010),
(2010, 'Introduction to SQL Window Functions', 7, '2023-01-10', 55, 550, 1009);



-- select all the tables 

SELECT * FROM badges;
SELECT * FROM comments;
SELECT * FROM post_history;
SELECT * FROM post_links;
SELECT * FROM posts;
SELECT * FROM tags;
SELECT * FROM users;
SELECT * FROM votes;

-----------------Part 1: Basics --------------------------
--------------Explore the structure and first 5 rows of each table. -----------------;

SELECT * FROM badges limit 5;
SELECT * FROM comments limit 5;
SELECT * FROM post_history limit 5;
SELECT * FROM post_links limit 5;
SELECT * FROM posts limit 5;
SELECT * FROM tags limit 5;
SELECT * FROM users limit 5;
SELECT * FROM votes limit 5;

--- Identify the total number of records in each table.;

select count(*) from badges;
select count(*) from comments;
select count(*) from post_history;
select count(*) from post_links;
select count(*) from posts;
select count(*) from tags;
select count(*) from users;
select count(*) from votes;

----- Find all posts with a view_count greater than 100 --------------;
select * from posts;
select * 
from posts
where view_count > 100;

------------- Display comments made in 2005, sorted by date of creation -------------------
select * from comments;

select *
from comments
where year(creation_date) = 2005
order by creation_date;

----------------------- ○ Count the total number of votes for each post_id. ---------------
select * from votes;

select post_id, count(*) as votes_post_id
from votes
group by post_id;

---------------------  ○ Calculate the count and average score of posts per post_tag_id.  -------------

select * from posts;

select post_tag_id, count(*) as post_count, avg(score) as score_avg
from posts
group by post_tag_id;


Part 2: Advanced (6 marks each) 

----------- Combine the post_history and posts tables 
            to display the title of posts and the corresponding changes made in the post history.  -------;
            
select * from post_history;
select * from posts;   

select posts.title, post_history.text as changes, post_history.creation_date
from post_history
join posts on post_history.post_id = posts.id;

-------- ○ Show user details and the total badges earned by each user. -------------
select * from users;
select * from badges;

select users.id, users.display_name, users.reputation, count(badges.user_id) as badges_earned
from users
join badges on users.id = badges.user_id
group by users.id, users.display_name, users.reputation;

----------- ○ Fetch the titles of posts, their comments, and the users who made those comments. -----------------------
select * from posts;
select * from comments;
select * from users;

select posts.title, comments.text as comments, users.id, users.display_name
from comments
join users on users.id =comments.user_id
join posts on comments.post_id =posts.id;

------------------ ○ Combine post_links with posts to list related questions. ---------------------------
select * from post_links;
select * from posts;

select posts.title as original_question, posts2.title as related_question
from post_links
join posts on posts.id = post_links.post_id
join posts as posts2 on posts2.id = post_links.related_post_id;


------------------ ○ Find the users who have earned badges and also made comments. ----------
select * from users;
select * from badges;
select * from comments;

select distinct users.id, users.display_name
from users
join badges on users.id = badges.user_id
join comments on users.id = comments.user_id;

----------- ○ Find all users with the highest reputation. ----------------------
select * from users;

select *
from users
where reputation = (select max(reputation) 
			         from users);
-------  Retrieve posts with the highest score in each post_tag_id  -----------------
select * from posts;

select title, post_tag_id, score
from posts
where (post_tag_id, score) in (select post_tag_id, max(score)
							 from posts
                             group by post_tag_id);
                             
-------  ○ For each post, fetch the number of related posts from post_links. -------------
select * from posts;
select * from post_links;                             

select posts.title, count(post_links.related_post_id) as number_related_posts
from post_links
join posts on post_links.post_id = posts.id
group by posts.title;                                

----------  ○ Rank posts based on their score within each post_tag_id. ----------------------
select * from posts;

select id, title, post_tag_id, score, 
rank () over (partition by(post_tag_id) order by score desc) as score_ranking
from posts; 

-------- ○ Calculate the running total of badges earned by users in chronological order. ----------
select * from badges;

select user_id, name, date, count(*) over (order by date) as running_total
from badges;

-------- ○ Find out the date for each user on which their total badges went over 1. -----------------
select * from badges;
        
with running_badges as (select user_id, name, date, 
                        count(*) over (partition by user_id order by date) as running_total
								from badges)
select user_id, min(date) as total_badges_over_1
from running_badges
where running_total > 1
group by user_id;          


-----------  ○ Create a CTE to calculate the average score of posts by each user and use it to: -----------
-----------  Show user_ids, display_name, reputation and avg_score for users with an average score above 40. ---------
select * from posts;
select * from users;


with scores_avg as (select user_id, avg(score) as avg_score
                    from posts 
                    group by user_id)
select users.id, users.display_name, users.reputation, scores_avg.avg_score
from users
join scores_avg on scores_avg.user_id = users.id
where scores_avg.avg_score > 40;

----- Rank users based on their average post score. Show user_ids, 
display_name, reputation, avg_score and rank. ----------------------

with scores_avg as (select user_id, avg(score) as avg_score
                    from posts 
                    group by user_id)
select users.id, users.display_name, users.reputation, scores_avg.avg_score, 
       rank () over (order by scores_avg.avg_score desc) as rank_by_avg
from users
join scores_avg on users.id = scores_avg.user_id;       

------------  New Insights and Questions ------------------

---- 1. Which users have made the most posts?------------
select * from posts;
select * from users;

select users.display_name, COUNT(posts.id) as total_posts
from posts
join users on posts.user_id = users.id
group by users.display_name
order by total_posts desc;

------   2. Which users made a post with score greater than 80? -------
select distinct users.display_name, posts.score
from posts
join users on posts.user_id = users.id
where posts.score > 30;

---------- 3 Who earned the most badges? ---------
select * from badges;
select * from users;    

select users.display_name, count(badges.id) as badge_count 
from badges
join users on badges.user_id = users.id
group by users.display_name
order by badge_count desc;

---- 4. What badge names were earned in 2024?----------------  

select distinct name, date
from badges
where year(date) = 2024;

------  5. Which users have made at least 1 comment? -----------

select distinct users.display_name
from users
join comments on users.id = comments.user_id;


------ 6. Which tags have the highest average post score? ------

select post_tag_id, avg(score) as avg_score
from posts
group by post_tag_id
order by avg_score desc;


------- 7. Which user got the highest average post score? -----------

with avg_scores as (select user_id, avg(score) avg_score 
                    from posts 
                    group by user_id)
select users.display_name, avg_scores.avg_score
from avg_scores
join users on users.id = avg_scores.user_id
order by avg_score desc
limit 1;                    


--------  8. What is the most common tag used in posts? --------------
select post_tag_id, count(*) as tag_count
from posts
group by post_tag_id
order by tag_count desc
limit 1;












               