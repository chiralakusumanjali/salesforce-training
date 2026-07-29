# Salesforce Interview Readiness Bootcamp – Day 2
## Apex Triggers & Governor Limits

### Objective
The objective of this assignment is to understand the fundamentals of Apex Triggers and how they are used to implement business logic in Salesforce. This project also focuses on Governor Limits, Bulkification, SOQL, Trigger Handler Pattern, and implementing real-world business requirements while following Salesforce best practices.

---

## Business Scenario
A college Placement Cell wants to automate the student job application process.

Whenever a student applies for a job, the system should automatically validate the application before saving it.

The application should:
- Prevents duplicate job applications.
- Validate whether the student's CGPA satisfies the minimum CGPA required by the company
- Prevent students from applying after the last application date.
- Automatically sets the application status to **Applied**.
- Displays meaningful error messages when validation fails.


This automation helps maintain accurate placement records and eliminates manual verification.

---

## Technologies Used

- Salesforce Apex 
- Apex Triggers
- SOQL
- Trigger Handler Pattern
- Lists, Sets, and Maps
- Salesforce Developer Org
- Git & GitHub

---

## Project Components
Student Object:
The Student object stores student details required for placement activities.
Fields:
- Name
- CGPA_c
- Branch_c
- Email_c
- Phone_c

### Jobs Object

The **Jobs** object stores company job openings.

**Fields:**

- Name
- Minimum_CGPA__c
- Last_Date__c
- Job_Role__c
- Location__c  
### Job Application Object

The **Job Application** object stores student applications for jobs.

**Fields:**

- Student__c
- Job__c
- Application_Date__c
- Status__c

---
## Trigger Information

### Trigger Name

**ApplicationTrigger**

### Trigger Event

**Before Insert**

### Purpose

The trigger executes automatically before a new **Application** record is inserted into the database. It performs all required business validations before the record is saved and ensures that only valid applications are inserted.

### Validations Performed

- Prevents duplicate job applications by the same student for the same job.
- Validates that the student's CGPA meets or exceeds the company's minimum CGPA requirement.
- Prevents applications submitted after the job's last application date.
- Automatically sets the application status to **Applied** for valid records.
- Displays meaningful error messages when any validation fails.
---
## Trigger Handler

### Handler Class

**ApplicationTriggerHandler**

### Responsibilities

The **ApplicationTriggerHandler** class contains all the business logic for validating job applications. It keeps the trigger lightweight and follows Salesforce best practices by implementing the Trigger Handler Pattern.

**Responsibilities:**

- Collect all Student IDs from the incoming application records.
- Collect all Job IDs from the incoming application records.
- Query the related Student records in a single SOQL query.
- Query the related Job records in a single SOQL query.
- Check for duplicate job applications.
- Validate whether the student's CGPA meets the company's minimum CGPA requirement.
- Validate whether the application is submitted before the job's last application date.
- Automatically assign the application status as **Applied** for valid records.
---

## Bulkification

The trigger is written using Salesforce best practices.

- SOQL queries are written outside loops.
- No DML statements are used inside loops.
- Sets are used to collect unique Student and Job IDs.
- Maps are used for efficient record lookup.
- Lists are used to store queried records.
- The trigger can process multiple records in a single transaction without exceeding Governor Limits.

---
## Test Scenarios

### Test Scenario 1: Successful Application

#### Objective

Verify that a student can successfully apply for a job when all conditions are satisfied.
#### Expected Result
- The Application record is created successfully.
- The Application Status is automatically set to **Applied**.
- No validation errors are displayed.

  <img <img width="1917" height="972" alt="Screenshot 2026-07-29 165008" src="https://github.com/user-attachments/assets/38e1344b-1452-4314-b959-b364f89fd92e" />
" />
###  Duplicate Application
#### Objective

Verify that a student cannot apply for the same job more than once.

####  Result
- The Application record is **not** created.
- The following validation error message is displayed:

> **Student has already applied for this job.**

<img <img width="1917" height="982" alt="Screenshot 2026-07-29 165222" src="https://github.com/user-attachments/assets/641767e1-0db2-47de-8c7f-c4e792661fa0" />
 " />
---
### Test Scenario 3: Low CGPA Validation

#### Objective

Verify that students who do not meet the minimum CGPA requirement cannot apply for a job.
#### Expected Result

- The Application record is **not** created.
- The following validation error message is displayed:

> **Student CGPA is below the minimum requirement.**

<img <img width="1913" height="973" alt="Screenshot 2026-07-29 164702" src="https://github.com/user-attachments/assets/557df086-ea14-4ab8-a552-41fb6df2897a" />
" />
---
### Test Scenario 4: Last Date Validation

#### Objective

Verify that applications cannot be submitted after the last application date.

#### Result

- The Application record is **not** created.
- The following validation error message is displayed:

> **Application deadline has passed.**

 <img<img width="1917" height="978" alt="Screenshot 2026-07-29 165328" src="https://github.com/user-attachments/assets/44bf8eb6-b1b7-44db-8816-8603eb15e4eb" />
" />
---

# README Questions
## Why I Chose an Apex Trigger

I chose an **Apex Trigger** because the required validations must execute automatically whenever a new **Application** record is created. Using a trigger ensures that every application follows the same business rules without requiring manual intervention. This helps maintain data consistency, improves automation, and ensures that invalid records are prevented from being saved.

---

## Why I Used a Before Insert Trigger

A **Before Insert Trigger** allows validations to be performed before a record is saved to the database.

I selected a Before Insert Trigger because:

- It validates records before they are inserted into the database.
- It allows the **Status** field to be assigned without performing an additional DML operation.
- Invalid records can be prevented from being saved using the `addError()` method.
- It provides better performance by avoiding unnecessary database updates.

---

## How I Bulkified My Code

To make the trigger scalable and efficient, I followed Salesforce **Bulkification** best practices.

The implementation includes:

- Using **Sets** to collect unique Student IDs and Job IDs.
- Querying related Student and Job records only once using SOQL.
- Storing queried records in **Maps** for fast and efficient lookup.
- Avoiding SOQL queries inside loops.
- Avoiding DML operations inside loops.
- Processing multiple Application records within a single transaction.

This approach ensures that the trigger works efficiently for both single-record and bulk-record operations while staying within Salesforce Governor Limits.

---

## Learning Outcomes

From this assignment, I learned:

- How Apex Triggers work in Salesforce.
- The difference between **Before** and **After** Triggers.
- How Trigger Context Variables such as `Trigger.new` are used.
- Why Salesforce Governor Limits are important.
- How to write Bulkified Apex code.
- How Lists, Sets, and Maps improve application performance.
- Why SOQL and DML statements should never be written inside loops.
- How to implement real-world business logic using Apex.
- How the Trigger Handler Pattern improves code readability and maintainability.
- How to manually test trigger functionality using different business scenarios.

---

## Conclusion

This assignment provided practical experience in implementing a real-world **Placement Cell Management** scenario using Apex Triggers. It strengthened my understanding of Trigger execution, SOQL, Bulkification, Governor Limits, collections, and Salesforce best practices. The project also improved my confidence in developing scalable, efficient, and maintainable Salesforce applications by following industry-standard development practices.

