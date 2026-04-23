CREATE DATABASE cricket_db;
USE cricket_db;
CREATE TABLE ipl_players (
    player_id INT PRIMARY KEY,
    player_name VARCHAR(100),
    team VARCHAR(50),
    role VARCHAR(50),
    runs INT,
    wickets INT,
    salary INT
);
INSERT INTO ipl_players VALUES
(1,'Virat Kohli','RCB','Batsman',639,0,15000000),
(2,'Rohit Sharma','MI','Batsman',450,0,16000000),
(3,'MS Dhoni','CSK','Wicketkeeper',350,0,12000000),
(4,'KL Rahul','LSG','Batsman',520,0,17000000),
(5,'Shikhar Dhawan','PBKS','Batsman',480,0,14000000),
(6,'Hardik Pandya','GT','All-rounder',400,10,15000000),
(7,'Ravindra Jadeja','CSK','All-rounder',300,15,16000000),
(8,'Andre Russell','KKR','All-rounder',350,18,14000000),
(9,'Jasprit Bumrah','MI','Bowler',50,22,12000000),
(10,'Mohammed Shami','GT','Bowler',40,25,11000000),

(11,'David Warner','DC','Batsman',600,0,13000000),
(12,'Steve Smith','RR','Batsman',350,0,12000000),
(13,'Ben Stokes','CSK','All-rounder',250,12,16000000),
(14,'Glenn Maxwell','RCB','All-rounder',420,8,14000000),
(15,'AB de Villiers','RCB','Batsman',500,0,15000000),
(16,'Kane Williamson','SRH','Batsman',400,0,14000000),
(17,'Trent Boult','RR','Bowler',30,20,11000000),
(18,'Yuzvendra Chahal','RR','Bowler',20,24,10000000),
(19,'Rashid Khan','GT','Bowler',200,26,15000000),
(20,'Quinton de Kock','LSG','Wicketkeeper',480,0,12000000),

(21,'Ishan Kishan','MI','Wicketkeeper',420,0,15000000),
(22,'Suryakumar Yadav','MI','Batsman',610,0,14000000),
(23,'Shubman Gill','GT','Batsman',700,0,16000000),
(24,'Ruturaj Gaikwad','CSK','Batsman',550,0,13000000),
(25,'Devdutt Padikkal','RR','Batsman',400,0,12000000),
(26,'Sanju Samson','RR','Wicketkeeper',500,0,14000000),
(27,'Axar Patel','DC','All-rounder',300,12,11000000),
(28,'Kuldeep Yadav','DC','Bowler',30,21,10000000),
(29,'Bhuvneshwar Kumar','SRH','Bowler',40,18,12000000),
(30,'Deepak Chahar','CSK','Bowler',20,15,10000000),

(31,'Nicholas Pooran','LSG','Wicketkeeper',450,0,12000000),
(32,'Marcus Stoinis','LSG','All-rounder',350,10,13000000),
(33,'Jason Holder','RR','All-rounder',200,14,11000000),
(34,'Mitchell Marsh','DC','All-rounder',300,8,12000000),
(35,'Faf du Plessis','RCB','Batsman',600,0,14000000),
(36,'Jos Buttler','RR','Wicketkeeper',650,0,16000000),
(37,'Prithvi Shaw','DC','Batsman',400,0,11000000),
(38,'Mayank Agarwal','PBKS','Batsman',420,0,12000000),
(39,'Arshdeep Singh','PBKS','Bowler',10,19,10000000),
(40,'Kagiso Rabada','PBKS','Bowler',30,23,13000000),

(41,'Tim David','MI','Batsman',300,0,9000000),
(42,'Rahul Tripathi','SRH','Batsman',450,0,11000000),
(43,'Washington Sundar','SRH','All-rounder',200,10,10000000),
(44,'T Natarajan','SRH','Bowler',15,18,10000000),
(45,'Umesh Yadav','KKR','Bowler',20,17,9000000),
(46,'Varun Chakravarthy','KKR','Bowler',10,21,11000000),
(47,'Shreyas Iyer','KKR','Batsman',500,0,14000000),
(48,'Nitish Rana','KKR','Batsman',420,0,12000000),
(49,'Rinku Singh','KKR','Batsman',380,0,9000000),
(50,'Harshal Patel','RCB','Bowler',20,22,11000000);

-- 1) Highest Run Scorer
SELECT PLAYER_NAME, RUNS
FROM IPL_PLAYERS
WHERE RUNS =(SELECT MAX(RUNS) FROM IPL_PLAYERS);

-- 2) Lowest Salary Player
SELECT PLAYER_NAME, SALARY
FROM IPL_PLAYERS
WHERE SALARY = (SELECT MIN(SALARY) FROM IPL_PLAYERS);

-- 3) Players with Above Average Runs
SELECT PLAYER_NAME,RUNS
FROM IPL_PLAYERS
WHERE RUNS> (SELECT AVG(RUNS) FROM IPL_PLAYERS);

-- 4) Players in Same Team as MS DHONI
SELECT PLAYER_NAME,TEAM
FROM IPL_PLAYERS
WHERE TEAM = (
	SELECT TEAM
    FROM IPL_PLAYERS
    WHERE PLAYER_NAME = 'MS DHONI'
);

-- 5) Bowlers with Max Wickets
SELECT player_name, wickets
FROM ipl_players
WHERE role = 'Bowler'
AND wickets = (
    SELECT MAX(wickets)
    FROM ipl_players
    WHERE role = 'Bowler'
);

-- 6) Players Earning More Than Average Salary
SELECT PLAYER_NAME, SALARY
FROM IPL_PLAYERS
WHERE SALARY > (SELECT AVG(SALARY) FROM PLAYERS);

-- 7) Players from Teams Having All-rounders
SELECT PLAYER_NAME,TEAM
FROM IPL_PLAYERS
WHERE TEAM IN(
	SELECT TEAM
	FROM IPL_PLAYERS
    WHERE ROLE='ALL-ROUNDER'
);

-- 8) Players with Same Role as MS Dhoni
SELECT PLAYER_NAME,ROLE
FROM IPL_PLAYERS
WHERE ROLE =(
	SELECT ROLE
    FROM IPL_PLAYERS
    WHERE PLAYER_NAME='MS DHONI'
)
AND PLAYER_NAME <> 'MS DHONI'
;

-- 9) Second Highest Runs
SELECT PLAYER_NAME, SALARY
FROM IPL_PLAYERS
ORDER BY SALARY DESC
LIMIT 1,1;

-- 10) Players with Runs Greater Than Any Bowler
SELECT PLAYER_NAME, RUNS
FROM IPL_PLAYERS
WHERE RUNS > ANY =(
	SELECT RUNS
    FROM IPL_PLAYERS
    WHERE ROLE = 'BOWLER'
);

-- 11) Players with Runs Less Than Average
SELECT PLAYER_NAME, RUNS
FROM IPL_PLAYERS
WHERE RUNS < ( SELECT AVG(RUNS) FROM IPL_PLAYERS);

-- 12) Players with Salary Equal to Highest Salary
SELECT PLAYER_NAME, SALARY
FROM PLAYERS
WHERE SALARY = (SELECT MAX(SALARY) FROM IPL_PLAYERS);

-- 13) Players from Same Team as Highest Run Scorer
SELECT PLAYER_NAME, TEAM
FROM IPL_PLAYERS
WHERE TEAM = (
    SELECT TEAM
    FROM IPL_PLAYERS
    WHERE RUNS = (SELECT MAX(RUNS) FROM PLAYERS)
);

-- 14) Players with Wickets Greater Than Average Wickets
SELECT PLAYER_NAME, WICKETS
FROM IPL_PLAYERS
WHERE WICKETS > (SELECT AVG(WICKETS) FROM IPL_PLAYERS
);

-- 15) Teams Having More Than 3 Players
SELECT TEAM
FROM IPL_PLAYERS
GROUP BY TEAM
HAVING COUNT(*) >3;

-- 16) Players Belonging to Teams with More Than 3 Players
SELECT PLAYER_NAME, TEAM
FROM IPL_PLAYERS
WHERE TEAM IN(
	SELECT TEAM
    FROM IPL_PLAYERS
    GROUP BY TEAM
    HAVING COUNT(*) > 3
);

-- 17) Players with Salary Greater Than Any Batsman
SELECT PLAYER_NAME, SALARY
FROM IPL_PLAYERS
WHERE SALARY > ANY(
	SELECT SALARY
    FROM IPL_PLAYERS
    WHERE ROLE = 'BATSMAN'
);

-- 18) Players with Salary Greater Than All Bowlers
SELECT PLAYER_NAME, SALARY
FROM IPL_PLAYERS
WHERE SALARY > ANY(
	SELECT SALARY
    FROM IPL_PLAYERS
    WHERE ROLE = 'BOWLERS'
);

-- 19) Players Who Are Not Bowlers (Using Subquery)
SELECT PLAYER_NAME, ROLE
FROM PLAYERS
WHERE PLAYER_ID NOT IN(
	SELECT PLAYER_ID
    FROM PLAYERS
    WHERE ROLE = 'BOWLER'
);

-- 20) Players Having Same Salary as Someone Else
SELECT PLAYER_NAME, SALARY
FROM IPL_PLAYERS
WHERE SALARY IN(
	SELECT SALARY
    FROM IPL_PLAYERS
    GROUP BY SALARY
    HAVING COUNT(*) >1
);

