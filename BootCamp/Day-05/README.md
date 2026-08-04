# 🚀 Salesforce Training – Day 5

# Placement Management System – Apex Service Layer

## 📌 Project Overview

This project demonstrates the implementation of business logic in Salesforce using Apex. A dedicated service class named **ApplicationService** manages the complete student job application process while ensuring all business rules are validated before creating records.

The service prevents duplicate applications, verifies student eligibility based on CGPA, creates application records, and returns meaningful success or error messages.

---

# 🎯 Learning Objectives

After completing this assignment, I learned how to:

- Build reusable Apex Service Classes
- Separate business logic from the UI
- Use SOQL to retrieve Salesforce records
- Perform DML operations
- Validate business rules before inserting records
- Handle exceptions using try-catch blocks
- Develop maintainable Apex code following best practices

---

# 🛠 Objects Used

## Student

| Field | API Name |
|--------|----------|
| Student Name | Name |
| Student ID | Student_Id__c |
| Student Email | Student_Email__c |
| Phone | Phone__c |
| Branch | Branch__c |
| CGPA | CGPA__c |
| Year | Year__c |

---

## Jobss

| Field | API Name |
|--------|----------|
| Job Name | Name |
| Job Role | Job_Role__c |
| Location | Location__c |
| Minimum CGPA | Minimum_CGPA__c |
| Last Date | Last_Date__c |

---

## Application

| Field | API Name |
|--------|----------|
| Application Name | Name |
| Student | Student__c |
| Job | Jobss__c |
| Application Date | Application_Date__c |
| Status | Stauts__c |

---

# 🛠 Features Implemented

## 📥 Student Job Application

Created an Apex Service Class named **ApplicationService**.

Implemented the method:

```apex
submitApplication(Id studentId, Id jobId)
```

The method accepts a Student record Id and a Job record Id.

---

## 🚫 Duplicate Application Validation

Before creating a new application, the service checks whether the student has already applied for the selected job.

**If duplicate exists**

❌ Application is rejected.

**Otherwise**

✅ Continue processing.

---

## 🎓 CGPA Eligibility Validation

The service compares:

- Student CGPA
- Job Minimum CGPA

If the student's CGPA is below the required minimum, the application is rejected.

---

## 💾 Application Creation

If all validations are successful,

- Create Application record
- Assign Student
- Assign Job
- Set Application Date
- Insert record into Salesforce

---

## ⚠ Exception Handling

The insert operation is enclosed inside a try-catch block.

Any DML errors are captured and returned as user-friendly messages.

---

# 🔄 Business Workflow

```
Student Applies
       │
       ▼
Check Duplicate Application
       │
       ▼
Validate Student CGPA
       │
       ▼
Create Application Record
       │
       ▼
Insert into Salesforce
       │
       ▼
Return Success/Error Message
```

---

# 📋 Business Rules

✔ A student can apply only once for the same job.

✔ Student CGPA must satisfy the minimum CGPA requirement.

✔ Application Date is automatically assigned.

✔ Application is created only after successful validation.

✔ Appropriate success or failure messages are returned.

---
## 4️⃣ Output 

<img width="1116" height="191" alt="Screenshot 2026-08-04 104300" src="https://github.com/user-attachments/assets/186d927a-e6fd-4360-884c-75aa427b7b00" />

---

# 📂 Project Structure

```
force-app
└── main
    └── default
        └── classes
            ├── ApplicationService.cls
            └── ApplicationService.cls-meta.xml
```

---

# 🧠 Apex Concepts Covered

- Apex Classes
- Static Methods
- SOQL
- DML Operations
- Lists
- Conditional Statements
- Exception Handling
- Service Layer Design
- Business Logic Validation

---

# 🛠 Technologies Used

| Technology | Purpose |
|------------|---------|
| Salesforce Platform | CRM Development |
| Apex | Business Logic |
| SOQL | Data Retrieval |
| DML | Record Operations |
| VS Code | Development |
| Salesforce CLI | Deployment |
| Developer Console | Testing |

---

# 📖 Key Takeaways

This assignment helped me understand how enterprise Salesforce applications separate business logic into reusable service classes rather than embedding it in triggers or the user interface.

I gained practical experience in:

- Designing reusable Apex services
- Querying Salesforce records with SOQL
- Validating business requirements
- Preventing duplicate records
- Performing DML operations
- Handling exceptions effectively
- Writing clean, modular, and maintainable Apex code

---

# 🎯 Outcome

Successfully developed an **Application Service Layer** for a Placement Management System that validates duplicate applications, verifies CGPA eligibility, creates application records, and handles exceptions efficiently.

This project strengthened my understanding of Apex programming, SOQL, DML operations, and Salesforce service-layer architecture.
