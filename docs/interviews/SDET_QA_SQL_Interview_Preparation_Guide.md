# SDET / QA / SQL Interview Preparation Guide

A comprehensive interview preparation guide covering:

- SQL
- Testing Concepts
- Test Automation
- Bug Management
- SDLC/STLC
- Agile
- Framework Questions
- Behavioral Questions
- E-Commerce Testing

---

# SQL Section

---

# SQL Execution Order (Interview Favorite)

Actual SQL Logical Execution Order:

```text
FROM
WHERE
GROUP BY
HAVING
SELECT
DISTINCT
ORDER BY
LIMIT / OFFSET
```

### Memory Trick

```text
FWG-HSDOL

F → FROM
W → WHERE
G → GROUP BY
H → HAVING
S → SELECT
D → DISTINCT
O → ORDER BY
L → LIMIT
```

---

# SQL Query Template

```sql
SELECT column1, column2
FROM table_name
WHERE condition
GROUP BY column
HAVING condition
ORDER BY column
LIMIT number;
```

---

# Common SQL Interview Questions

## Fetch Employees Without Projects

```sql
SELECT e.*
FROM employees e
LEFT JOIN projects p
ON e.emp_id = p.emp_id
WHERE p.emp_id IS NULL;
```

---

## Inner Join

Returns only matching records.

```sql
SELECT *
FROM employee e
INNER JOIN department d
ON e.dept_id = d.id;
```

---

## Left Join

Returns all records from left table.

```sql
SELECT *
FROM employee e
LEFT JOIN department d
ON e.dept_id = d.id;
```

---

## Right Join

Returns all records from right table.

```sql
SELECT *
FROM employee e
RIGHT JOIN department d
ON e.dept_id = d.id;
```

---

# Pick Random Record

MySQL

```sql
SELECT *
FROM employees
ORDER BY RAND()
LIMIT 1;
```

---

# Salary Greater Than 50000

```sql
SELECT *
FROM employees
WHERE salary > 50000;
```

---

# Employees in IT Department

```sql
SELECT *
FROM employees
WHERE department = 'IT';
```

---

# Top 3 Highest Paid Employees

```sql
SELECT *
FROM employees
ORDER BY salary DESC
LIMIT 3;
```

---

# Names Starting With A

```sql
SELECT *
FROM employees
WHERE name LIKE 'A%';
```

---

# Employees Hired in 2022

```sql
SELECT *
FROM employees
WHERE YEAR(hire_date)=2022;
```

---

# Count Employees Per Department

```sql
SELECT department,
COUNT(*) AS total_employees
FROM employee*
GROUP BY department;
```

---

# *verage Salary in Finance

```sql
S*LECT AVG(salary)
FROM employees
WH*RE department='Finance';
```

---
*# Duplicate Employee Names

```sql*SELECT name,
COUNT(*)
FROM employe*s
GROUP BY name
HAVING COUNT(*) > *;
```

---

# Second Highest Salar*

```sql
SELECT DISTINCT salary
FR*M employees
ORDER BY salary DESC
L*MIT 1 OFFSET 1;
```

---

# Employ*es With Same Manager

```sql
SELEC* e1.name,
e2.name
FROM employees e*
JOIN employees e2
ON e1.manager_i* = e2.manager_id
AND e1.emp_id <> *2.emp_id;
```

---

# Update Salar* By 10%

```sql
UPDATE employees
S*T salary = salary * 1.10;
```

---*
# Delete Employees Salary Below 2*000

```sql
DELETE FROM employees
*HERE salary < 20000;
```

---

# I*sert Employee

```sql
INSERT INTO *mployees
(id,name,salary)
VALUES
(*01,'Neeshu',70000);
```

---

# Gr*up Employees By Department And Sor*

```sql
SELECT department,
SUM(sa*ary) total_salary
FROM employees
G*OUP BY department
ORDER BY total_s*lary DESC;
```

---

# Testing Con*epts

---

# Types of Testing

## *unctional Testing

- Smoke Testing*- Sanity Testing
- Regression Test*ng
- Retesting
- Integration Testi*g
- System Testing
- UAT

---

## *on-Functional Testing

- Performan*e Testing
- Load Testing
- Stress *esting
- Security Testing
- Usabil*ty Testing
- Compatibility Testing*
---

# Regression Testing

### Wh*n Performed?

- Every build
- Ever* release
- Before UAT
- After bug *ixes

---

# Severity vs Priority
*## Severity

Impact of bug.

Examp*e:

```text
Application crash
```
*Severity:

```text
Critical
```

-*-

## Priority

Urgency of fixing.*
Example:

```text
Spelling mistak* on homepage
```

Priority:

```te*t
High
```

if client facing.

---*
# Bug vs Defect

## Bug

Found du*ing testing.

## Defect

Deviation*from requirements.

Practically bo*h terms used interchangeably.

---*
# Defect Life Cycle

```text
New
*
Assigned
↓
Open
↓
Fixed
↓
Retest
*
Verified
↓
Closed
```

Other Stat*s:

```text
Rejected
Duplicate
Def*rred
Cannot Reproduce
```

---

# *ug Logging Fields

Required Inform*tion:

- Bug ID
- Title
- Summary
* Environment
- Build Version
- Mod*le
- Steps To Reproduce
- Expected*Result
- Actual Result
- Severity
* Priority
- Attachments
- Reporter*- Assignee
- Status

---

# Test P*an

## What Is Test Plan?

A docum*nt defining scope, strategy, resou*ces and schedule.

### Contents

-*Objective
- Scope
- Features To Te*t
- Features Not To Test
- Test St*ategy
- Environment
- Resources
- *isks
- Schedule
- Deliverables
- E*try Criteria
- Exit Criteria

---
*# SDLC Phases

```text
Requirement*Gathering
↓
Analysis
↓
Design
↓
De*elopment
↓
Testing
↓
Deployment
↓
*aintenance
```

---

# Agile vs Wa*erfall

| Agile | Waterfall |
|---*-----|---------|
| Iterative | Seq*ential |
| Flexible | Fixed |
| Fr*quent Releases | One Major Release*|
| Customer Feedback Frequent | L*ss Frequent |
| Faster Testing | T*sting at End |

---

# Automation*Interview*Questions

---

# Explain Your Aut*mation Framework

Typical Componen*s:

```text
Test Scripts
POM
Utili*ies
Config Files
Test Data
Reporti*g
Logs
CI/CD
Listeners
```

For Pl*ywright Python:

```text
tests/
pa*es/
utils/
api/
config/
reports/
t*st_data/
```

---

# Framework Cha*lenges

Examples:

### Test Data D*pendency

Solution:

```text
Dynam*c Data Generation
```

### Flaky T*sts

Solution:

```text
Explicit W*its
Retry Logic
Stable Locators
``*

### Environment Differences

Sol*tion:

```text
Environment Configu*ation Management
```

---

# How D* You Prioritize Automation?

Autom*te First:

✅ Critical Business Flo*s

✅ Regression Tests

✅ High Repe*ition Tests

✅ Stable Features

✅ *ata Driven Tests

---

# How Do Yo* Prioritize Test Cases?

### P1

R*venue Impact

### P2

Major Functi*nalities

### P3

Minor Features

*--

# How Do You Ensure Test Cases*Are Complete?

- Requirement Revie*
- User Stories
- Acceptance Crite*ia
- Boundary Value Analysis
- Equ*valence Partitioning
- Peer Review*- Traceability Matrix

---

# Miss*ng Requirements

Approach:

```tex*
Discuss with PO
BA
Developer
Stak*holders
```

Document assumptions.*
---

# Random Test Failures

Chec*:

- Environment
- Test Data
- API*Failures
- Timing Issues
- Network*- Application Logs

---

# Securit* Testing

Verify:

- Authenticatio*
- Authorization
- Session Managem*nt
- SQL Injection
- XSS
- CSRF
- *ensitive Data Exposure

---

# Con*lict With Developers

Approach:

-*Use Facts
- Show Evidence
- Share *ogs
- Reproduce Together
- Focus O* Product Quality

---

# E-Commerc* Testing

---

# Functional Areas *o Test

### Login

- Valid Login
-*Invalid Login

### Search

- Searc* Product
- Filters

### Cart

- Ad* To Cart
- Remove Item

### Checko*t

- Address
- Shipping
- Payment
*### Orders

- Order Creation
- Ord*r Cancellation

### Coupons

- Val*d Coupons
- Invalid Coupons

---

* Top 5 Coupon Test Cases

### TC01*
Valid Coupon Applied

### TC02

E*pired Coupon

### TC03

Coupon Alr*ady Used

### TC*4*
Minimum Amount Validation

*## TC05

Invalid Coupon Code

---
*# Excel Read Write

Python

```pyt*on
import openpyxl

wb = openpyxl.*oad_workbook("data.xlsx")

sheet =*wb.active

value = sheet['A1'].val*e

sheet['B1'] = 'PASS'

wb.save("*ata.xlsx")
```

---

# API & Broke* Link Validation

Validate:

- Res*onse Code

```text
200
301
302
404*500
```

For 20+ Links:

```python*requests.get(url)
```

Verify resp*nse status.

---

# Behavioral Que*tions

---

# Introduce Yourself

*nclude:

- Total Experience
- Auto*ation Skills
- Current Project
- T*ch Stack
- Major Achievements

---*
# Challenging Project

Structure:*
```text
Situation
Task
Action
Res*lt
```

(STAR Method)

---

# When*Do You Stop Testing?

Exit Criteri*:

- Critical Bugs Closed
- Test C*verage Achieved
- Regression Passe*
- Risk Accepted

---

# Current P*oject Components

Example:

```tex*
Frontend
Backend APIs
Database
Au*hentication Service
Cloud Infrastr*cture
CI/CD
Monitoring
```

*--

# Java Concepts (Interview*Theory)

## What Is Delegate?

* delegate is an object that forwar*s method calls to another object.
*Common Use Cases:

- Event Handlin*
- Listeners
- Callback Mechanisms*
---

# Multiple Inheritance

Java*

```java
interface A {}
interface*B {}

class C implements A,B {}
``*

---

# Object Creation Ways

1. *ew Keyword
2. Reflection
3. clone(*
4. Deserialization

---

# Can Co*structor Be Static?

```text
No
``*

Constructors belong to objects.
*Static belongs to class.

---

# W*at Happens Without Main Method?

M*dern Java:

Compiles successfully.*
Execution fails because JVM canno* find entry point.

---

# Jackson*JSON to Object

```java
ObjectMapp*r mapper =
new ObjectMapper();

Em*loyee emp =
mapper.readValue(
json*
Employee.class
);
```

---

# Int*rview Super Cheat Sheet

```text
H*ghest       → ORDER BY DESC
Second*       → LIMIT + OFFSET
Unique    *   → DISTINCT
Each          → GROU* BY
Missing       → LEFT JOIN + NU*L
Duplicate     → GROUP BY HAVING *OUNT(*)>1
Total         → SUM
Aver*ge       → AVG
Number Of     → COU*T
```

---

# Final Revision Topic*

✅ SQL

✅ Joins

✅ Group By

✅ Ha*ing

✅ SDLC

✅ STLC

✅ Agile

✅ De*ect Life Cycle

✅ Severity vs Prio*ity

✅ Automation Framework

✅ Sec*rity Testing

✅ API Testing

✅ E-C*mmerce Testing

✅ Bug Logging

✅ T*st Plan

✅ Regression Testing

✅ B*havioral Questions

✅ Excel Handli*g

✅ CI/CD

✅ Playwright

✅ Seleni*m

✅ Java Basics

✅ OOPs

✅ Collec*ions

✅ Exception Handling