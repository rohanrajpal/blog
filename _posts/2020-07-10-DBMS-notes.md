---
layout: post
title:  "DBMS: Interview Prep [Draft]"
toc: true
comments: true
use_math: true
categories: ["Interview"]
---

[DBMS Course](https://www.youtube.com/watch?v=xAhfQNTIeOM&list=PLx5CT0AzDJCnO9k98RsrPY9WGAXj8yeKL)

### Database & DBMS | Database Management System

Database: Collection of *related data.*
Properties:
- logically coherent relation
- some aspect of real world
- specific purpose
- any size and complexity

### Database vs Filesystem | Database Management System

1. Query ability
2. Redundancy control: permissions for each user
3. Access control: same as above?
4. Option to store persistent objects
    - program closed, variables gone
    - db gives option to store vars
5. Backup and migrate
6. Multiple user interface
7. Integrity constraints
    - have relationships between tables
8. Relationship among data
9. Flexibility
    - change the schema
10. App dev time is reduced

### Data Model | Database Management System

- logical structure
- intro. abstraction
- processed and stored

Three types

- hierachical model
    - tree like structure
    - one parent may have multiple chidlren, but the child has only one parent
    - one-many relationship
- network model
    - graph like
    - child may have multiple parents
    -many-many relationship
- relational model
    - data is in some form of table
    - relationship among tables

### Schema, Instance & Metadata | Database Management System

schema
    - description of database
    - specified during design
    - not expected to change frequently

instance
    - snapshot
    - current state of occurance

metadata
    - data about data

### Data Independence | Database Management System

schema
    - application
    - logical
    - physical

logical data independence
physical data independence

### Database Abstraction | Database Management System

1. Physical level
    - how the data is actually stored in system
    - keep it transparent
2. Logical level
    - relationship among data
3. View level
    - describe only a part of the db

### Database Architecture | Database Management System

- ODBC (Open database connector)

### ER Model | Database Management System

a real world representation of db on paper

### Entity, Entity Type, Entity Set | Database Management System

entity: object which has indp existence in the real world is called entity
entity type: table name
entity set: collection of one or more entity
attributes: columns
domain: set of permitted values

### Simple & Composite Attributes | Database Management System

composite attribute: the attribute can be divided into further smaller parts, eg: full name

### Single Valued Attributes vs Multivalued Attributes | Database Management System

pretty self explainatory lol, multi example: phone number

### Stored Attributes vs Derived Attributes | Database Management System

derived is calculated from stored

### Introduction to Join in Relational Algebra | Database Management System

Join is eq to cross product followed by selective operations

It basically combines tuples from two relations based on some condition

Join
    - inner join
        - output or result only contains the matching tuples
            - theta join
            - equi join
            - natural join
    - outer join
        - the result will contain all the tuples from one or both of the relation
            - left outer
            - right outer
            - full outer

### Inner Join | Database Management System

1. Theta join: 
    - most efficient when referential integrity contraints is maintained.
    - tuples whose joining attributes are null, do not appear in the final result
2. Equi join:
    - type of join where condition is equality
3. Natural join:
    - it is an equijoin where attributes compared are same
    - the result will not have repeating columns

### Outer Join | Database Management System

1. Left outer
2. Right outer
3. Full outer

### Division Operation in Relational Algebra | Database Management System

If all is there you use division operator

### Illustration | What will be the total number of conflicts serializable schedules? | DBMS

Conflicting operations : RR, RW, WW

## SQL

[SQL Joins](https://www.geeksforgeeks.org/sql-join-set-1-inner-left-right-and-full-joins/)
 - INNER JOIN and JOIN are same
 - left join contains everything from left
 - right join has everything from right

### Combine Two Tables

[Leetcode link](https://leetcode.com/problems/combine-two-tables/)

mistakes

 - with joins you have to use `on` and not `where`. This [answer](https://stackoverflow.com/a/354094/10114752) summarizes it well.

why is the below code incorrect?

```sql
select p.FirstName, p.LastName, a.City, a.State
from Person p, Address a 
where p.PersonId = a.PersonId;
```
the above is all the items in Person that are also in Address

question wants us to return the columns for each person in the table,whether he has an address or not


```sql
# Write your MySQL query statement below
select FirstName, LastName, City, State 
from Person left join Address 
on Person.PersonId = Address.PersonId;
```

## Second Highest Salary

```sql
# Write your MySQL query statement below
select MAX(Salary) as SecondHighestSalary
from Employee
where Salary < (Select MAX(Salary) from Employee);
```

code below is WRONG, as it does not handle the null case

```text
interesting question, share my understanding after reading some posts. Query #2 (the inner layer of #1) returns the value as empty string "" (it is still a value though empty).
NULL, on the other hand is the absence of value or undefined. This happens when the outer layer select from an empty table throws NULL
```

```sql
# Write your MySQL query statement below
select distinct Salary as SecondHighestSalary from Employee order by Salary Desc limit 1 offset 1;
```

the below case is correct
```sql
# Write your MySQL query statement below
select (select distinct Salary from Employee order by Salary Desc limit 1 offset 1) as SecondHighestSalary ;
```