# LeetCode SQL Problem Solving Questions With Solutions

*Enterprise-style compiled reference of classic LeetCode SQL problems with schemas, examples, and solutions.*


> **Note on source formatting:** The source PDF is a rasterized (image-based) document with no embedded text layer. This file was reconstructed via OCR. Prose and SQL solutions are highly reliable; table/example blocks (rendered as small monospace screenshots in the original) may contain minor OCR artifacts in borders — the underlying column names, types, and values have been kept as extracted.


---

## Table of Contents

- [175. Combine Two Tables (Easy)](#175-combine-two-tables)
- [176. Second Highest Salary (Easy)](#176-second-highest-salary)
- [177. Nth Highest Salary (Medium)](#177-nth-highest-salary)
- [178. Rank Scores (Medium)](#178-rank-scores)
- [180. Consecutive Numbers (Medium)](#180-consecutive-numbers)
- [181. Employees Earning More Than Their Managers (Easy)](#181-employees-earning-more-than-their-managers)
- [182. Duplicate Emails (Easy)](#182-duplicate-emails)
- [183. Customers Who Never Order (Easy)](#183-customers-who-never-order)
- [184. Department Highest Salary (Medium)](#184-department-highest-salary)
- [185. Department Top Three Salaries (Hard)](#185-department-top-three-salaries)
- [196. Delete Duplicate Emails (Easy)](#196-delete-duplicate-emails)
- [197. Rising Temperature (Easy)](#197-rising-temperature)
- [262. Trips and Users (Hard)](#262-trips-and-users)
- [511. Game Play Analysis I (Easy)](#511-game-play-analysis-i)
- [512. Game Play Analysis II (Easy)](#512-game-play-analysis-ii)
- [534. Game Play Analysis III (Medium)](#534-game-play-analysis-iii)
- [550. Game Play Analysis IV (Medium)](#550-game-play-analysis-iv)
- [569. Median Employee Salary (Hard)](#569-median-employee-salary)
- [570. Managers with at Least 5 Direct Reports (Medium)](#570-managers-with-at-least-5-direct-reports)
- [571. Find Median Given Frequency of Numbers (Hard)](#571-find-median-given-frequency-of-numbers)
- [574. Winning Candidate (Medium)](#574-winning-candidate)
- [577. Employee Bonus (Easy)](#577-employee-bonus)
- [578. Get Highest Answer Rate Question (Medium)](#578-get-highest-answer-rate-question)
- [579. Find Cumulative Salary of an Employee (Hard)](#579-find-cumulative-salary-of-an-employee)
- [580. Count Student Number in Departments (Medium)](#580-count-student-number-in-departments)
- [584. Find Customer Referee (Easy)](#584-find-customer-referee)
- [585. Investments in 2016 (Medium)](#585-investments-in-2016)
- [586. Customer Placing the Largest Number of Orders (Easy)](#586-customer-placing-the-largest-number-of-orders)
- [595. Big Countries (Easy)](#595-big-countries)
- [596. Classes More Than 5 Students (Easy)](#596-classes-more-than-5-students)
- [597. Friend Requests I: Overall Acceptance Rate (Easy)](#597-friend-requests-i-overall-acceptance-rate)
- [601. Human Traffic of Stadium (Hard)](#601-human-traffic-of-stadium)
- [602. Friend Requests II: Who Has the Most Friends (Medium)](#602-friend-requests-ii-who-has-the-most-friends)
- [603. Consecutive Available Seats (Easy)](#603-consecutive-available-seats)
- [607. Sales Person (Easy)](#607-sales-person)
- [608. Tree Node (Medium)](#608-tree-node)
- [610. Triangle Judgement (Easy)](#610-triangle-judgement)
- [612. Shortest Distance in a Plane (Medium)](#612-shortest-distance-in-a-plane)
- [613. Shortest Distance in a Line (Easy)](#613-shortest-distance-in-a-line)
- [614. Second Degree Follower (Medium)](#614-second-degree-follower)
- [615. Average Salary: Departments VS Company (Hard)](#615-average-salary-departments-vs-company)
- [618. Students Report By Geography (Hard)](#618-students-report-by-geography)
- [619. Biggest Single Number (Easy)](#619-biggest-single-number)
- [620. Not Boring Movies (Easy)](#620-not-boring-movies)
- [626. Exchange Seats (Medium)](#626-exchange-seats)
- [627. Swap Salary (Easy)](#627-swap-salary)
- [1045. Customers Who Bought All Products (Medium)](#1045-customers-who-bought-all-products)
- [1050. Actors and Directors Who Cooperated At Least Three Times (Easy)](#1050-actors-and-directors-who-cooperated-at-least-three-times)
- [1068. Product Sales Analysis I (Easy)](#1068-product-sales-analysis-i)
- [1069. Product Sales Analysis II (Easy)](#1069-product-sales-analysis-ii)
- [1070. Product Sales Analysis III (Medium)](#1070-product-sales-analysis-iii)
- [1075. Project Employees I (Easy)](#1075-project-employees-i)
- [1076. Project Employees II (Easy)](#1076-project-employees-ii)
- [1077. Project Employees III (Medium)](#1077-project-employees-iii)
- [1082. Sales Analysis I (Easy)](#1082-sales-analysis-i)
- [1083. Sales Analysis II (Easy)](#1083-sales-analysis-ii)
- [1084. Sales Analysis III (Easy)](#1084-sales-analysis-iii)
- [1097. Game Play Analysis V (Hard)](#1097-game-play-analysis-v)
- [1098. Unpopular Books (Medium)](#1098-unpopular-books)
- [1107. New Users Daily Count (Medium)](#1107-new-users-daily-count)
- [1112. Highest Grade For Each Student (Medium)](#1112-highest-grade-for-each-student)
- [1113. Reported Posts (Easy)](#1113-reported-posts)
- [1126. Active Businesses (Medium)](#1126-active-businesses)
- [1127. User Purchase Platform (Hard)](#1127-user-purchase-platform)
- [1132. Reported Posts II (Medium)](#1132-reported-posts-ii)
- [1141. User Activity for the Past 30 Days I (Easy)](#1141-user-activity-for-the-past-30-days-i)
- [1142. User Activity for the Past 30 Days II (Easy)](#1142-user-activity-for-the-past-30-days-ii)
- [1148. Article Views I (Easy)](#1148-article-views-i)
- [1149. Article Views II (Medium)](#1149-article-views-ii)
- [1158. Market Analysis I (Medium)](#1158-market-analysis-i)
- [1159. Market Analysis II (Hard)](#1159-market-analysis-ii)
- [1164. Product Price at a Given Date (Medium)](#1164-product-price-at-a-given-date)
- [1173. Immediate Food Delivery I (Easy)](#1173-immediate-food-delivery-i)

---

## 175. Combine Two Tables — Easy

Table: Person
Lae | TR |
T personté | ine |
| FirstName | varchar |
| LastName   | varchar |
re column for this table.
Table: Address

```text
henner ete nnn nt
| Column Name | Type   |
aa ttn oS
| AddressId | int    |
| PersonId   | int    |
| city     | varchar |
| State     | varchar |
:  aiiieteneiniaiainier: ceaeninninimmiar 2
```

AddressId is the primary key column for this table.
Write a SQL query for a report that provides the following information for each
person in the Person table, regardless if there is an address for each of those
people:

```text
FirstName, LastName, City, State
```

**Solution**

```sql
SELECT p.FirstName, p.LastName, a.City, a.State
FROM Person p
LEFT JOIN Address a
ON p.PersonId = a.PersonId;
```


---

## 176. Second Highest Salary — Easy

Write a SQL query to get the second highest salary from the Employee table.

```text
S etleiah telat
| Id | Salary |
here eter ccc nt
| 1 | 100   |
| 2 | 200   |
| 3 | 300   |
tonne tenner ent
```

For example, given the above Employee table, the query should return 200 as the
second highest salary. If there is no second highest salary, then the query should
return null.

```text
lela D
| SecondHighestSalary |
tener eer errr ere c eee nnt
| 200            |
lela atatatat f
```

**Solution**

```sql
SELECT Max(Salary) SecondHighestSalary
FROM Employee WHERE Salary < (SELECT MAX(Salary) FROM Employee)
WITH CTE AS (SELECT DISTINCT Salary
FROM Employee
ORDER BY Salary DESC
LIMIT 2)
SELECT Salary as SecondHighestSalary
FROM CTE
ORDER BY Salary Asc
LIMIT 1;
WITH CTE AS
(
SELECT Salary,
DENSE_RANK() OVER (ORDER BY Salary DESC) AS DENSERANK
FROM Employee
)
SELECT Salary SecondHighestSalary
FROM CTE
WHERE DENSERANK = 23
```


---

## 177. Nth Highest Salary — Medium

Write a SQL query to get the nth highest salary from the Employee table.

```text
S alaiateh deteteiatetaietanal
| Id | Salary |
hence cnn nit
| 1 | 100     |
| 2 | 200     |
| 3 | 300     |
herr eter ccc
```

For example, given the above Employee table, the nth highest salary where n = 2 is
200. If there is no nth highest salary, then the query should return null.

```text
aaa aan 2
| getNthHighestSalary(2) |
tone enn nee Ht
teeter 2
```

**Solution**

```sql
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
SET N = N-1;
RETURN(
SELECT DISTINCT Salary FROM Employee ORDER BY Salary DESC
LIMIT 1 OFFSET N
);
END
```


---

## 178. Rank Scores — Medium

Write a SQL query to rank scores. If there is a tie between two scores, both should
have the same ranking. Note that after a tie, the next ranking number should be the
next consecutive integer value. In other words, there should be no “holes” between
ranks.

```text
Sila telat 2
| Id | Score |
thescedeeseseet
[1 | 3.50 |
{2 | 3.65 |
| 3 | 4.00 |
[4 | 3.85 |
[5 | 4.00 |
| 6 | 3.65 |
Olea teeta 2
```

For example, given the above Scores table, your query should generate the
following report (order by highest score):

```text
Olea teletatetatetatat a
| score | Rank   |
hore c ccc tec ccc rn t
| 4.00 | 1     |
| 4.00 [1     |
| 3.85 | 2     |
| 3.65 | 3     |
| 3.65 | 3     |
| 3.58 [4     |
Clete teleiatetetatetetah
```

Important Note: For MySQL solutions, to escape reserved words used as column
names, you can use an apostrophe before and after the keyword. For example Rank .

**Solution**

```sql
SELECT score, DENSE_RANK() OVER (ORDER By Score DESC) AS "Rank"
FROM Scores;
```


---

## 180. Consecutive Numbers — Medium

Table: Logs

```text
hoc nr ete cnr nnn t
| Column Name | Type   |
ate eet of
| id       | int   |
| num      | varchar |
Sn ieee 2
id is the primary key for this table.
```

Write an SQL query to find all numbers that appear at least three times
consecutively.
Return the result table in any order.
The query result format is in the following example:

```text
Logs table:
bocce tenn
| Id | Num |
tence tec cnt
la [a |
13 Ja |
Is |a |
le [2 |
17 |2 |
Hececteecent
Result table:
Dita leiateiatatetateiatatatatetatan a
| ConsecutiveNums |
dincosooenereces
D eteieiesteiaiateietaiatetetaieteten a
1 is the only number that appears consecutively for at least three times
```

**Solution**

```sql
SELECT a.Num as ConsecutiveNums
FROM Logs a
JOIN Logs b
ON a.id = b.id+1 AND a.num = b.num
JOIN Logs c
ON a.id = c.id+2 AND a.num = c.num;
```


---

## 181. Employees Earning More Than Their Managers — Easy

LeetCode
The Employee table holds all employees including their managers. Every employee
has an Id, and there is also a column for the manager Id.

```text
hon nba n nenn pon ne penn tt
| Id | Name | Salary | ManagerId |
spe en hetero semin ase ar ee:
| 1 | Joe | 7eeee | 3   |
| 2 | Henry | see | 4      |
| 3 | Sam | 60@@e@ | NULL    |
| 4 | Max | 90000 | NULL    |
```

Slit tale tela tala leita alata
Given the Employee table, write a SQL query that finds out employees who earn
more than their managers. For the above table, Joe is the only employee who earns
more than his manager.

```text
S eteteiatetetatateteh a
| Employee |
bocce ccc rt
| Joe    |
Hosceseessey
```

**Solution**

```sql
SELECT E.Name as "Employee"
FROM Employee E
JOIN Employee M
ON E.ManagerId = M.Id
AND E.Salary > M.Salary;
```


---

## 182. Duplicate Emails — Easy

Write a SQL query to find all duplicate emails in a table named Person.

```text
i Seiten F
| Id | Email |
ie totter
| 1. | a@b.com |
| 2. | c@d.com |
| 3. | a@b.com |
Sh ttn
```

For example, your query should return the following for the above table:

```text
| ting
| Email  |
Stier a
| a@b.com |
Heese ccc ent
```

Note: All emails are in lowercase.

**Solution**

```sql
SELECT Email
FROM Person
GROUP BY Email
HAVING count(*) > 1
WITH CTE AS(
SELECT Email, ROW_NUMBER() OVER(PARTITION BY Email ORDER BY Email) AS RN
FROM Person
)
SELECT Email
FROM CTE
WHERE RN > 1;
```


---

## 183. Customers Who Never Order — Easy

Suppose that a website contains two tables, the customers table and the orders
table. Write a SQL query to find all customers who never order anything.
Table: Customers .

```text
Henenteecer nant
| Id | Name |
en
[1 | Joe |
| 2 | Henry |
| 3 | Sam |
| 4 | Max |
ann tenn net
Table: orders.
```

```text
Sn ee
| Id | CustomerId |
aaah detiettatetetieetiat 2
Se
```

Using the above tables as example, return the following:

```text
Siete eta 2
| Customers |
Slit 2
| Henry       |
| Max         |
f liettetateetatan 2
```

**Solution**

```sql
SELECT Name AS Customers
FROM Customers
LEFT JOIN Orders
ON Customers.Id = Orders.CustomerId
WHERE CustomerId IS NULL;
SELECT Name as Customers
FROM Customers
WHERE Id NOT IN(
SELECT CustomerId
FROM Orders
y)
```


---

## 184. Department Highest Salary — Medium

The Employee table holds all employees. Every employee has an ld, a salary, and
there is also a column for the department Id.

Pon repo ce re nfo ne nen pon nce eee enn
| Id | Name | Salary | DepartmentId |
Oia talent tat Ditto
| 1 | Joe | 7eee@ | 1    |
| 2 | Jim | 90000 | 4    |
| 3 | Henry | seeee | 2        |
| 4 | Sam | 6000e@ | 2    |
|5 | Max | 9e00ee | 1    |
Cit elite ttt Ste
The Department table holds all departments of the company.

```text
Sea teeta oF
| Id | Name   |
Hen cntec ccc rent
[a | aT     |
| 2. | Sales   |
pose epeee eee
```

Write a SQL query to find employees who have the highest salary in each of the
departments. For the above tables, your SQL query should return the following rows
(order of rows does not matter).

```text
, at 2. ees
| Department | Employee | Salary |
sca ataiatadeineiaiaiaias daiateiaanelanenaien saieiaiaiantanai 2
| IT      | Max    | 9ee0e |
| IT      | Jim    | 9ee0e0 |
| Sales    | Henry   | see0eo |
horn rn pe nn nnn perenne t
Explanation:
```

Max and Jim both have the highest salary in the IT department and Henry has the
highest salary in the Sales department.

**Solution**

```sql
SELECT Department.Name AS Department, Employee.Name AS Employee, Salary
FROM Employee
JOIN Department
ON Employee.DepartmentId = Department.Id
WHERE (DepartmentId, Salary) IN(
SELECT DepartmentId, MAX(Salary) AS Salary
FROM Employee
GROUP BY DepartmentId
)3
```


---

## 185. Department Top Three Salaries — Hard

The Employee table holds all employees. Every employee has an Id, and there is also
a column for the department Id.

```text
teceshesnemebnemere nema mean
| Id | Name | Salary | DepartmentId |
4----4-------4--------4--------------+
| 1 | Joe | 85000 | 1    |
| 2 | Henry | 8eee0 | 2        |
| 3 | Sam | 6ee0ee | 2    |
| 4 | Max | 90000 | 1    |
| 5 | Janet | 69000 | 1        |
| 6 | Randy | 85000 | 1        |
| 7 | Will | 7eeee | 1      |
i en ee See
```

The Department table holds all departments of the company.

```text
Ct ee
| Id | Name   |
et es
[1 | IT     |
| 2 | Sales   |
Ct re
```

Write a SQL query to find employees who earn the top three salaries in each of the
department. For the above tables, your SQL query should return the following rows
(order of rows does not matter).

```text
| Department | Employee | Salary |
Sn es
| IT      | Max    | 90000 |
| IT      | Randy   | s5eee |
| IT      | Joe    | 85000 |
| IT      | will   | 7eeee |
| Sales    | Henry   | see0e0 |
| Sales    | Sam    | 6ee0e0 |
Steen tee iio
Explanation:
```

In IT department, Max earns the highest salary, both Randy and Joe earn the
second highest salary, and Will earns the third highest salary. There are only two
employees in the Sales department, Henry earns the highest salary while Sam earns
the second highest salary.

**Solution**

```sql
WITH department_ranking AS (
SELECT Name AS Employee, Salary ,DepartmentId
,DENSE_RANK() OVER (PARTITION BY DepartmentId ORDER BY Salary DESC) AS rnk
FROM Employee
)
SELECT d.Name AS Department, r.Employee, r.Salary
FROM department_ranking AS r
JOIN Department AS d
ON r.DepartmentId = d.Id
WHERE r.rnk <= 3
ORDER BY d.Name ASC, r.Salary DESC;
```


---

## 196. Delete Duplicate Emails — Easy

Write a SQL query to delete all duplicate email entries in a table named Person,
keeping only unique emails based on its smallest Id.

```text
| eo
| Id | Email        |
0 el teeta e 2
| 1. | john@example.com |
| 2 | bob@example.com |
| 3. | john@example.com
```

Ponce c ncn nee nen n nit
Id is the primary key column for this table. For example, after running your query, the
above Person table should have the following rows:

```text
hone cnc crn nnn nt
| Id | Email        |
Ste ela aaa gd
| 1. | john@example.com |
| 2. | bob@example.com |
tesesheonsmine scorers
Note:
```

Your output is the whole Person table after executing your sql. Use delete
statement.

**Solution**

```sql
DELETE p2
FROM Person pi
JOIN Person p2
ON p1.Email = p2.Email
AND p1.id < p2.id
```


---

## 197. Rising Temperature — Easy

Table: Weather

```text
D eiaietaiaiataiaiaiataieteiaie tetetateteteetetena
| Column Name | Type   |
thes cne neces cere ctane reeset
| id        | ant    |
| recordDate   | date   |
| temperature | int    |
Se ee
id is the primary key for this table.
```

This table contains information about the temperature in a certain day.
Write an SQL query to find all dates’ id with higher temperature compared to its
previous dates (yesterday).
Return the result table in any order.
The query result format is in the following example:

```text
Weather
ee ee
| id | recordDate | Temperature |
Ce eee
| 1 | 2015-@1-01 | 10      |
| 2 | 2015-e1-02 | 25      |
| 3 | 2015-91-03 | 20      |
| 4 | 2015-e1-04 | 30      |
$----4---- 2-7 --- $22 +
Result table:
+--+
12 |
14 |
```

In 2015-01-62, temperature was higher than the previous day (1@ -> 25).
In 2015-01-04, temperature was higher than the previous day (20 -> 3@).

**Solution**

```sql
SELECT t.Id
FROM Weather AS t, Weather AS y
WHERE DATEDIFF(t.RecordDate, y.RecordDate) = 1
AND t.Temperature > y.Temperature;
SELECT t.Id
FROM Weather t
JOIN Weather y
ON DATEDIFF(t.recordDate, y.recordDate) = 1 AND
t.temperature > y.temperature;
```


---

## 262. Trips and Users — Hard

Table: Trips

```text
en es
| Column Name | Type    |
en ees
| Id       | ant    |
| Client_Id | int    |
| Driver_Id | int    |
| city_Id     | ant
| Status    | enum    |
| Request_at | date   |
es
```

Id is the primary key for this table.
The table holds all taxi trips. Each trip has a unique Id, while Client_Id and Dr
Status is an ENUM type of (‘completed’, ‘cancelled_by_driver’, ‘cancelled_by_clie
OO
Table: users

```text
thecccrcccr cre stessnesrccest
| Column Name | Type    |
fo -- 2-2-2 - $e - 2-5-2 - H+
| Users_Id   | int    |
| Banned    | enum    |
| Role     | enum    |
posese bese sesnpesse ness ay
```

Users_Id is the primary key for this table.
The table holds all users. Each user has a unique Users_Id, and Role is an ENUM t
Status is an ENUM type of (‘Yes’, ‘No’).
|
Write a SQL query to find the cancellation rate of requests with unbanned users
(both client and driver must not be banned) each day between "2013-10-01" and
"2013-10-03" .
The cancellation rate is computed by dividing the number of canceled (by client or
driver) requests with unbanned users by the total number of requests with
unbanned users on that day.
Return the result table in any order. Round Cancellation Rate to two decimal points.
The query result format is in the following example:

```text
Trips table:
Ce ee ooo
| Id | Client_Id | Driver_Id | City_Id | Status         | Request_at |
foo nto -- oo $2 $e oo po oo ee eo oo et ee ee et
Ja of42      | 10     ie     | completed       | 2013-10-01 |
| 2 |2      | 11     [1     | cancelled_by_driver | 2013-10-01 |
[3 |3      | 12     [6     | completed       | 2013-10-01 |
|4 | 4      | 13     | 6     | cancelled_by_client | 2013-10-01 |
}5 |1      | 10     [12     | completed       | 2013-10-02 |
|e | 2      | 11     | 6     | completed       | 2013-10-e2 |
|7 | 3      | 12     | 6     | completed       | 2013-10-@2 |
| 3 | 2      | 12     | 12    | completed       | 2013-10-@3 |
|9 | 3      | 10     | 12    | completed       | 2013-10-@3 |
| 10 | 4      | 13     | 12    | cancelled_by_driver | 2013-10-23 |
Ce os
Users table:
fo - 2-2-2 ---4-------- 4-2-2 ----+
| Users_Id | Banned | Role |
ees
}2     | No   | client |
| 2     | Yes   | client |
| 3     | No   | client |
| 4      | No    | client |
| 10     | No   | driver |
| 14     | No    | driver |
| 12     | No    | driver |
| 13     | No   | driver |
fon o-oo 7-2-2 ------+
Result table:
fo - 2-2-2 -----4-------------------4+
| Day         | Cancellation Rate |
Se ee
| 2013-10-01 | @.33         |
| 2013-10-02 | 9.00         |
| 2013-10-03 | 0.50         |
Sn eo
On 2013-10-01:
- There were 4 requests in total, 2 of which were canceled.
- However, the request with Id=2 was made by a banned client (User_Id=2), so it i
- Hence there are 3 unbanned requests in total, 1 of which was canceled.
- The Cancellation Rate is (1 / 3) = 0.33
On 2013-10-@2:
- There were 3 requests in total, @ of which were canceled.
- The request with Id=6 was made by a banned client, so it is ignored.
- Hence there are 2 unbanned requests in total, @ of which were canceled.
- The Cancellation Rate is (@ / 2) = 0.e0
On 2013-10-03:
- There were 3 requests in total, 1 of which was canceled.
- The request with Id=8 was made by a banned client, so it is ignored.
- Hence there are 2 unbanned request in total, 1 of which were canceled.
- The Cancellation Rate is (1 / 2) = 0.50
a
```

**Solution**

```sql
SELECT Request_at AS Day,
ROUND(SUM(IF(Status<>"completed”, 1, @))/COUNT(Status),2) AS “Cancellation Rate"
FROM Trips
WHERE Request_at BETWEEN "2013-10-@1" AND "2013-10-03"
AND Client_Id NOT IN (SELECT Users_Id FROM Users WHERE Banned = ‘Yes')
AND Driver_Id NOT IN (SELECT Users_Id FROM Users WHERE Banned = ‘Yes')
GROUP BY Request_at;
eee
```


---

## 511. Game Play Analysis I — Easy

Table: Activity

```text
ee es
| Column Name | Type   |
ee es
| player_id   | int    |
| device_id   | int    |
| event_date | date   |
| games_played | int    |
ee ees
(player_id, event_date) is the primary key of this table.
```

This table shows the activity of players of some game.
Each row is a record of a player who logged in and played a number of games (poss
|
Write an SQL query that reports the first login date for each player.
The query result format is in the following example:

```text
Activity table:
Ce ee ee ee
| player_id | device_id | event_date | games_played |
```

Ct ee ee Se ey
J 4      | 2      | 2016-03-01 | 5        |
| 1      | 2      | 2016-@5-02 | 6        |
| 2      | 3      | 2017-e6-25 | 1        |
13      i      | 2@16-@3-e2 | @        |
| 3      | 4      | 2018-07-03 | 5        |
$-----------4$-----------4¢------------ $+ --- 2-2-2 --- +
Result table:
Se re
| player_id | first_login |
eee elie ein
Ja      | 2016-@3-01 |
| 2      | 2017-06-25 |
| 3      | 2016-03-02 |
Seale ae elie een

**Solution**

```sql
SELECT player_id, MIN(event_date) as first_login
FROM Activity
GROUP BY player_id
```


---

## 512. Game Play Analysis II — Easy

Table: Activity

```text
ee ees
| Column Name | Type
en es
| player_id    | int
| device_id    | int
| event_date | date
| games_played | int
Ce es
(player_id, event_date) is the primary key of this table.
```

This table shows the activity of players of some game.
Each row is a record of a player who logged in and played a number of games (poss
a
Write a SQL query that reports the device that is first logged in for each player.
The query result format is in the following example:

```text
Activity table:
Cn ees
| player_id | device_id | event_date | games played |
ee ees
[4         | 2         | 2016-03-01 | 5
| 2      | 2      | 2016-85-02 | 6        |
| 2      | 3      | 2@17-@6-25 | 1        |
| 3      J 2      | 2016-83-02 | @        |
| 3      | 4      | 2018-07-03 | 5        |
$-----------4-----------4------------4--------------4+
Result table:
ees
| player_id | device_id |
ees
[2      13      |
[3      Ja      |
```

Pe seeceese espero ssc ee eey

**Solution**

```sql
SELECT DISTINCT player_id, device_id
FROM Activity
WHERE (player_id, event_date) in (
SELECT player_id, min(event_date)
FROM Activity
GROUP BY player_id)
SELECT a.player_id, b.device_id
FROM
(SELECT player_id, MIN(event_date) AS event_date FROM Activity
GROUP BY player_id) a
JOIN Activity b
ON a.player_id = b.player_id AND a.event_date = b.event_date;
SELECT player_id, device_id
FROM
(SELECT player_id, device_id, event_date,
ROW_NUMBER() OVER (PARTITION BY player_id ORDER BY event_date) AS r
FROM Activity) lookup
WHERE r = 1;
```


---

## 534. Game Play Analysis III — Medium

Table: Activity

```text
ees
| Column Name | Type   |
ee anes
| player_id   | int    |
| device_id   | int    |
| event_date | date   |
| games_played | int   |
: | aia aieaheaaiaieaecniiasiacen ‘mcecatmanmaiaas |
(player_id, event_date) is the primary key of this table.
```

This table shows the activity of players of some game.
Each row is a record of a player who logged in and played a number of games (poss
OO
Write an SQL query that reports for each player and date, how many games played
so far by the player. That is, the total number of games played by the player until
that date. Check the example for clarity.
The query result format is in the following example:

```text
Activity table:
$a - 22-25 --$ 2-2-2 2-2-2 $= - 2-2-2 te eo oe et
| player_id | device_id | event_date | games_played |
Ce i ee eg
[2      | 2      | 2016-03-01 | 5        |
Ja      | 2      | 2016-05-02 | 6        |
Ja      | 3      | 2017-06-25 | 1        |
| 3      J 1      | 2016-03-02 | @        |
[3      | 4      | 2018-07-03 | 5        |
s catelesielcatoniaibecaieiar. selena atetaiat inlesataieiatataananane saetaietaiemaietanetatatan
Result table:
Se ee eer
| player_id | event_date | games_played_so_far |
S elealeeatalatata lalate Seletatetet tal atatalatah teleteletel ala atateiatetatetatetatetateian 2
J1      | 2016-e3-01 | 5            |
J1      | 2@16-e5-02 | 11           |
[2      | 2017-e6-25 | 12           |
| 3      | 2016-03-02 | @            |
| 3      | 2018-07-03 | 5            |
$-----------$----- 2-2-2 $2 -- 2-2-2
```

For the player with id 1, 5 + 6 = 11 games played by 2016-05-02, and5+6+41 =
For the player with id 3, @ + 5 = 5 games played by 2018-07-03.
Note that for each player we only care about the days when the player logged in.
OO

**Solution**

```sql
SELECT t1.player_id, tl.event_date, SUM(t2.games_played) as games_played_so_far
FROM Activity t1
JOIN Activity t2
ON t1.player_id = t2.player_id
WHERE t1.event_date >= t2.event_date
GROUP BY t1.player_id, t1.event_date;
SELECT player_id, event_date,
SUM(games_played) OVER (PARTITION BY player_id ORDER BY event_date) AS games_play
FROM Activity;
—
```


---

## 550. Game Play Analysis IV — Medium

Table: Activity

```text
en ees
| Column Name | Type   |
ee rs
| player_id   | int    |
| device_id   | int    |
| event_date | date   |
| games_played | int   |
fo - 2-2-2 - 2 $e oH
(player_id, event_date) is the primary key of this table.
```

This table shows the activity of players of some game.
Each row is a record of a player who logged in and played a number of games (poss
|
Write an SQL query that reports the fraction of players that logged in again on the
day after the day they first logged in, rounded to 2 decimal places. In other words,
you need to count the number of players that logged in for at least two consecutive
days starting from their first login date, then divide that number by the total number
of players.
The query result format is in the following example:

```text
Activity table:
how nnn rn nen nn tr rr npn nnn nr rr npn ne een ret
| player_id | device_id | event_date | games_played |
ee
[2      | 2      | 2016-03-01 | 5        |
_      | 2      | 2016-03-02 | 6        |
| 2      | 3      | 2017-@6-25 | 1        |
| 3      J 2      | 2016-03-02 | @        |
[3      | 4      | 2018-07-03 | 5        |
ee es
Result table:
foo 2-2-2 --+
| fraction |
: atelaneteeiatene sa
| 0.33    |
foo enn nnn
```

Only the player with id 1 logged back in after the first day he had logged in so
OO

**Solution**

```sql
SELECT ROUND(sum(CASE WHEN t1.event_date = t2.first_event+1 THEN 1 ELSE @ END)/CO
FROM Activity t1
JOIN
(SELECT player_id, MIN(event_date) AS first_event
FROM Activity
GROUP BY player_id) t2
ON t1.player_id = t2.player_id;
SELECT ROUND(COUNT(DISTINCT b.player_id)/COUNT(DISTINCT a.player_id),2) AS fracti
FROM
(SELECT player_id, MIN(event_date) AS event_date FROM Activity
GROUP BY player_id) a
LEFT JOIN Activity b
ON a.player_id = b.player_id AND a.event_datet+1 = b.event_date;
———
```


---

## 569. Median Employee Salary — Hard

The Employee table holds all employees. The employee table has three columns:
Employee Id, Company Name, and Salary.

```text
a ata fete
[Id | Company   | Salary |
```

Olea delete etait tote oF
[2   JA       | 2341. |
|2   [A       | 342   |
13 [A       | 15    |
\4   [A       | 15314 |
[5   [A       | 451   |
l6   [A       | 513   |
|7   | B       | 15   |
jg |B       | 13   |
|9   |B       | 1154 |
j1e |B       | 1345 |
jaa | B       | 1221 |
j12, | B       | 234   |
{13 [Cc       | 2345 |
|144 [Cc       | 2645 |
j15 [Cc       | 2645 |
|te [oc       | 2652 |
ja7, | c       | 65    |
shamed e ism meme ebm eee en mes
Write a SQL query to find the median salary of each company. Bonus points if you
can solve it without using any built-in SQL functions.

```text
0 ee ttn ttt gD
|Id | Company   | Salary |
|S ainaiaai aietaetedteienetabetan dateteetelaiatana
[5   [A       | 451   |
\6   [A       | 513   |
[12 |B       | 234   |
l9   |B       | 1154 |
j14 [ec       | 2645 |
0 et en Sete
```

**Solution**

```sql
SELECT t1.Id AS Id, t1.Company, t1.Salary
FROM Employee AS t1 JOIN Employee AS t2
ON t1.Company = t2.Company
GROUP BY t1.Id
HAVING abs(sum(CASE WHEN t2.Salary<t1.Salary THEN 1
WHEN t2.Salary>t1.Salary THEN -1
WHEN t2.Salary=t1.Salary AND t2.Id<t1.Id THEN 1
WHEN t2.Salary=t1.Salary AND t2.Id>t1.Id THEN -1
ELSE @ END)) <= 1
ORDER BY t1.Company, t1.Salary, t1.Id
```


---

## 570. Managers with at Least 5 Direct Reports — Medium

LeetCode
The Employee table holds all employees including their managers. Every employee
has an Id, and there is also a column for the manager Id.

```text
hon rn pn cn nnn pe cnn cn nnn pec nent
|Id   | Name     [Department |ManagerId |
4-2 +--+ 22-2 2-2 $0 2-2-2 -- 2-22 -+
[101 = [John       [A         [null      |
{102 [Dan        IA         |1e1      |
|103. | James     JA           |101      |
|104 | Amy        |A         |101      |
105 [Anne       JA         [101      |
|1e¢6 = [Ron        [B         |101      |
hon rn npn nn nn po cnn nn nn pe nn nnn
```

Given the Employee table, write a SQL query that finds out managers with at least 5
direct report. For the above table, your SQL query should return:

```text
fone nnn nt
| Name |
tooo ont
| John |
Hessesee+
```

Note: No one would report to himself.

**Solution**

```sql
SELECT Name
FROM Employee
WHERE id IN
(SELECT ManagerId
FROM Employee
GROUP BY ManagerId
HAVING COUNT(DISTINCT Id) >= 5)
```


---

## 571. Find Median Given Frequency of Numbers — Hard

The Numbers table keeps the value of number and its frequency.

```text
S releteiateiataiataian dateiatetateiatateteteiaten 2
| Number | Frequency
tooo nen ente------------|
| 3        | 41           I
fo --- 2-2-4 ----- 2-2-2 - H+
```

In this table, the numbers are 0, 0, 0, 0, 0, 0, 0, 1, 2, 2, 2, 3, so the median is (O + 0) /
2=0.

```text
| median |
| @.ee00 |
fon -----+
```

Write a query to find the median of all numbers and name the result as median.

**Solution**

```sql
SELECT avg(t3.Number) as median
FROM Numbers as t3
JOIN
(SELECT t1.Number,
abs(SUM(CASE WHEN t1.Number>t2.Number THEN t2.Frequency ELSE @ END) -
SUM(CASE WHEN t1.Number<t2.Number THEN t2.Frequency ELSE @ END)) AS c
FROM numbers AS t1, numbers AS t2
GROUP BY t1.Number) AS t4
ON t3.Number = t4.Number
WHERE t3.Frequency>=t4.count_diff
a
```


---

## 574. Winning Candidate — Medium

Table: candidate

```text
fon nn tenn nee n Ht
| id | Name   |
Seen tie
Ja [A     |
13 |c¢         |
[5s [Ee         |
```

Heer e rte ccc cet
Table: vote

```text
Hesse cto scence crescent
| id | CandidateId |
la etal D
Ja |       2          |
13 |       3          |
Is |       5          |
hoserctecsrsrasanement
id is the auto-increment primary key, CandidateId is the id appeared in Candidate
table. Write a sql to find the name of the winning candidate, the above example will
return the winner B.
```

```text
tence ot
| Name |
torn nent
lB |
beeen ot
```

Notes: You may assume there is no tie, in other words there will be at most one
winning candidate.

**Solution**

```sql
SELECT Name
FROM Candidate
WHERE id = (SELECT CandidateId
FROM Vote
GROUP BY CandidateId
ORDER BY COUNT(1) desc
LIMIT 1)
—,
```


---

## 577. Employee Bonus — Easy

Select all employee’s name and bonus whose bonus is < 1000.
Table:Employee

```text
6 ella eh latin ett etn
| empId | name | supervisor| salary
Ce es
| 1 | John | 3  | 1e00 «|
{| 2 [dan | 3  | 2eee |
| 3 | Brad | null     | 4000
| 4 | Thomas | 3      | 4000 |
ee
empId is the primary key column for this table.
Table: Bonus
```

```text
tt ttn oF
| empId | bonus |
Siete colette 2
| 2   | see =|
| 4    | 2eee |
. th Sin
empId is the primary key column for this table.
Example ouput:
```

```text
Sate lien oF
| name | bonus |
```

Herc c nner nnn t
| John | null |
| Dan | 5e0 |
| Brad | null |
Sta telat a o

**Solution**

```sql
SELECT name, bonus
FROM Employee LEFT JOIN Bonus
ON Employee.empId = Bonus.empId
WHERE bonus<1@@@ OR bonus IS NULL;
```


---

## 578. Get Highest Answer Rate Question — Medium

Get the highest answer rate question from a table surveylog with these columns:
uid, action, questionid, answerid, qnum, timestamp.
uid means user id; action has these kind of values: “show”, “answer”, “skip”; answerid
is not null when action column is “answer’, while is null for “show” and “skip”; qnum is
the numeral order of the question in current session.
Write a sql query to identify the question which has the highest answer rate.
Example: Input:

Sete tte teles tt: 2: 2: 2 eo
| uid | action     | question_id | answer_id | q_num      | timestamp |
, at 2. ee. 2. ees
[5     | show      | 285          | null        }1         | 123         |
[5     | answer    | 285          | 124124      } 1          | 124        |
| 5     | show      | 369          | null        | 2          | 125         |
[8     | skip      | 369          | null        | 2          | 126        |
an rn nba sn ne nn np nn nnn en nn pn nn sn en npn cn eee enn pn nnn ern n een nt
Output:

```text
bocce ccc crn nat
| survey_log |
shaves esi
|     285       |
```

Explanation: question 285 has answer rate 1/1, while question 369 has 0/1 answer
rate, so output 285.
Note: The highest answer rate meaning is: answer number's ratio in show number in
the same question.

**Solution**

```sql
SELECT question_id AS survey_log FROM
(SELECT question_id,
SUM(IF(action='show', 1, ®)) AS num_show,
SUM(IF(action="answer', 1, @)) AS num_answer
FROM survey_log GROUP BY question_id) AS t
ORDER BY (num_answer/num_show) DESC LIMIT 1;
SELECT question_id AS survey_log
FROM (SELECT question_id,
sum(CASE WHEN action='show' THEN 1 ELSE @ END) AS show_count,
sum(CASE WHEN action="answer' THEN 1 ELSE @ END) AS answer_count
FROM survey_log
GROUP BY question_id) AS t
ORDER BY answer_count/show_count DESC LIMIT 1;
```


---

## 579. Find Cumulative Salary of an Employee — Hard

LeetCode
The Employee table holds the salary information in a year.
Write a SQL to get the cumulative sum of an employee's salary over a period of 3
months but exclude the most recent month.
The result should be displayed by ‘Id’ ascending, and then by ‘Month’ descending.
Example Input

```text
| Id | Month | Salary |
[paten | imeicens| acer
Ja [4   | 20   |
J2 4   | 20   |
Ja | 2   | 30   |
{2 |2   | 30   |
[3 | 2   | 40   |
[1 | 3   | 40   |
13 | 3    | 68   |
Ja | 4    | 68   |
13 | 4    | 78   |
Output
```

```text
| Id | Month | Salary |
[#222] eseeets [ReeaeeeS|
| 1 | 3   | 90   |
[1 | 2   | se   |
Ja fa   | 28   |
{2 |4   | 28   |
13 | 3   | 100   |
[3 [2   | 40   |
```

Explanation Employee ‘1’ has 3 salary records for the following 3 months except the
most recent month ‘4’ salary 40 for month ‘3; 30 for month ‘2’ and 20 for month ‘1’
So the cumulative sum of salary of this employee over 3 months is 90(40+30+20),
50(30+20) and 20 respectively.

```text
| Id | Month | Salary |
|----|---222-[--------]
Ja | 3   | 98   |
Ja [2   | 58   |
Ja ja   | 20   |
```

Employee ‘2’ only has one salary record (month ‘1’) except its most recent month ‘2:

```text
| Id | Month | Salary |
[secsmif eetscrne assenscimnn|
J}2 Ja   | 20   |
```

Employ ‘3’ has two salary records except its most recent pay month ‘4’: month ‘3’
with 60 and month ‘2’ with 40. So the cumulative salary is as following.

```text
| Id | Month | Salary |
aie anita ‘aan |
13 |3   | 100   |
[3 [2   | 40   |
```

**Solution**

```sql
SELECT
a.id,
a.month,
SUM(b.salary) Salary
FROM
Employee a JOIN Employee b ON
a.id = b.id AND
a.month - b.month >= @ AND
a.month - b.month < 3
GROUP BY
a.id, a.month
HAVING
(a.id, a.month) NOT IN (SELECT id, MAX(month) FROM Employee GROUP BY id)
ORDER BY
a.id, a.month DESC
```


---

## 580. Count Student Number in Departments — Medium

LeetCode
A university uses 2 data tables, student and department , to store data about its
students and the departments associated with each major.
Write a query to print the respective department name and number of students
majoring in each department for all departments in the department table (even ones
with no current students).
Sort your results by descending number of students; if two or more departments
have the same number of students, then sort those departments alphabetically by
department name.
The student is described as follow:

```text
| Column Name | Type       |
| student_id | Integer |
| student_name | String     |
| gender       | Character |
| dept_id       | Integer |
where studentid is the student’s ID number, studentname is the student’s name,
gender is their gender, and dept_id is the department ID associated with their
declared major.
```

And the department table is described as below:

```text
| Column Name | Type     |
| dept_id      | Integer |
| dept_name | String |
where deptid is the department's ID number and deptname is the department name.
```

Here is an example input: student table:

```text
| student_id | student_name | gender | dept_id |
| 1           | Jack         | ™M      {1        |
|2           | Jane         | F       {1        |
[3           | Mark         | ™      | 2        |
department table:
```

```text
| dept_id | dept_name |
pei     | Engineering |
| 2     | Science    |
| 3     | Law      |
The Output should be:
```

```text
| dept_name | student_number |
| Engineering | 2         |
| Science    | 1          |
| Law      | @         |
```

**Solution**

```sql
SELECT dept_name,
SUM(CASE WHEN student_id IS NULL THEN @ ELSE 1 END) AS student_number
FROM department
LEFT JOIN student
ON department.dept_id = student.dept_id
GROUP BY department.dept_id
ORDER BY student_number DESC, dept_name
```


---

## 584. Find Customer Referee — Easy

Given a table customer holding customers information and the referee.

Sl eieaals telattalet telat of
| id | name | referee_id|
herr rete ccc tec ccc rent
|   1 | will |    NULL |
|   2 | Jane |    NULL |
|    3 | Alex |          2 |
|   4 | Bill |    NULL |
|   5 | Zack |      1 |
|   6 | Mark |      2 |
b leleateiets eleletal eats teleietaeetetetetaen a
Write a query to return the list of customers NOT referred by the person with id ‘2:
For the sample data above, the result is:

```text
once nt
| name |
soe
| will |
| Jane |
| Bill |
| Zack |
Henne eet
```

**Solution**

```sql
SELECT name
FROM customer
WHERE referee_id != '2' OR referee_id IS NULL
```


---

## 585. Investments in 2016 — Medium

Write a query to print the sum of all total investment values in 2016 (TIV_2016), to a
scale of 2 decimal places, for all policy holders who meet the following criteria:
1. Have the same TIV_2015 value as one or more other policyholders.
2. Are not located in the same city as any other policyholder (i.e.: the (latitude,
longitude) attribute pairs must be unique). Input Format: The insurance table is
described as follows:

```text
| Column Name | Type       |
| PID      | INTEGER(11) |
| TIv_2e15   | NUMERIC(15,2) |
| TIv_2e16   | NUMERIC(15,2) |
| LAT      | NUMERIC(5,2) |
| LON      | NUMERIC(5,2) |
where PID is the policyholder’s policy ID, TIV2015 is the total investment value in
2015, TIV2016 is the total investment value in 2016, LAT is the latitude of the policy
holder's city, and LON is the longitude of the policy holder's city.
Sample Input
```

```text
| PID | TIV_2015 | TIV_2e16 | LAT | LON |
[--20+ | peeeeeeees [oeeceeeees|oeeee [eee =|
Ja | 10  [5  | 10 | 10 |
| 2 | 2e  | 2  | 28 | 2e |
[3 | 10  | 30  | 20 | 20 |
|4 | 10  | 40  | 4e | 40 |
Sample Output
```

```text
| TIv_2e16 |
| 45.00   |
Explanation
```

The first record in the table, like the last record, meets both of the two criter
The TIV_2015 value '10' is as the same as the third and forth record, and its loc
The second record does not meet any of the two criteria. Its TIV_2015 is not like
And its location is the same with the third record, which makes the third record
So, the result is the sum of TIV_2016 of the first and last record, which is 45.
a)

**Solution**

```sql
SELECT SUM(TIV_2016) AS TIV_2016
FROM insurance
WHERE CONCAT(LAT, ',', LON)
IN (SELECT CONCAT(LAT, ',*, LON)
FROM insurance
GROUP BY LAT, LON
HAVING COUNT(1) = 1)
AND TIV_2015 in
(SELECT TIV_2015
FROM insurance
GROUP BY TIV_2015
HAVING COUNT(1)>1)
```


---

## 586. Customer Placing the Largest Number of Orders — Easy

(® LeetCode
Query the customer_number from the orders table for the customer who has placed
the largest number of orders.
It is guaranteed that exactly one customer will have placed more orders than any
other customer.
The orders table is defined as follows:

```text
| Column        | Type    |
| order_number (PK) | int     |
| customer_number | int     |
| order_date      | date    |
| required_date    | date    |
| shipped_date    | date    |
| status      | char(15) |
| comment       | char(20@) |
Sample Input
```

```text
| order_number | customer_number | order_date | required_date | shipped_date | st
[2        J 2          | 2017-@4-e9 | 2017-04-13   | 2017-04-12 | cl
| 2        | 2          | 2017-@4-15 | 2017-04-20   | 2017-04-18 =| Cl
| 3        | 3          | 2017-04-16 | 2017-04-25   | 2017-04-28 | Cl
| 4        | 3          | 2017-04-18 | 2017-04-28   | 2017-04-25 | cl
—
Sample Output
```

```text
| customer_number |
 siaanaalaimeiaiaiainniaiinin’ |
Explanation
```

The customer with number '3' has two orders, which is greater than either custome
So the result is customer_number '3'.
nn

**Solution**

```sql
SELECT customer_number FROM orders
GROUP BY customer_number
ORDER BY COUNT(1) DESC
LIMIT 1
```


---

## 595. Big Countries — Easy

There is a table world

Pan rn re re nn nfo nn en en ape nn se rn po nnn en eee nen npn cnn n ne eee n eat
| name        | continent | area     | population | gdp       |
, ee: he a. ee
| Afghanistan   | Asia     | 652230   | 25500100    | 20343000    |
| Albania      | Europe   | 28748    | 2831741    | 12960000    |
| Algeria      | Africa    | 2381741   | 371ee0e0    | 188681000   |
| Andorra      | Europe    | 468     | 78115     | 3712e0ee     |
| Angola       | Africa    | 1246700   | 20609294   | 1ee999000   |
0 te ee
A country is big if it has an area of bigger than 3 million square km or a population of
more than 25 million.
Write a SQL solution to output big countries’ name, population and area.
For example, according to the above table, we should output:

```text
bite ttt ite oD
| name      | population | area      |
```

Le I eet ee ee ei
| Afghanistan | 25500100   | 652230     |
| Algeria    | 37100000   | 2381741    |
tt: St tt ptt

**Solution**

```sql
SELECT name, population, area
FROM World
WHERE area >= 30@@00@ OR population > 25e0@000;
```


---

## 596. Classes More Than 5 Students — Easy

There is a table courses with columns: student and class
Please list out all classes which have more than or equal to 5 students.
For example, the table:

```text
$-- 2-2-2 - $2 -- 2-H $
| student | class    |
Sh es
[A     | Math     |
| B     | English   |
lc     | Math     |
| D     | Biology   |
Je     | Math     |
| F     | Computer — |
| G     | Math     |
| H     | Math     |
|r     | Math     |
```

Henn ce rere tere cece cen nt
Should output:

```text
foo enn nt
| class |
penne nant
| Math   |
teecccccet
```

**Solution**

```sql
SELECT class
FROM courses
GROUP BY class
HAVING count(DISTINCT Student)>=5;
```


---

## 597. Friend Requests I: Overall Acceptance Rate — Easy

LeetCode
In social network like Facebook or Twitter, people send friend requests and accept
others’ requests as well. Now given two tables as below: Table: friend_request

```text
| sender_id | send_to_id |request_date|
|1      | 2       | 2016 @6-01 |
[1      | 3       | 2016_@6-01 |
[1      [4       | 2016_@6-01 |
[2      | 3       | 2016_@6-0@2 |
| 3      | 4       | 2016-26-29 |
Table: request_accepted
```

```text
| requester_id | accepter_id |accept_date |
J1        | 2       | 2016 6-23 |
[1        | 3       | 2e16-26-e8 |
| 2        | 3       | 2016-06-28 |
| 3        [4       | 2016-06-29 |
| 3        [4       | 2016-06-10 |
```

Write a query to find the overall acceptance rate of requests rounded to 2 decimals,
which is the number of acceptance divide the number of requests. For the sample
data above, your query should return the following result.

```text
|accept_rate|
[panes |
Note:
```

The accepted requests are not necessarily from the table friendrequest. In this case,
you just need to simply count the total accepted requests (no matter whether they
are in the original requests), and divide it by the number of requests to get the
acceptance rate. It is possible that a sender sends multiple requests to the same
receiver, and a request could be accepted more than once. In this case, the
‘duplicated’ requests or acceptances are only counted once. If there is no requests
at all, you should return 0.00 as the acceptrate. Explanation: There are 4 unique
accepted requests, and there are 5 requests in total. So the rate is 0.80.
Follow-up:
Can you write a query to return the accept rate but for every month? How about the
cumulative accept rate for every day?

**Solution**

```sql
SELECT IFNULL((round(accepts/requests, 2)), @.@) AS accept_rate
FROM
(SELECT count(DISTINCT sender_id, send_to_id) AS requests FROM friend_request
(SELECT count(DISTINCT requester_id, accepter_id) AS accepts FROM request_acc
—
```


---

## 601. Human Traffic of Stadium — Hard

Table: stadium

```text
Satellites tallies oD
| Column Name | Type     |
ee eee
| id               | int       |
| visit_date     | date     |
| people          | int       |
b iataeiataatatatatatataatatet iatateteteteiatata a
visitdate is the primary key for this table. Each row of this table contains the visit
date and visit id to the stadium with the number of people during the visit. No two
rows will have the same visitdate, and as the id increases, the dates increase as
well.
```

Write an SQL query to display the records with three or more rows with consecutive
id's, and the number of people is greater than or equal to 100 for each.
Return the result table ordered by visit_date in ascending order.
The query result format is in the following example.

```text
Stadium table:
al la al alte leat 2
| id | visit_date | people   |
Ses ee aa eee
[1   | 2017-e1-01 | 10     |
[2   | 2017-01-02 | 109     |
| 3   | 2017-01-e3 | 150     |
| 4   | 2017-e1-04 | 99      |
[5   | 2017-01-@5 | 145     |
| 6   | 2017-01-26 | 1455    |
| 7   | 2017-01-e7 | 199     |
| 8   | 2017-01-09 | 188     |
4$------4+------------4-----------4+
Result table:
```

Slee tala aati ale cate 2
| id | visit_date | people   |
ee es See
[5   | 2017-e1-@5 | 145     |
| 6   | 2017-e1-e6 | 1455    |
| 7   | 2017-01-e7 | 199     |
| 8   | 2017-01-09 | 188     |
a ieee eee g
The four rows with ids 5, 6, 7, and 8 have consecutive ids and each of them has >
The rows with ids 2 and 3 are not included because we need at least three consecu

**Solution**

```sql
SELECT DISTINCT s1.*
FROM Stadium s1 JOIN Stadium s2 JOIN Stadium s3
ON (s1.id = s2.id-1 AND sl.id = s3.id-2) OR
(s1.id = s2.id+1 AND sl.id = s3.id-1) OR
(s1.id = s2.id+1 AND sl.id = s3.id+2)
WHERE s1.people >= 10@ AND s2.people >= 10@ AND s3.people>=100
ORDER BY visit_date
```


---

## 602. Friend Requests II: Who Has the Most Friends — Medium

&® LeetCode
In social network like Facebook or Twitter, people send friend requests and accept
others’ requests as well. Table request_accepted holds the data of friend
acceptance, while requesterid and accepterid both are the id of a person.

```text
| requester_id | accepter_id | accept_date|
J 2        [2       | 2016_@6-03 |
[4        | 3       | 2016-06-08 |
| 2        | 3       | 2016-06-08 |
| 3        [4       | 2016-06-29 |
```

Write a query to find the the people who has most friends and the most friends
number. For the sample data above, the result is:

```text
| id | num |
| ad saan
13 [3 |
Note:
```

It is guaranteed there is only 1 people having the most friends. The friend request
could only been accepted once, which mean there is no multiple records with the
same requesterid and accepterid value. Explanation: The person with id ‘3’ is a friend
of people ‘1; ‘2’ and ‘4; so he has 3 friends in total, which is the most number than
any others.
Follow-up: In the real world, multiple people could have the same most number of
friends, can you find all these people in this case?
ry
SELECT t.id, sum(t.num) AS num
FROM (
(SELECT requester_id AS id, COUNT(1) AS num
FROM request_accepted
GROUP BY requester_id)
union all
(SELECT accepter_id AS id, COUNT(1) AS num
FROM request_accepted
GROUP BY accepter_id)) AS t
GROUP BY t.id
ORDER BY num DESC
LIMIT 15


---

## 603. Consecutive Available Seats — Easy

Several friends at a cinema ticket office would like to reserve consecutive available
seats. Can you help to query all the consecutive available seats order by the seat_id
using the following cinema table?

```text
| seat_id | free |
[ssnennzen [peenen|
ja         1 J
| 2         le |
[4        Ja     |
```

Your query should return the following result for the sample case above.

```text
| seat_id |
[peerenses
Note:
```

The seat_id is an auto increment int, and free is bool (‘1’ means free, and ‘0’ means
occupied.). Consecutive available seats are more than 2(inclusive) seats
consecutively available.

**Solution**

```sql
SELECT DISTINCT t1.seat_id
FROM cinema AS t1 JOIN cinema AS t2
ON abs(t1.seat_id-t2.seat_id)=1
WHERE t1.free='1' AND t2.free='1'
ORDER BY t1.seat_id
```


---

## 607. Sales Person — Easy

Description
Given three tables: salesperson, company, orders. Output all the names in the table
salesperson, who didn’t have sales to company ‘RED:
Example Input
Table: salesperson

```text
, ae eee: os ee See
| sales_id | name | salary | commission_rate | hire_date |
```

Hon rr tp rn rhe nn rn npn ne en rn ee pe ne ener e ent
—    | John | 10000 |   6       | 4/1/2006 |
[| 2    | Amy | 120000 |   5       | 5/1/2e1e |
| 3    | Mark | 65000 |   12      | 12/25/2¢08 |
| 4    | Pam | 25000 |    25       | 1/1/2ee5 |
| 5    | Alex | 50000 |   10      | 2/3/2007 |
Hho rr rr thn rn then rr be rn ct rn rn cre enter c crn cent
The table salesperson holds the salesperson information. Every salesperson has a
sales_id and a name. Table: company

```text
ee tte Dee 2
| com_id | name |    city
```

Sidelines. aeaieieniania Janie aisaliniatmiantan: 5
| 2    | RED | Boston |
| 2    | ORANGE | New York |
| 3    | YELLOW | Boston |
| 4    | GREEN | Austin |
Salalah lath telat eaten tated
The table company holds the company information. Every company has a com_id
and a name. Table: orders

```text
4$----------+----------4---------4----------4--------+
| order_id | date   | com_id | sales_id | amount |
ha nr rn thn rr nn po nnn pen cn nn nto nent
ie:      | 1/1/2014 |   3   |   4    | 1ee@ee0 |
[2      | 2/1/2014 |   4   |   5    | 5ee0 |
| 3      | 3/1/2014 |   1   |   1    | 5ee0ee |
|4      | 4/1/2014 |   1   |   4    | 25ee0 |
als lal a elle Sele Sela oF
```

The table orders holds the sales record information, salesperson and customer
company are represented by salesid and comid. output

```text
| name |
| Amy |
| Mark |
| Alex |
#ossenet
Explanation
```

According to order ‘3’ and ‘4’ in table orders, it is easy to tell only salesperson John’
and ‘Alex’ have sales to company ‘RED’ so we need to output all the other names in
table salesperson.

**Solution**

```sql
SELECT name
FROM salesperson
WHERE name NOT IN
(SELECT DISTINCT salesperson.name
FROM salesperson, orders, company
WHERE company.name = ‘RED'
AND salesperson.sales_id = orders.sales_id
AND orders.com_id = company.com_id)
```


---

## 608. Tree Node — Medium

Given a table tree, id is identifier of the tree node and p_id is its parent node’s id.

```text
betel Seletatetatan 2
| id | p_id |
tec c eter cent
}1 | null |
ee |
|
tooo ote o-oo +
```

Each node in the tree can be one of three types:
Leaf: if the node is a leaf node. Root: if the node is the root of the tree. Inner: If the
node is neither a leaf node nor a root node. Write a query to print the node id and
the type of the node. Sort your output by the node id. The result for the above
sample is:

```text
a eee
| id | Type |
Hono n tenn nt
| 1. | Root |
| 2 | Inner|
| 3 | Leaf |
| 4 | Leaf |
| 5 | Leaf |
Ce eee
Explanation
```

Node ‘1’ is root node, because its parent node is NULL and it has child node ‘2’ and
‘3. Node ‘2’ is inner node, because it has parent node ‘1’ and child node ‘4’ and ‘5:
Node ‘3} ‘4’ and ‘5’ is Leaf node, because they have parent node and they don’t have
child node. And here is the image of the sample tree as below:

```text
dl
/ \
fi
Note
```

If there is only one node on the tree, you only need to output its root attributes.

**Solution**

```sql
SELECT t1.id,
CASE
WHEN ISNULL(t1.p_id) THEN ‘Root’
WHEN ISNULL(MAX(t2.id)) THEN ‘Leaf’
ELSE ‘Inner’
END AS Type
FROM tree AS t1 LEFT JOIN tree AS t2
ON t1.id = t2.p_id
GROUP BY t1.id, t1.p_id
```


---

## 610. Triangle Judgement — Easy

A pupil Tim gets homework to identify whether three line segments could possibly
form a triangle. However, this assignment is very heavy because there are hundreds
of records to calculate. Could you help Tim by writing a query to judge whether
these three sides can form a triangle, assuming table triangle holds the length of the
three sides x, y and z.

```text
Ix ly Iz |
|ss00[:cn2e [nen
| 13 | 15 | 30 |
| 1e | 20 | 15 |
```

For the sample data above, your query should return the follow result:

```text
Ix | y | z | triangle |
[possi pores [prom |eoanecetsa|
| 13 | 15 | 3@ | No  |
| 1e@ | 20 | 15 | Yes  |
```

**Solution**

```sql
SELECT 'X}) Ve Zs
CASE
WHEN x+y>z AND y+z>x AND x+z>y THEN '‘Yes'
ELSE ‘No*
END AS triangle
FROM triangle
```


---

## 612. Shortest Distance in a Plane — Medium

Table point_2d holds the coordinates (x,y) of some unique points (more than two) in
a plane. Write a query to find the shortest distance between these points rounded to
2 decimals.

```text
Ix ly |
[sesepeee |
```

The shortest distance is 1.00 from point (-1,-1) to (-1,2). So the output should be:

```text
| shortest |
[eoemsinsieim
| 1.00      |
```

Note: The longest distance among all the points are less than 10000.

**Solution**

```sql
SELECT ROUND(MIN(SQRT((t1.x-t2.x)*(t1.x-t2.x) + (t1.y-t2.y)*(t1.y-t2.y))), 2) as
FROM point_2d AS t1, point_2d AS t2
WHERE t1.x!=t2.x OR tl.y!=t2.y
ee
```


---

## 613. Shortest Distance in a Line — Easy

Table point holds the x coordinate of some points on x-axis in a plane, which are all
integers. Write a query to find the shortest distance between two points in these
points.

```text
Ix |
[res]
[a
Je |
,2 |
```

The shortest distance is ‘1’ obviously, which is from point ‘-1’ to ‘0: So the output is
as below:

```text
| shortest |
[scaneenns,|
```

Note: Every point is unique, which means there is no duplicates in table point.
Follow-up: What if all these points have an id and are arranged from the left most to
the right most of x axis?

**Solution**

```sql
SELECT t1.x-t2.x AS shortest
FROM point AS t1 JOIN point AS t2
WHERE t1.x>t2.x
ORDER BY (t1.x-t2.x) ASC
LIMIT 1
```


---

## 614. Second Degree Follower — Medium

In facebook, there is a follow table with two columns: followee, follower.
Please write a sql query to get the amount of each follower’s follower if he/she has
one.
For example:

```text
pose ce eee eee epee eee
| followee     | follower    |
ee eens
foo 22-222 $-- 2-2-2222 --+
should output:
```

```text
een. See eee
| follower     | num          |
o atelatatalaiataitataalatar teteialalatetaatatatat 2
|       D         Joa           I
eee SeRESoESEeyESeEE EEE SUE
```

Explanation: Both B and D exist in the follower list, when as a followee, B’s follower is
C and D, and D’s follower is E. A does not exist in follower list.
Note: Followee would not follow himself/herself in all cases. Please display the result
in follower’s alphabet order.

**Solution**

```sql
SELECT f1.follower, COUNT(DISTINCT f2.follower) AS num
FROM follow AS f1 JOIN follow AS £2
ON f1.follower = £2.followee
GROUP BY f1.follower;
```


---

## 615. Average Salary: Departments VS Company — Hard

LeetCode
Given two tables as below, write a query to display the comparison result
(higher/lower/same) of the average salary of employees in a department to the
company’s average salary. Table: salary

```text
| id | employee_id | amount | pay_date |
Ja [4       | 9000 | 2017-03-31 |
[2 | 2       | 6900 =| 2017-03-31 |
13 |3       | 1900@ | 2017-03-31 |
|4 [4       | 700@ =| 2017-02-28 |
{5 [2       | 6000 | 2017-02-28 |
leo | 3       | seee | 2017-82-28 |
```

The employeeid column refers to the employeeid in the following table employee.

```text
| employee_id | department_id |
Ja        Ja         |
13        | 2         |
```

So for the sample data above, the result is:

```text
| pay_month | department_id | comparison |
| 2017-03 | 1         | higher    |
| 2017-03 | 2        | lower     |
| 2017-02 | 1        | same     |
| 2017-02 | 2        | same     |
```

Explanation In March, the company’s average salary is (9000+6000+10000)/3 =
8333.33... The average salary for department ‘1’ is 9000, which is the salary of
employeeid ‘1’ since there is only one employee in this department. So the
comparison result is ‘higher’ since 9000 > 8333.33 obviously. The average salary of
department ‘2’ is (6000 + 10000)/2 = 8000, which is the average of employeeid ‘2’
and ‘3: So the comparison result is ‘lower’ since 8000 < 8333.33. With he same
formula for the average salary comparison in February, the result is ‘same’ since
both the department ‘1’ and ‘2’ have the same average salary with the company,
which is 7000.

**Solution**

```sql
SELECT t1.pay_month, t1.department_id,
(CASE WHEN t1.amount = t2.amount THEN ‘same’
WHEN t1.amount > t2.amount THEN ‘higher’
WHEN tl.amount < t2.amount THEN ‘lower’ END) AS comparison
FROM
(SELECT left(pay_date, 7) AS pay_month, department_id, avg(amount) AS amount
FROM salary JOIN employee
ON salary.employee_id = employee.employee_id
GROUP BY pay_month, department_id
ORDER BY pay_month DESC, department_id) AS t1
JOIN
(SELECT left(pay_date, 7) AS pay_month, avg(amount) AS amount
FROM salary JOIN employee
ON salary.employee_id = employee.employee_id
GROUP BY pay_month) AS t2
ON t1.pay_month = t2.pay_month
a
```


---

## 618. Students Report By Geography — Hard

A U.S graduate school has students from Asia, Europe and America. The students’
location information are stored in table student as below.

```text
| name | continent |
| Jack | America |
| Pascal | Europe     |
| Xi       | Asia        |
| Jane | America |
```

Pivot the continent column in this table so that each name is sorted alphabetically
and displayed underneath its corresponding continent. The output headers should
be America, Asia and Europe respectively. It is guaranteed that the student number
from America is no less than either Asia or Europe. For the sample input, the output
is:

```text
| America | Asia | Europe |
eed eed oad
| Jack     | Xi | Pascal |
| Jane |        |          |
```

Follow-up: If it is unknown which continent has the most students, can you write a
query to generate the student report?

**Solution**

```sql
SELECT t1.name AS America, t2.name AS Asia, t3.name AS Europe
FROM
(SELECT (@cnt1 := @cnt1 + 1) AS id, name
FROM student
CROSS JOIN (SELECT @cnt1 := @) AS dummy
WHERE continent='America'
ORDER BY name) AS t1
LEFT JOIN
(SELECT (@cnt2 := @cnt2 + 1) AS id, name
FROM student
CROSS JOIN (SELECT @cnt2 := @) AS dummy
WHERE continent='Asia‘
ORDER BY name) AS t2
ON t1.id = t2.id
LEFT JOIN
(SELECT (@cnt3 := @cnt3 + 1) AS id, name
FROM student
CROSS JOIN (SELECT @cnt3 := @) AS dummy
WHERE continent='Europe
ORDER BY name) AS t3
ON t1.id = t3.id
```


---

## 619. Biggest Single Number — Easy

Table number contains many numbers in column num including duplicated ones. Can
you write a SQL query to find the biggest number, which only appears once.

```text
4on-+
| num
ann
138 |
138 |
13 |
13]
| 1 |
14]
[5]
le |
```

For the sample data above, your query should return the following result:

```text
+---+
|num|
tenn
6 |
```

Note: If there is no such number, just output null.

**Solution**

```sql
SELECT IFNULL((
SELECT num
FROM number
GROUP BY num
HAVING count(1) = 1
ORDER BY num DESC
LIMIT @, 1), NULL) AS num
```


---

## 620. Not Boring Movies — Easy

X city opened a new cinema, many people would like to go to this cinema. The
cinema also gives out a poster indicating the movies’ ratings and descriptions.
Please write a SQL query to output movies with an odd numbered ID and a
description that is not ‘boring’ Order the result by rating.
For example, table cinema:

```text
D eieateeiedaiaietahs telateetetetatetatatet dateieteiekeietetatetatatetan tetetettettateiatatet a
| id   | movie   | description | rating |
Se ee ee eee
| 2    | War      | great 3D | 8.9    |
{ 2    | Science | fiction   | 8.5    |
[ 3    | irish    | boring    | 6.2    |
| 4    | Ice song |   Fantacy   |   8.6    |
| o5    | House card| Interesting] 9.1    |
Se ee ee ero
```

For the example above, the output should be:

```text
Sih i Pe nD
| id   | movie   | description | rating |
tesccccrnsbercrererecrchessccsscrmecredercescecscsd
| 5    | House card| Interesting] 9.1    |
{ «2    | war      | great 3D | 8.9    |
s siatdetaatiah, alates aiatatets tealadia atetatataialataiatats Sabaiaiaieaiamienennia sa
```

**Solution**

```sql
SELECT *
FROM Cinema
WHERE description <> ‘boring’ AND ID%2=1
ORDER BY rating DESC;
```


---

## 626. Exchange Seats — Medium

Mary is a teacher in a middle school and she has a table seat storing students’
names and their corresponding seat ids.
The column id is continuous increment.
Mary wants to change seats for the adjacent students.
Can you write a SQL query to output the result for Mary?

```text
S raiateieiaiaiaieiah teletetatebeneiatan a
|   id | student |
eo
|    1    | Abbot |
|   2   | Doris |
|   3   | Emerson |
|   4   | Green |
|    5    | Jeames |
Sc iaeieieiteiea teleteieeteetatat a
```

For the sample input, the output is:

```text
Pe secceese per eeosseey
|   id | student |
Hee cce rece tenneccnnet
|   1   | Doris |
| 2. | Abbot |
|   3   | Green |
|   4   | Emerson |
|    5    | Jeames |
Sl lalalatatelahs teliatatataetaat 2
Note:
```

If the number of students is odd, there is no need to change the last one’s seat.

**Solution**

```sql
SELECT
IF(id< (SELECT MAX(id) FROM seat), IF(id%2=0,id-1, id+1),IF(id%2=0, id-1, id)) AS i
FROM seat
ORDER BY id;
—
```


---

## 627. Swap Salary — Easy

Table: salary

```text
en ees
| Column Name | Type    |
fo ----- 2-2-2 -$----------+
| id       | int    |
| name     | varchar |
| sex      | ENUM   |
| salary    | int    |
Sn es
id is the primary key for this table.
```

The sex column is ENUM value of type (‘m', 'f').
The table contains information about an employee.
Write an SQL query to swap all ‘f' and ‘m’ values (i.e., change all ‘f' values to
‘m' and vice versa) with a single update statement and no intermediate temp
table(s).
Note that you must write a single update statement, DO NOT write any select
statement for this problem.
The query result format is in the following example:

```text
Salary table:
Diet teeta cee ns
| id | name | sex | salary |
ee eens
[1 |A   | m | 2500 |
{2 |B |# | 1500 |
[3 |c  [m | 5500 |
|4 |b   | # | 5ee   |
oe ee een eers
Result table:
fo --- 42 ----- 42-22 -t---- 22-4
| id | name | sex | salary |
[en ee ees
[1 |A | # | 2500 |
| 2 |B   | m | 15e0 |
{3 |c | | 550 |
|4 |oD   | m | 500   |
es
(1, A) and (2, C) were changed from 'm' to 'f'.
(2, B) and (4, D) were changed from 'f' to 'm'.
```

**Solution**

```sql
UPDATE Salary SET sex = IF(sex='m', ‘f', 'm')
UPDATE Salary SET sex = CASE WHEN sex='m' THEN 'f' ELSE 'm' END
```


---

## 1045. Customers Who Bought All Products — Medium

LeetCode
Table: customer

```text
en eg
| Column Name | Type   |
ees
| customer_id | int   |
| product_key | int    |
Se ee
product_key is a foreign key to Product table. Table: Product
```

```text
ee es
| Column Name | Type   |
ee es
| product_key | int    |
Ce ee
product_key is the primary key column for this table.
```

Write an SQL query for a report that provides the customer ids from the Customer
table that bought all the products in the Product table.
For example:

```text
Customer table:
Se eg
| customer_id | product_key |
{poe SSS pee Sings
Ja       | 6       |
. eiaianaiataneinetaiaieianes taieieiakeaneneteiaianenat 2
Product table:
poe n cee erent
| product_key |
foo n-ne nee -+
5 ialaiatetatateteiatetataianal
Result table:
| customer_id |
fon nn een n eee nt
```

The customers who bought all the products (5 and 6) are customers with id 1 and 3
=

**Solution**

```sql
SELECT customer_id
FROM Customer
GROUP NY customer_id
HAVING count(DISTINCT product_key) = (
SELECT count(1)
FROM Product)
```


---

## 1050. Actors and Directors Who Cooperated At Least Three Times — Easy

Table: ActorDirector

```text
Sele eiatiaaietateiaat teeta a
| Column Name | Type   |
2 ees
| actor_id    | int
| director_id | int
| timestamp | int
Seale eaieen e
timestamp is the primary key column for this table.
```

Write a SQL query for a report that provides the pairs (actorid, directorid) where the
actor have cooperated with the director at least 3 times.
Example:

```text
ActorDirector table:
the sccrcccr cre sbessneccscereetecrercsccrened
| actor_id   | director_id | timestamp |
S eceieiatetataiateiateiateh datetateteletetetetaiatedien deeteteietateiatetetaiaana
4       4       |e       |
J 1       J 4       | 1       |
Ja       4       |. 2       |
Ja       | 2       | 3       |
Ja       | 2       14       |
| 2       4       ls       |
| 2       [4       | 6       |
{ASS SSS PSE poe ESS
Result table:
| actor_id   | director_id |
Se es
Ja        Ja        |
ee
```

The only pair is (1, 1) where they cooperated exactly 3 times.

**Solution**

```sql
SELECT actor_id, director_id
FROM ActorDirector
GROUP BY actor_id, director_id
HAVING COUNT(1)>=3
```


---

## 1068. Product Sales Analysis I — Easy

Table: sales

```text
Se 7
| Column Name | Type |
ie Deeg
| sale_id   | int |
| product_id | int |
| year     | int |
| quantity   | int |
| price     | int |
ee Sef
(sale_id, year) is the primary key of this table.
product_id is a foreign key to Product table.
```

Note that the price is per unit.
Table: Product

```text
s siatedetalalatiatatetataian seteiaiateteieiat |
| Column Name | Type   |
ees
| product_id | int    |
| product_name | varchar |
, en ee
product_id is the primary key of this table.
```

Write an SQL query that reports all product names of the products in the Sales table
along with their selling year and price.
For example:

```text
Sales table:
Ce ees
| sale_id | product_id | year | quantity | price |
es
Ja     | 100     | 2008 | 10     | seee |
| 2     | 1¢0     | 2ee9 | 12     | seee |
| 7     | 200     | 2e11 | 15     | 9e0ee |
fo - 2-2 2-2 $- 2-2-2 2-2-2 $2 2-2-2 2-2 2-2 --- +
Product table:
es
| product_id | product_name |
tS taiaiatateietateieien detetetetatetenetetetetatetana
| 100     | Nokia     |
| 200      | Apple      |
| 300      | Samsung    |
ee ees
Result table:
ees
| product_name | year | price |
$o- 2-2-2 2-2-2 -$------- 42 ------+
| Nokia     | 2ee8 | 5se0ee |
| Nokia     | 2ee9 | seee |
| Apple     | 2011 | 9008 |
| eisiaiatatatatetataieiateian detatatetatenen daleiatateeen
```

**Solution**

```sql
SELECT product_name, year, price
FROM Sales JOIN Product
ON Product.product_id = Sales.product_id
```


---

## 1069. Product Sales Analysis II — Easy

Table: sales

```text
4-2-2 2-2-2222 t-------+
| Column Name | Type |
ee ees
| sale_id   | int |
| product_id | int |
| year     | int |
| quantity   | int |
| price     | int |
Sn Sef
sale_id is the primary key of this table.
product_id is a foreign key to Product table.
```

Note that the price is per unit.
Table: Product

```text
ee eee
| Column Name | Type   |
eee ens
| product_id | int    |
| product_name | varchar |
fo --- 2-2-2 2-2-2 2-2 --+
product_id is the primary key of this table.
```

Write an SQL query that reports the total quantity sold for every product id.
The query result format is in the following example:

```text
Sales table:
oe ee ee eee eer
| sale_id | product_id | year | quantity | price |
Sn ee ees
[1     | 100     | 2ee8 | 10     | seee |
| 2     | 100     | 2ee9 | 12     | 5eee |
| 7     | 200     | 2011 | 15     | 9000 |
```

Se en ee ee een
Product table:
foo nn eon p eon - eo -t
| product_id | product_name |
| 100      | Nokia      |
| 200       | Apple       |
| 300        | Samsung
ee ees
Result table:
[es es
| product_id | total_quantity |
| 100       | 22         |
| 20       | 15         |
ee

**Solution**

```sql
SELECT product_id, sum(quantity) AS total_quantity
FROM Sales
GROUP BY product_id;
```


---

## 1070. Product Sales Analysis III — Medium

Table: sales

```text
S otalaietateteteiateieteiat teetatatateter.s
| Column Name | Type |
2 oes
| sale_id   | int |
| product_id | int |
| year     | int |
| quantity    | ant
| price     | int |
2 oes
sale_id is the primary key of this table.
product_id is a foreign key to Product table.
```

Note that the price is per unit.
Table: Product

```text
en es
| Column Name | Type   |
eee.
| product_id | int
| product_name | varchar |
ns
product_id is the primary key of this table.
```

Write an SQL query that selects the product id, year, quantity, and price for the first
year of every product sold.
The query result format is in the following example:

```text
Sales table:
poses SoS pes Hose ean pe oe spe neo Sees epee ony
| sale_id | product_id | year | quantity | price |
Di nn ee eens
| 2     | 102     | 2ee8 | 10     | 5eee |
| 2     | 100     | 2ee9 | 12     | 5eee |
[7     | 200     | 2011 | 15     | 9000 |
oe ee ee eee eer
Product table:
posces ees e caspase seen sess een}
| product_id | product_name |
es
| 100      | Nokia      |
| 200      | Apple      |
| 300      | Samsung    |
foo nn eon p eon - eo -t
Result table:
Sn ee ee ee
| product_id | first_year | quantity | price |
[a
| 100     | 2008     | 10     | 5ee0 |
| 200     | 2011     | 15     | 9ee0 |
. ciaaleaieteatoniaiba sateen: tenetlintaaetetaiatel ar Setabeimiatasananaiasaetaataiate a
```

**Solution**

```sql
SELECT
product_id,
year first_year,
quantity,
price
FROM Sales
WHERE (product_id, year) IN (SELECT product_id, MIN(year)
FROM Sales
GROUP BY product_id)
```


---

## 1075. Project Employees I — Easy

Table: Project

```text
. ccatelaietiatacnaieaieiaiate: seneietaatanetaar a
| Column Name | Type   |
fo - 2-2-2 ne $e - 2-2-2 <4
| project_id | int   |
| employee_id | int   |
Satelit aiataltataialatas teieialelaatealan 2
(project_id, employee_id) is the primary key of this table.
employee_id is a foreign key to Employee table.
Table: Employee
```

```text
Cn ey
| Column Name    | Type   |
S eeeeteletiaaaatateiateteteten tote d
| employee_id    | int    |
| name              | varchar |
| experience_years | int    |
employee_id is the primary key of this table.
```

Write an SQL query that reports the average experience years of all the employees
for each project, rounded to 2 digits.
The query result format is in the following example:

```text
Project table:
Cn es
| project_id | employee_id |
0 ee eo
Ja        Ja        |
Ja       | 2       |
Ja        | 3        |
$a - 2-2-2 ote - 2-2-2 2-2 -+
Employee table:
foo 22-22-22 -- $e 2-22 2-42 - = 2-2 ==
| employee_id | name | experience_years |
Si tn es
J 4       | Khaled | 3           |
[2        | Ali   | 2           |
| 3       | John | 1          |
| 4       | Doe   [2           |
S eeieetataieetateiatet dette teen tele
Result table:
ee ers
| project_id | average_years |
(eee
ie        | 2.00       |
| 2        | 2.50       |
Ce ees
```

The average experience years for the first project is (3 + 2 +1) / 3 = 2.00 and
|

**Solution**

```sql
SELECT
p.project_id,
ROUND (AVG(e.experience_years),2) average_years
FROM
Project p JOIN Employee e ON
p.employee_id = e.employee_id
GROUP BY
p.project_id
```


---

## 1076. Project Employees II — Easy

Table: Project

```text
en ees
| Column Name | Type   |
en es
| project_id | int   |
| employee_id | int   |
en ees
(project_id, employee_id) is the primary key of this table.
employee_id is a foreign key to Employee table.
Table: Employee
```

```text
Cn ey
| Column Name    | Type   |
S eeeeteletiaaaatateiateteteten tote d
| employee_id    | int    |
| name              | varchar |
| experience_years | int    |
employee_id is the primary key of this table.
```

Write an SQL query that reports all the projects that have the most employees.
The query result format is in the following example:

```text
Project table:
fs sialelaitatstahatelaialater: setaialaialatebaiatatataat 2
| project_id | employee_id |
```

Hes cce meee s ee ntoc seer ner recat
Ja        4        |
Ja       | 3       |
[2        Ja        |
Se lalataalalatalaletalaiet ieliaeteiete tetera
Employee table:
Se en ery
| employee_id | name | experience_years |
ee es
[1       | Khaled | 3           |
| 2        | Ali   [2           |
13           | John [1
14       | Doe   | 2           |
Se en ees
Result table:
foo 2-2-2 -- ne --+
| project_id |
fone nen nnn nt
toner ene n rene nt
The first project has 3 employees while the second one has 2.
a
SELECT project_id
FROM Project
GROUP BY project_id
HAVING COUNT(employee_id) = (SELECT COUNT(employee_id)
FROM Project
GROUP BY project_id
ORDER BY COUNT(employee_id) DESC
LIMIT 1)


---

## 1077. Project Employees III — Medium

Table: Project

```text
Saeed
| Column Name | Type   |
$a --- 2-2-2 --$---------4
| project_id | int   |
| employee_id | int    |
en es
(project_id, employee_id) is the primary key of this table.
employee_id is a foreign key to Employee table.
Table: Employee
```

```text
Sn on
| Column Name    | Type   |
Cn ey
| employee_id    | int    |
| name         | varchar |
| experience_years | int    |
ees
employee_id is the primary key of this table.
```

Write an SQL query that reports the most experienced employees in each project. In
case of a tie, report all employees with the maximum number of experience years.
The query result format is in the following example:

```text
Project table:
| project_id | employee_id |
» siatedeaiettalsialtialataatets daleteiaiatateteaiatatt
Ja        | 2        |
| 2       Ja       |
Ce es
Employee table:
ees
| employee_id | name | experience_years |
S eateiatetataietatetetatet delete tele tte
i       | Khaled | 3           |
[2       Jali 2           |
| 3       | John | 3          |
| 4       | Doe   | 2           |
S eateiatelataiateiateiatel datekatetaletetah daleteiakeieetatetetabetatetataiatana
Result table:
ee
| project_id | employee_id |
ee ers
```

Both employees with id 1 and 3 have the most experience among the employees of th
OO

**Solution**

```sql
SELECT
p.project_id,
e.employee_id
FROM
Project p LEFT JOIN Employee e ON
p.employee_id = e.employee_id
WHERE (p.project_id,
e.experience_years) IN (SELECT
p.project_id,
MAX(e.experience_years)
FROM
Project p JOIN Employee e ON
p.employee_id = e.employee_id
GROUP BY
p.project_id)
```


---

## 1082. Sales Analysis I — Easy

Table: Product

```text
ee ee
| Column Name | Type   |
$a ---- 2-2-2 = - $22 = 5-H
| product_id | int    |
| product_name | varchar |
| unit_price | int    |
oo eee
product_id is the primary key of this table.
Table: Sales
```

```text
es
| Column Name | Type   |
en ees
| seller_id | int   |
| product_id | int   |
| buyer_id   | int    |
| sale_date | date   |
| quantity   | int    |
| price     | ant    |
ee ey
```

This table has no primary key, it can have repeated rows.
product_id is a foreign key to Product table.
Write an SQL query that reports the best seller by total sales price, If there is a tie,
report them all.
The query result format is in the following example:

```text
Product table:
Sie ee eg
| product_id | product_name | unit_price |
oases cece cen pe ce see sense se pece eee seco ny
| 1       | s8       | 1000     |
| 2       | G4       | 800     |
| 3       | iPhone     | 14¢e     |
ee eee |
Sales table:
Ce es
| seller_id | product_id | buyer_id | sale_date | quantity | price |
a
Ja      J 2      | 1     | 2019-01-21 | 2     | 2000 |
Ja      | 2       | 2     | 2019-02-17 | 1     | sea |
| 2      | 2       | 3     | 2e19-@6-e2 | 1     | see |
| 3      | 3       | 4     | 2¢19-@5-13 | 2     | 2808 |
```

Cs ciaeleniteatantisaiears ealemesetintasial atemaatan Zeteaetatadiatates.ssaataetaianeiatatater. sebakatane lanai Zabeaaaas
Result table:
pon n nnn nent
| seller_id
S elaleiateiateieteiateiaten aD
one n-e- enn -t
Both sellers with id 1 and 3 sold products with the most total price of 2800.

**Solution**

```sql
SELECT seller_id
FROM Sales
GROUP BY seller_id
HAVING SUM(price) = (SELECT SUM(price)
FROM Sales
GROUP BY seller_id
ORDER BY SUM(price) DESC
LIMIT 1)
```


---

## 1083. Sales Analysis II — Easy

Table: Product

```text
Sn ens
| Column Name | Type   |
Ce es
| product_id | int    |
| product_name | varchar |
| unit_price | int    |
ees
product_id is the primary key of this table.
Table: sales
```

```text
| Column Name | Type   |
Se eS
| seller_id | int   |
| product_id | int   |
| buyer_id   | int    |
| sale_date | date   |
| quantity   | int    |
| price     | int    |
i res
```

This table has no primary key, it can have repeated rows.
product_id is a foreign key to Product table.
Write an SQL query that reports the buyers who have bought S8 but not iPhone.
Note that S8 and iPhone are products present in the Product table.
The query result format is in the following example:

```text
Product table:
Se ee ees
| product_id | product_name | unit_price |
Cn ee ers
J1       | ss       | 1000     |
[2       | G4       | 800     |
| 3       | iPhone     | 1400     |
pon nnn nn nn np nnn nn en pe ene ent
Sales table:
, es
| seller_id | product_id | buyer_id | sale_date | quantity | price |
a ee ee
}1      i       Ja     | 2e19-@1-21 | 2     | 2eee |
Ja      | 2      [2     | 2019-02-17 | 1     | 800 |
| 2      J 2       | 3     | 2019-@6-02 | 1     | sea |
[3      | 3       | 3     | 2019-05-13 | 2     | 2800 |
```

Sn ee ee ee! oes
Result table:
| buyer_id   |
fon nn n-ne Ht
The buyer with id 1 bought an S8 but didn't buy an iPhone. The buyer with id 3 bo
a

**Solution**

```sql
SELECT DISTINCT s.buyer_id
FROM Sales s LEFT JOIN Product p ON
s.product_id = p.product_id
WHERE p.product_name = 'S8' AND
s.buyer_id NOT IN (SELECT s.buyer_id
FROM Sales s LEFT JOIN Product p ON
s.product_id = p.product_id
WHERE p.product_name = 'iPhone')
```


---

## 1084. Sales Analysis III — Easy

Reports the products that were only sold in spring 2019. That is, between 2019-01-
01 and 2019-03-31 inclusive. Select the product that were only sold in spring 2019.

```text
Product table:
T creieaieeiadaiaiaieiateian deteheteiatatetaieheteiateian deketeteietaeteietatenats sa
| product_id | product_name | unit_price |
ee ee
| 1       | s8       | 1000     |
| 2       | G4       | see     |
| 3       | iPhone     | 14¢0     |
Sn ee ee
Sales table:
Ce ee ee
| seller_id | product_id | buyer_id | sale_date | quantity | price |
ee ee
Ja      J2       J 2     | 2019-01-21 | 2     | 2000 |
[1      [2      | 2     | 2e19-@2-17 | 1     | see =|
| 2      | 2       | 3     | 2e19-e6-02 | 1     | sea |
| 3      13       | 4     | 2e19-@5-13 | 2     | 2808 |
, en oe es
Result table:
bsiatalana aac ace ea aaa aaa eat
| product_id | product_name |
ees
foo o-oo tee --- ot
```

The product with id 1 was only sold in spring 2019 while the other two were sold
——

**Solution**

```sql
(SELECT DISTINCT s.product_id, p.product_name
FROM Sales s LEFT JOIN Product p ON
s.product_id = p.product_id
WHERE s.sale_date >= '2019-@1-@1' AND
s.sale_date <= '2019-03-31')
EXCEPT
(SELECT DISTINCT s.product_id, p.product_name
FROM Sales s LEFT JOIN Product p ON
s.product_id = p.product_id
WHERE s.sale_date < '2019-01-@1' OR
s.sale_date > '2019-@3-31')
```


---

## 1097. Game Play Analysis V — Hard

We define the install date of a player to be the first login day of that player. We also
define day 1 retention of some date X to be the number of players whose install date
is X and they logged back in on the day right after X , divided by the number of
players whose install date is X, rounded to 2 decimal places. Write an SQL query that
reports for each install date, the number of players that installed the game on that
day and the day 1 retention. The query result format is in the following example:

```text
Activity table:
a a ald st ea
| player_id | device_id | event_date | games_played |
spon n nn en nnd pen case enna paneer anne panna t ene
J 1      | 2      | 2016-03-01 | 5        |
| 1      | 2      | 2016-03-02 | 6        |
| 2      | 3      | 2017-@6-25 | 1        |
| 3      J 2      | 2016-03-01 | @        |
[3      | 4      | 2016-07-03 | 5        |
henner rn rrr bere c crc pe ccc cscs cc csnt
Result table:
pon nn ern ee penn ee rn pen ene eet
| install_dt | installs | Day1_retention |
```

Lean tt, a ate aii 2
| 2016-@3-01 | 2     | 0.50       |
| 2017-06-25 | 1     | @.00       |
hee cern rr he nt ete een rene scat
Player 1 and 3 installed the game on 2016-03-01 but only player 1 logged back in
Player 2 installed the game on 2017 -@6-25 but didn't log back in on 2017-06-26 s
a

**Solution**

```sql
SELECT
install_dt,
COUNT(player_id) installs
ROUND (COUNT (retention) /COUNT(player_id),2) Day1_retention
FROM
(
SELECT a.player_id, a.install_dt, b.event_date retention
FROM
(SELECT player_id, MIN(event_date) install_dt
FROM Activity
GROUP BY player_id) a LEFT JOIN Activity b ON
a.player_id = b.player_id AND
a.install_dt + 1=b.event_date
) AS tmp
GROUP BY
install_dt
rae)
```


---

## 1098. Unpopular Books — Medium

Table: Books

```text
fo ------- 2-2-2 ---4---------+
| Column Name    | Type
D eateiataiataiateiateiateiateien teleteteteieteiaten a
| book_id      | int    |
| name       | varchar |
| available_from | date    |
book_id is the primary key of this table.
Table: orders
```

```text
eens
| Column Name   | Type   |
Cn ns
| order_id     | int    |
| book_id      | int    |
| quantity     | int    |
| dispatch_date | date   |
Cn eens
order_id is the primary key of this table.
book_id is a foreign key to the Books table.
```

Write an SQL query that reports the books that have sold less than 10 copies in the
last year, excluding books that have been available for less than 1 month from today.
Assume today is 2019-06-23.
The query result format is in the following example:

```text
Books table:
i ee es
| book_id | name          | available_from |
SS talatatatatatelah deletetatatahetateteteteietatatatatetaten tetetetetetatatatabaiabenatetetaas
| 1     | "Kalila And Demna" | 2010-01-01   |
| 2     | "28 Letters"     | 2012-e5-12   |
| 3     | "The Hobbit"     | 2019-@6-10   |
| 4     | "13 Reasons Why" | 2019-@6-@1    |
| 5     | "The Hunger Games" | 2008-09-21   |
i os
Orders table:
SS atatatetatetatetahen debeiatetahetateien secletetaiatatetatateh detetetetatatatataiabenatetetaras
| order_id | book_id | quantity | dispatch _date |
$----------4---------4----------4---------------+
[1       ]1      | 2       | 2018-@7-26   |
| 2       | 1      | 2       | 2018-11-05   |
13       | 3      | 8       | 2019-@6-11   |
| 4       | 4      | 6       | 2019-@6-05   |
[5       | 4      [5       | 2019-@6-20   |
| 6       [5      | 9       | 2009-e2-02   |
[2       [5      138       | 201e-e4-13   |
$----------4---------4----------4---------------+
Result table:
```

Hoenn errr rete cen ne nen ee nn eet
| book_id | name          |
fan nnn - nto - 2-2-2 ----------+
| 1      | "Kalila And Demna" |
| 2         | "28 Letters"
[5      | "The Hunger Games" |
tesceerereneberccscercscrrersseret

**Solution**

```sql
SELECT
b.book_id, b.name
FROM
Books b LEFT JOIN (
SELECT book_id, SUM(quantity) nsold
FROM Orders
WHERE dispatch_date BETWEEN '2@18-@6-23' AND '2019-@6-23'
GROUP BY book_id
yo
ON b.book_id = 0.book_id
WHERE
(o.nsold < 1@ OR o.nsold IS NULL) AND
DATEDIFF('2019-@6-23', b.available_from) > 30
=
```


---

## 1107. New Users Daily Count — Medium

Table: Traffic

```text
henner nnn renee nnn nent
| Column Name | Type   |
0 eeiatatetatetaiaiatateiaten detateieteteietaten a
| user_id     | aint    |
| activity    | enum   |
| activity_date | date   |
0 le tetatatan tate oD
```

There is no primary key for this table, it may have duplicate rows.
The activity column is an ENUM type of ('login', ‘logout', ‘jobs', ‘groups', ‘hom
—
Write an SQL query that reports for every date within at most 90 days from today,
the number of users that logged in for the first time on that date. Assume today is
2019-06-30.
The query result format is in the following example:

```text
Traffic table:
hon rr npn nn npn enn en en nt
| user_id | activity | activity_date |
hon nen nce pe cn rr rere enn t
J 4     | login   | 2019-05-01   |
{2     | homepage | 2019-05-01   |
| 1     | logout | 2019-05-01   |
| 2     | login   | 2019-06-21   |
[2     | logout | 2019-06-21   |
| 3     | login   | 2019-01-01   |
[3     | jobs    | 2019-91-01   |
| 3     | logout | 2019-01-01   |
| 4     | login   | 2019-06-21   |
| 4     | groups | 2019-06-21   |
| 4     | logout | 2019-96-21   |
[5     | login   | 2019-03-01   |
[5     | logout | 2019-03-01   |
[5     | login   | 2019-06-21   |
| 5     | logout | 2019-06-21   |
[eee
Result table:
eee
| login_date | user_count |
| 2019-05-01 | 1       |
| 2019-e6-21 | 2       |
eee ne
```

Note that we only care about dates with non zero user count.
The user with id 5 first logged in on 2019-03-01 so he's not counted on 2019-06-2
OT

**Solution**

```sql
SELECT login_date, COUNT(user_id) AS user_count
FROM (SELECT user_id, MIN(activity_date) AS login_date
FROM Traffic
WHERE activity = ‘login’
GROUP BY user_id) AS t
WHERE login_date >= DATE_ADD('2019-@6-30', INTERVAL -9@ DAY) AND login_date <= ‘2
GROUP BY login_date
SELECT login_date, COUNT(user_id) user_count
FROM
(SELECT user_id, MIN(activity_date) as login_date
FROM Traffic
WHERE activity='login'’
GROUP BY user_id) as t
WHERE DATEDIFF('2019-@6-30', login date) <= 98
GROUP BY login_date
——
```


---

## 1112. Highest Grade For Each Student — Medium

Table: Enrollments

```text
S ieleieiateieiateteiaiatetaiateh ieteteieteteiaietena
| Column Name | Type   |
O eleieiateieiateteiaiateteiaten tetateieteteiataten a
| student_id   | aint    |
| course_id    | int    |
| grade      | int    |
0 le tetatatan tate oD
(student_id, course_id) is the primary key of this table.
```

Write a SQL query to find the highest grade with its corresponding course for each
student. In case of a tie, you should find the course with the smallest courseid. The
output must be sorted by increasing studentid.
The query result format is in the following example:

```text
Enrollments table:
```

Sa aaa elle eater o
| student_id | course_id | grade |
Sl laa aa tala attain tla o
| 2       [2      [95 |
| 2       | 3      |e |
Ja      [4      | 9@ |
[2       | 2      | 99   |
| 3      [4      | 8 |
| 3       [2      | 75   |
| 3       | 3      | 82   |
Result table:
olla telat ate tatateteiatetaiatatan 2
| student_id | course_id | grade |
Sala eae tattle tattle telettetat ate oD
4      [2      | 99 |
[2       [2      [95 |
| 3       | 3      | 82 |
Sn ee ee |

**Solution**

```sql
SELECT student_id, MIN(course_id) course_id, grade
FROM Enrollments
WHERE (student_id, grade) IN
(SELECT student_id, MAX(grade)
FROM Enrollments
GROUP BY student_id)
GROUP BY student_id
ORDER BY student_id;
```


---

## 1113. Reported Posts — Easy

Table: Actions

```text
tenccn rec rnrcreterr ccs nb
| Column Name | Type   |
Se es
| user_id     | int    |
| post_id     | aint    |
| action_date | date   |
| action      | enum   |
| extra      | varchar |
S eiaieiataiataiataiateiateiehestetetateteetatetat a
```

There is no primary key for this table, it may have duplicate rows.
The action column is an ENUM type of (‘view', ‘like’, ‘reaction’, ‘comment’, ‘rep
The extra column has optional information about the action such as a reason for r
OOOO
Write an SQL query that reports the number of posts reported yesterday for each
report reason. Assume today is 2019-07-05.
The query result format is in the following example:

```text
Actions table:
. ee er
| user_id | post_id | action_date | action | extra |
Ce ee ee eg
[1     | 1     | 2019-07-01 | view | null |
J 4     J 4     | 2019-07-01 | like | null |
| 1     [1     | 2019-@7-@1 | share | null |
[2     [4     | 2019-07-04 | view | null |
| 2     | 4     | 2019-07-04 | report | spam |
[ 3     | 4     | 2019-e7-04 | view | null |
| 3     | 4     | 2019-87-04 | report | spam |
| 4     | 3     | 2019-07-02 | view | null |
| 4     | 3     | 2019-07-02 | report | spam |
[5     | 2     | 2019-07-04 | view | null |
| 5     | 2     | 2019-07-04 | report | racism |
[5     [5     | 2019-@7-04 | view | null |
| 5     [5     | 2019-07-04 | report | racism |
eles hal atatiat alatalatasatalilat, etl atta alla tale at atalatas, tala
Result table:
ee ee
| report_reason | report_count |
ee
| spam       Ja        |
| racism     | 2        |
Se eee
```

Note that we only care about report reasons with non zero number of reports.

**Solution**

```sql
SELECT extra report_reason, COUNT(DISTINCT post_id) report_count
FROM
(SELECT post_id, extra
FROM Actions
WHERE action_date = DATE_SUB('2019-@7-@5', INTERVAL 1 DAY) AND
action = 'report') AS tmp
GROUP BY extra
```


---

## 1126. Active Businesses — Medium

Table: Events

```text
ee ee
| Column Name | Type   |
Se er
| business_id | int    |
| event_type   | varchar |
| occurences   | aint    |
Se es
(business id, event_type) is the primary key of this table.
```

Each row in the table logs the info that an event of some type occured at some bu
_
Write an SQL query to find all active businesses.
An active business is a business that has more than one event type with occurences
greater than the average occurences of that event type among all businesses.
The query result format is in the following example:

```text
Events table:
ee ee
| business_id | event_type | occurences |
Ce ee
[1       | reviews   | 7       |
| 3       | reviews   | 3       |
[2       | ads      | 12      |
| 2       | ads      | 7       |
| 3       | ads      | 6       |
1       | page views | 3       |
fi       | page views | 12      |
s catelesieeatoeiatia cae: sea iaaalateianata alah aeilatiataaieteaas 2
Result table:
pon n nnn nent
| business_id |
S elaleiateiateieteiateiaten aD
```

Average for ‘reviews', ‘ads' and ‘page views’ are (7+3)/2=5, (11+7+6)/3=8, (3+12)
Business with id 1 has 7 'reviews' events (more than 5) and 11 ‘ads' events (more
|

**Solution**

```sql
SELECT business_id
FROM (SELECT a.business_id, a.event_type, a.occurences, b.event_avg
FROM Events a LEFT JOIN
(SELECT event_type, AVG(occurences) event_avg
FROM Events
GROUP BY event_type) b ON
a.event_type = b.event_type) tmp
WHERE occurences > event_avg
GROUP BY business_id
HAVING COUNT(event_type) > 1
```


---

## 1127. User Purchase Platform — Hard

Table: Spending

```text
Se ee
| Column Name | Type   |
ee ees
| user_id    | int    |
| spend_date | date   |
| platform    | enum
| amount    | int    |
pane n enn tee ---- nt
```

The table logs the spendings history of users that make purchases from an online
(user_id, spend_date, platform) is the primary key of this table.
The platform column is an ENUM type of (‘desktop', ‘mobile’).
OO
Write an SQL query to find the total number of users and the total amount spent
using mobile only, desktop only and both mobile and desktop together for each
date.
The query result format is in the following example:

```text
Spending table:
ee ee
| user_id | spend_date | platform | amount |
ee
Ja     | 2019-07-01 | mobile | 100   |
Ja     | 2019-07-01 | desktop | 100   |
| 2     | 2019-07-81 | mobile | 100   |
| 2     | 2019-07-02 | mobile | 100   |
| 3     | 2@19-@7-@1 | desktop | 100   |
| 3     | 2019-@7-@2 | desktop | 100   |
Se ne ee
Result table:
$-- 2-2-2 -----4----------4----------- = --¢--- 2-2-2 --+
| spend_date | platform | total_amount | total_users |
```

Cs ccaelesieteatoniaibasaetaliats teesintasaleteaiat sealesatanetniatanamabananata ilateiniatatetanataia a
| 2019-e7-@1 | desktop | 100       _       |
| 2019-07-01 | mobile | 100       J 2       |
| 2019-@7-@1 | both   | 200       J2       |
| 2019-e7-@2 | desktop | 100       J 1       |
| 2019-@7-02 | mobile | 100       [a       |
| 2019-@7-@2 | both    | @        |e       |
ee
On 2019-07-01, user 1 purchased using both desktop and mobile, user 2 purchased u
On 2019-07-02, user 2 purchased using mobile only, user 3 purchased using desktop
OO

**Solution**

```sql
SELECT aa.spend_date,
aa.platform,
COALESCE(bb.total_amount, @) total_amount,
COALESCE(bb.total_users,@) total_users
FROM
(SELECT DISTINCT(spend_date), a.platform
FROM Spending JOIN
(SELECT ‘desktop’ AS platform UNION
SELECT 'mobile' AS platform UNION
SELECT ‘both’ AS platform
ya
) aa
LEFT JOIN
(SELECT spend_date,
platform,
SUM(amount) total_amount,
COUNT(user_id) total_users
FROM
(SELECT spend_date,
user_id,
(CASE COUNT(DISTINCT platform)
WHEN 1 THEN platform
WHEN 2 THEN ‘both'
END) platform,
SUM(amount) amount
FROM Spending
GROUP BY spend_date, user_id
)b
GROUP BY spend_date, platform
) bb
ON aa.platform = bb.platform AND
aa.spend_date = bb.spend_date
```


---

## 1132. Reported Posts II — Medium

Table: Actions

```text
Se eo
| Column Name | Type   |
ee es
| user_id     | aint    |
| post_id     | aint    |
| action_date | date   |
| action      | enum   |
| extra      | varchar |
|
```

There is no primary key for this table, it may have duplicate rows.
The action column is an ENUM type of (‘view', ‘like’, ‘reaction’, ‘comment’, ‘rep
The extra column has optional information about the action such as a reason for r
ee
Table: Removals

```text
fan nnn nner nee ee pene nnn
| Column Name | Type   |
Se eS
| post_id     | aint    |
| remove_date | date   |
ee eee
post_id is the primary key of this table.
```

Each row in this table indicates that some post was removed as a result of being
SF
Write an SQL query to find the average for daily percentage of posts that got
removed after being reported as spam, rounded to 2 decimal places.
The query result format is in the following example:

```text
Actions table:
Ce ee es
| user_id | post_id | action_date | action | extra |
$---------$---------4-------------4--------4--------4+
[1     [1     | 2019-07-01 | view | null |
| 1     | 1     | 2019-07-01 | like | null |
[a     i     | 2019-@7-01 | share | null |
| 2     | 2     | 2019-e7-04 | view | null |
| 2     | 2     | 2019-07-04 | report | spam |
| 3     | 4     | 2019-07-04 | view | null |
| 3     | 4     | 2019-07-04 | report | spam |
| 4     | 3     | 2019-07-02 | view | null |
| 4     | 3     | 2019-@7-@2 | report | spam |
| 5     | 2     | 2019-07-03 | view | null |
| 5     | 2     | 2019-87-83 | report | racism |
[5     [5     | 2019-e7-03 | view | null |
| 5     [5     | 2019-07-83 | report | racism |
sc attiatacnaienlaneiaiaieeatel Reteieiateieiaieiaieianaiat suleteiniansiaia tamiaaneiameian
Removals table:
Se. eee
| post_id | remove_date |
foo 22-2 ote - 2-2 - oo eee et
|, 2     | 2019-27-20 |
| 3     | 2019-27-18 |
$a -- 2-2-2 -$---- 2-2-2 ----+
Result table:
thon ccr rrr scr roses crit
| average_daily_percent |
pane nn oe nee - = =e =e +
| 75.00            |
$a - +222 one --- eo ----+
```

The percentage for 2019-07-04 is 50% because only one post of two spam reported p
The percentage for 2019-07-02 is 100% because one post was reported as spam and i
The other days had no spam reports so the average is (50 + 100) / 2 = 75%
Note that the output is only one number and that we do not care about the remove
—

**Solution**

```sql
WITH t1 AS(
SELECT a.action_date, (COUNT(DISTINCT r.post_id))/(COUNT(DISTINCT a.post_id)) AS
FROM (SELECT action_date, post_id
FROM actions
WHERE extra = ‘spam’ AND action = 'report') a
LEFT JOIN
removals r
ON a.post_id = r.post_id
GROUP BY a.action_date)
SELECT ROUND(AVG(t1.result)*10@,2) AS average_daily_percent
FROM t1
——
```


---

## 1141. User Activity for the Past 30 Days I — Easy

Table: Activity

```text
ee ee
| Column Name | Type
fan anne n nn ene een pe ne enn nt
| user_id        | ant     |
| session_id    | int    |
| activity_date | date
| activity_type | enum   |
ee es
```

There is no primary key for this table, it may have duplicate rows.
The activity_type column is an ENUM of type ('‘open_session', ‘end_session', ‘scro
The table shows the user activities for a social media website.
Note that each session belongs to exactly one user.
Td
Write an SQL query to find the daily active user count for a period of 30 days ending
2019-07-27 inclusively. A user was active on some day if he/she made at least one
activity on that day.
The query result format is in the following example:

```text
Activity table:
$a - 2-2-2 --$---- 2-2-2 ---4---- 2-2-2 - $2 5-2-2 eo
| user_id | session_id | activity_date | activity_type |
pan - note oo 2 pe eo 2 pe 2 eet
[1     _       | 2019-07-22   | open_session |
| 2     J1       | 2019-27-22   | scroll_down |
| 1     | 41       | 2019-87-20   | end_session |
| 2     | 4       | 2019-97-22   | open_session |
| 2     | 4       | 2019-07-21   | send_message |
| 2     | 4       | 2019-07-21   | end_session |
| 3     | 2       | 2019-07-21   | open_session |
| 3     | 2       | 2019-07-21   | send_message |
| 3     | 2       | 2019-07-21   | end_session |
| 4     | 3       | 2019-@6-25   | open_session |
| 4     | 3       | 2019-@6-25   | end_session |
```

Pan nnn eben nnn ne pen nn ee ete ee eet
Result table:
ee eee
| day     | active_users |
foo 22-2 - $e 2-2-2 = +
| 2019-e7-2e | 2        |
| 2019-07-21 | 2        |
fo -- 22-22-22 - 4-2-2 22-22 ---4
Note that we do not care about days with zero active users.

**Solution**

```sql
SELECT activity_date AS day, COUNT(DISTINCT user_id) AS active_users
FROM activity
WHERE activity_date > '2019-@6-26' AND activity_date < '2019-@7-27'
GROUP BY activity_date
```


---

## 1142. User Activity for the Past 30 Days II — Easy

Table: activity

```text
ee ees
| Column Name | Type   |
Se ns
| user_id     | aint    |
| session_id   | int    |
| activity_date | date   |
| activity_type | enum   |
eee eet og
```

There is no primary key for this table, it may have duplicate rows.
The activity_type column is an ENUM of type ('‘open_session', ‘end_session', 'scro
The table shows the user activities for a social media website.
Note that each session belongs to exactly one user.
od
Write an SQL query to find the average number of sessions per user for a period of
30 days ending 2019-07-27 inclusively, rounded to 2 decimal places. The sessions
we want to count for a user are those with at least one activity in that time period.
The query result format is in the following example:

```text
Activity table:
$a - 2-2-2 --$------------4------ 2-2-2 = -- $22 2-H
| user_id | session_id | activity_date | activity_type |
es
[1     [1       | 2019-07-20   | open_session |
[2     |1       | 2019-07-20   | scroll_down — |
| 1     [1       | 2019-07-20   | end_session |
| 2     | 4       | 2019-97-20   | open_session |
| 2     | 4       | 2019-07-21   | send_message |
[2     | 4       | 2019-97-21   | end_session |
| 3     | 2       | 2019-07-21   | open_session |
| 3     | 2       | 2019-07-21   | send_message |
| 3     | 2       | 2019-07-21   | end_session |
| 3     [5       | 2019-07-21   | open_session |
[ 3     [ S       | 2019-07-21   | scroll_down |
| 3     [5       | 2019-07-21   | end_session |
| 4     | 3       | 2019-96-25   | open_session |
| 4     | 3       | 2019-@6-25   | end_session |
$---------4------------4---------------4---------------4+
Result table:
| average_sessions_per_user |
- aiaiatatatatetedaietetatetetebabeatetateteetalatatana
| 1.33               |
ee
```

User 1 and 2 each had 1 session in the past 3@ days while user 3 had 2 sessions s
a

**Solution**

```sql
SELECT IFNULL(ROUND(AVG(a.num),2),®) AS average_sessions_per_user
FROM (
SELECT COUNT(DISTINCT session_id) AS num
FROM activity
WHERE activity_date BETWEEN '2@19-@6-28' AND '2019-@7-27'
GROUP BY user_id) a
```


---

## 1148. Article Views I — Easy

Table: views

```text
Ce eee
| Column Name | Type   |
i ee
| article_id   | aint    |
| author_id    | int    |
| viewer_id    | ant    |
| view_date    | date   |
ee
```

There is no primary key for this table, it may have duplicate rows.
Each row of this table indicates that some viewer viewed an article (written by s
Note that equal author_id and viewer_id indicate the same person.
|
Write an SQL query to find all the authors that viewed at least one of their own
articles, sorted in ascending order by their id.
The query result format is in the following example:

```text
Views table:
Se ee Seas
| article_id | author_id | viewer_id | view_date |
ees
}1       | 3      {5      | 2019-08-01 |
| 1       | 3      | 6      | 2019-98-02 |
| 2       | 7      | 7      | 2019-e8-e1 |
| 2       |7      | 6      | 2019-@8-02 |
|4       | 7      i      | 2019-@7-22 |
[3       | 4      | 4      | 2019-07-21 |
13       | 4      | 4      | 2019-07-21 |
S siataiateialateiataielanatataietataiatatatatetanetaiaiatatatatatateteniatenatiatatameataamaa
Result table:
toner nt
fon -n nt
14 |
17 |
ton nnn ot
```

**Solution**

```sql
SELECT DISTINCT author_id AS id
FROM Views
WHERE author_id = viewer_id
ORDER BY author_id
```


---

## 1149. Article Views II — Medium

Table: views

```text
Se es
| Column Name | Type   |
fo ------- 2-2-2 -- 4-22 --- 2-4
| article_id   | int    |
| author_id    | int    |
| viewer_id     | aint
| view_date    | date   |
en Sn
```

There is no primary key for this table, it may have duplicate rows.
Each row of this table indicates that some viewer viewed an article (written by s
Note that equal author_id and viewer_id indicate the same person.
|
Write an SQL query to find all the people who viewed more than one article on the
same date, sorted in ascending order by their id.
The query result format is in the following example:

```text
Views table:
ee ers
| article_id | author_id | viewer_id | view_date |
han pe nn nn pa rn rn rn pe cnn ern ent
[2       | 3      | 5      | 2e@19-@8-01 |
| 3       | 4      | 5      | 2019-08-01 |
Ja       | 3      | 6      | 2019-08-02 |
| 2       | 7      | 7      | 2019-08-01 |
| 2       | 7      | 6      | 2019-@8-02 |
| 4       | 7      {1      | 2@19-@7-22 |
| 3       | 4      | 4      | 2019-07-21 |
| 3       | 4      | 4      | 2019-07-21 |
```

Sale leteateeatetetatatats detetatatatetatetatatat ieletatetatatetatateiats teletiettetatatetatatetat a
Result table:
Henne o nt
lid |
bec c cnt
Is]
le |
pence ent

**Solution**

```sql
SELECT DISTINCT viewer_id AS id
FROM views
GROUP BY viewer_id, view_date
HAVING count (DISTINCT article_id)>1
ORDER BY 1
```


---

## 1158. Market Analysis I — Medium

Table: users

```text
$22 --- 3-2-2 ------t---------4+
| Column Name   | Type   |
22-22 --- 2-2-2 ---4---------4+
| user_id      | int    |
| join_date    | date   |
| favorite_brand | varchar |
ee ees
user_id is the primary key of this table.
```

This table has the info of the users of an online shopping website where users ca
a
Table: orders

```text
fo 2-22-22 2-2 --- 4-22 --- 22-4
| Column Name | Type   |
```

Hann nn ene ne nen pe rennet
| order_id    | int    |
| order_date   | date   |
| item_id     | int    |
| buyer_id    | aint    |
| seller_id     | int
thocncccecsrecsetberscssrest
order_id is the primary key of this table.
item_id is a foreign key to the Items table.
buyer_id and seller_id are foreign keys to the Users table.
Table: Items

```text
2 es
| Column Name | Type   |
ee es
| item_id     | aint    |
| item_brand   | varchar |
item_id is the primary key of this table.
```

Write an SQL query to find for each user, the join date and the number of orders
they made as a buyer in 2019.
The query result format is in the following example:

```text
Users table:
en ene
| user_id | join_date | favorite_brand |
en ees
| 1     | 2018-@1-01 | Lenovo      |
| 2     | 20@18-@2-09 | Samsung     |
| 3     | 2018-e1-19 | LG         |
| 4     | 2018-05-21 | HP         |
thos scm ccctec cero merc stercr crores ok
Orders table:
```

Deities tiie ti ee ens
| order_id | order_date | item_id | buyer_id | seller_id |
hon nnn re the nn nn nr nthe nnn ne tb wn nn per nrc e nt
| 1     | 2019-e8-01 | 4     | 2     | 2      |
| 2     | 2018-e8-02 | 2     | 2     | 3      |
| 3     | 2019-08-03 | 3     | 2     | 3      |
| 4     | 2018-08-04 | 1     [4     | 2      |
[5     | 2018-08-04 | 1     | 3     | 4      |
| 6     | 2019-@8-05 | 2     | 2     | 4      |
Se ee en ee
Items table:
foo 22 oo $e eo ----- enn
| item_id | item_brand |
teccccceretererccsrecest
[4     | Samsung   |
| 2     | Lenovo    |
| 3     | Le      |
14     | HP      |
Result table:
eee
| buyer_id | join_date | orders_in_2019 |
fo - 2-2-2 ----t$---------- --$ 2-2-2 2-2 - ee --t
_      | 2018-e1-01 | 1         |
| 2      | 2018-@2-09 | 2         |
| 3      | 2@18-e1-19 | @         |
[4      | 2018-05-21 | @         |
S eleteiatetetaiataiateh delekatehateteteteteietah delekaieateteiataetatetataatana

**Solution**

```sql
SELECT user_id AS buyer_id, join_date, coalesce(a.orders_in_2019,@)
FROM users
LEFT JOIN
(
SELECT buyer_id, coalesce(count(*), @) AS orders_in_2019
FROM orders o
JOIN users u
ON u.user_id = o.buyer_id
WHERE extract('year' FROM order_date) = 2019
GROUP BY buyer_id) a
ON users.user_id = a.buyer_id
```


---

## 1159. Market Analysis II — Hard

Table: Users

Sse taal aaialialalalatalataal eat ater 2
| Column Name    | Type
fo - 2-2-2 ---------4---------+
| user_id         | int
| join_date    | date   |
| favorite_brand | varchar |
Sn ne
user_id is the primary key of this table.
This table has the info of the users of an online shopping website where users ca
a
Table: orders

```text
Se ee
| Column Name | Type   |
ee eee
| order_id    | aint    |
| order_date   | date   |
| item_id     | aint    |
| buyer_id    | aint    |
| seller_id    | int    |
pos ces cess seen aspen ences ony
order_id is the primary key of this table.
item_id is a foreign key to the Items table.
buyer_id and seller_id are foreign keys to the Users table.
Table: Items
```

```text
ee ees
| Column Name | Type   |
ie nS
| item_id     | int    |
| item_brand   | varchar |
$-- 2-2-2 --------$------- 2-4
item_id is the primary key of this table.
```

Write an SQL query to find for each user, whether the brand of the second item (by
date) they sold is their favorite brand. If a user sold less than two items, report the
answer for that user as no.
It is guaranteed that no seller sold more than one item on a day.
The query result format is in the following example:

```text
Users table:
shonsonmenmbonenesmenes hess smeomnnene se
| user_id | join_date | favorite_brand |
| 1     | 2@19-@1-01 | Lenovo      |
| 2     | 2@19-@2-09 | Samsung     |
| 3     | 2019-01-19 | LG         |
| 4     | 2@19-e5-21 | HP         |
Se en ere
Orders table:
$a - 2-22 $- 2-2 $$ op et
| order_id | order_date | item_id | buyer_id | seller_id |
DO eieiieieiaieieiaen deteieieteteiaeeetetet ete tn ern
[4     | 2019-08-01 | 4     Ja     | 2      |
| 2     | 2019-08-02 | 2     Ja     | 3      |
| 3     | 2019-28-03 | 3     | 2     | 3      |
| 4     | 2019-08-04 | 1     | 4     | 2      |
| 5     | 2019-e8-04 | 1     | 3     | 4      |
| 6     | 2019-@8-05 | 2     | 2     | 4      |
foo 2-2-2 - 4-2-2 -- 2-2 -- $= 2 $$ nt
Items table:
4-2-2 22-22-2222 nent
| item_id | item_brand |
Sn ns
ei     | Samsung   |
(2     | Lenovo    |
| 4     | HP      |
Se ns
Result table:
| seller_id | 2nd_item_fav_brand |
fo - 2-2-2 5-2-2 -------------------4+
|4      | no           |
| 2          | yes                 |
| 3      | yes           |
| 4      | no            |
```

The answer for the user with id 1 is no because they sold nothing.
The answer for the users with id 2 and 3 is yes because the brands of their secon
The answer for the user with id 4 is no because the brand of their second sold it
——— |

**Solution**

```sql
SELECT user_id AS seller_id,
IF(ISNULL(item_brand), "no", “yes") AS 2nd_item_fav_brand
FROM Users LEFT JOIN
(SELECT seller_id, item_brand
FROM Orders INNER JOIN Items
ON Orders.item_id = Items.item_id
WHERE (seller_id, order_date) IN
(SELECT seller_id, MIN(order_date) AS order_date
FROM Orders
WHERE (seller_id, order_date) NOT IN
(SELECT seller_id, MIN(order_date) FROM Orders GROUP BY seller_id)
GROUP BY seller_id)
past
ON Users.user_id = t.seller_id and favorite_brand = item_brand
WITH t1 AS(
SELECT user_id,
CASE WHEN favorite_brand = item_brand THEN "yes"
ELSE "no"
END AS 2nd_item_fav_brand
FROM users u LEFT JOIN
(SELECT o.item_id, seller_id, item_brand, RANK() OVER(PARTITION BY seller_id ORDE
FROM orders o join items i
USING (item_id)) a
ON u.user_id = a.seller_id
WHERE a.rk = 2)
SELECT u.user_id AS seller_id, COALESCE(2nd_item_fav_brand,"no") AS 2nd_item_fav_
FROM users u LEFT JOIN t1
USING(user_id)
a
```


---

## 1164. Product Price at a Given Date — Medium

Table: Products

```text
Se ns
| Column Name | Type   |
ee nen
| product_id   | int    |
| new_price    | int    |
| change_date | date   |
ele lta aati a
(product_id, change date) is the primary key of this table.
```

Each row of this table indicates that the price of some product was changed to a
——
Write an SQL query to find the prices of all products on 2019-08-16. Assume the
price of all products before any change is 10.
The query result format is in the following example:

```text
Products table:
Se ee eee
| product_id | new_price | change_date |
ees
Ja      | 20     | 2019-08-14 |
| 2      | 58     | 2019-08-14 |
{2      | 30     | 2019-@8-15 |
[2      | 35     | 2019-98-16 |
2       | 65     | 2019-08-17 |
| 3       | 28     | 2019-98-18 |
$------------4-----------4-------------4+
Result table:
| product_id | price |
Sn es
[2       | 5@ 0 |
|1       135 |
13       | 10 |
$---- 2-2-2 e222 -+
```

**Solution**

```sql
WITH t1 AS (
SELECT a.product_id, new_price
FROM(
SELECT product_id, max(change_date) AS date
FROM products
WHERE change_date<='2019-08-16'
GROUP BY product_id) a
JOIN products p
ON a.product_id = p.product_id AND a.date = p.change_date),
t2 AS (
SELECT distinct product_id
FROM products)
SELECT t2.product_id, coalesce(new_price,1@) AS price
FROM t2 LEFT JOIN t1
ON t2.product_id = t1.product_id
ORDER BY price DESC
SELECT t1.product_id AS product_id, IF(ISNULL(t2.price), 10, t2.price) AS price
FROM
(SELECT distinct product_id
FROM Products) AS t1 LEFT JOIN
(SELECT product_id, new_price AS price
FROM Products
WHERE (product_id, change date) in
(SELECT product_id, max(change_date)
FROM Products
WHERE change_date <='2019-@8-16'
GROUP BY product_id)) AS t2
ON t1.product_id = t2.product_id
```


---

## 1173. Immediate Food Delivery I — Easy

Table: Delivery

```text
Se ee 2
| Column Name            | Type   |
ee ee
| delivery_id            | int    |
| customer_id            | int    |
| order_date            | date   |
| customer_pref_delivery_date | date   |
oe
delivery_id is the primary key of this table.
```

The table holds information about food delivery to customers that make orders at
a)
If the preferred delivery date of the customer is the same as the order date then the
order is called immediate otherwise it’s called scheduled.
Write an SQL query to find the percentage of immediate orders in the table, rounded
to 2 decimal places.
The query result format is in the following example:

```text
Delivery table:
Se es
| delivery_id | customer_id | order_date | customer_pref_delivery date |
a ee es
[ 2       i       | 2019-@8-01 | 2019-e8-e2            |
| 2       [5       | 2019-08-02 | 2019-e8-0e2            |
13       J       | 2@19-@8-11 | 2019-@8-11            |
|4       [3        | 2019-@8-24 | 2019-98-26            |
| 5       | 4       | 2019-08-21 | 2019-e8-22            |
|e       | 2       | 2019-@8-11 | 2019-98-13            |
a aa a aa rat a ee rl tigate eae |
Result table:
bonne en ene nent
| immediate_percentage |
```

Hann renee ene nnn n eee
| 33.33           |
ns
The orders with delivery id 2 and 3 are immediate while the others are scheduled.
=

**Solution**

```sql
SELECT
ROUND(SUM(CASE WHEN order_date=customer_pref_delivery_date THEN 1 ELSE @ END)/cou
FROM Delivery;
SELECT
ROUND(avg(CASE WHEN order_date=customer_pref_delivery_date THEN 1 ELSE @ END)*100
FROM delivery
a
```


---
