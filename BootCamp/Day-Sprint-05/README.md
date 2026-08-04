# Placement Management System – Sprint 5

## Project Overview

This sprint focuses on building the core business transaction for a Placement Management System using Apex, SOQL, and DML in Salesforce.

The application retrieves business information, validates eligibility, prevents duplicate applications, creates application records, and updates application status.

---

## Objectives

- Retrieve Student information using SOQL.
- Retrieve Job information using SOQL.
- Prevent duplicate job applications.
- Validate student eligibility based on CGPA.
- Validate application deadline.
- Create Application records using DML.
- Update Application status.

---

## Business Flow

```text
Receive Request
        ↓
Retrieve Student
        ↓
Retrieve Job
        ↓
Check Duplicate Application
        ↓
Validate Application Deadline
        ↓
Validate Eligibility (CGPA)
        ↓
Create Application
        ↓
Save Record
        ↓
Display Confirmation
```

---

## Objects Used

### Student__c

Fields Used

- Name
- CGPA__c
- Branch__c

### Jobss__c

Fields Used

- Name
- Minimum_CGPA__c
- Last_Date__c

### Application__c

Fields Used

- Student__c
- Jobss__c
- Stauts__c
- Application_Date__c

---

## Apex Features Implemented

### submitApplication()

Performs the following operations:

- Retrieves Student record.
- Retrieves Job record.
- Checks duplicate applications.
- Validates application deadline.
- Validates minimum CGPA.
- Creates Application record.
- Saves record using DML.
- Returns confirmation message.

---

### updateApplicationStatus()

Performs the following operations:

- Retrieves existing Application.
- Updates Application Status.
- Saves changes using DML.
- Returns confirmation message.

---

## SOQL Used

Retrieve Student

```apex
SELECT Id,
       Name,
       CGPA__c,
       Branch__c
FROM Student__c
WHERE Id = :studentId
```

Retrieve Job

```apex
SELECT Id,
       Name,
       Minimum_CGPA__c,
       Last_Date__c
FROM Jobss__c
WHERE Id = :jobssId
```

Check Duplicate Application

```apex
SELECT Id
FROM Application__c
WHERE Student__c = :studentId
AND Jobss__c = :jobssId
```

---

## DML Operations

Insert Application

```apex
insert application;
```

Update Application Status

```apex
update application;
```

---

## Business Validations

The application validates:

- Duplicate Application
- Application Deadline
- Minimum CGPA

If any validation fails, processing stops and an appropriate message is returned.

---

## Expected Outcomes

- First application is accepted.
- Duplicate applications are rejected.
- Applications submitted after the deadline are rejected.
- Students with insufficient CGPA are rejected.
- Eligible students can successfully apply.
- Recruiters can update application status.

---

## Engineering Principles Learned

- Retrieve only the information required.
- Every SOQL query should answer one business question.
- Perform business validations before DML.
- Prevent duplicate records before saving data.
- Keep business logic clear and maintainable.

---

## Technologies Used

- Salesforce Platform
- Apex
- SOQL
- DML
- Visual Studio Code
- Salesforce CLI

---

## Sprint Summary

During this sprint:

- Implemented SOQL queries for business data retrieval.
- Applied business validations before database operations.
- Used DML to create and update records.
- Built a complete business transaction following enterprise software practices.

---
## Conclusion

The Placement Management System successfully implements the complete business transaction described in Sprint 5 using Apex, SOQL, and DML. The application retrieves Student and Job information, validates business rules such as duplicate applications, application deadlines, and minimum CGPA, and creates Application records only after all validations are successfully completed. It also supports updating the application status using DML.

Through this sprint, the project demonstrates the importance of retrieving accurate information before making business decisions and performing database operations only after all business validations have passed. This implementation follows the engineering workflow introduced in Sprint 5 and provides a structured, maintainable approach to managing placement applications in Salesforce.
