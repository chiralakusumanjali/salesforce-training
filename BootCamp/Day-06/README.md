# Placement Management System

A Salesforce-based Placement Management System developed to automate and streamline the campus recruitment process. The application helps students apply for jobs, enables placement officers to manage recruitment activities, and enforces business rules using Apex Triggers and Service Classes.

---

# Project Overview

The Placement Management System manages:

- Student Registration
- Job Posting
- Job Applications
- Application Validation
- Placement Status Tracking

The system uses Apex, SOQL, Triggers, Trigger Handlers, and Service Classes to automate business logic.

---

# Objects Used

## Student__c

Stores student information.

### Fields

- Student Id
- Student Name
- Student Email
- Branch
- CGPA
- Phone

---

## Jobss__c

Stores company job details.

### Fields

- Job Name
- Job Role
- Minimum CGPA
- Last Date
- Location

---

## Application__c

Stores job applications submitted by students.

### Fields

- Application Name
- Student
- Jobss
- Application Date
- Stauts

---

# Technologies Used

- Salesforce CRM
- Apex
- SOQL
- Salesforce Triggers
- Trigger Handler Pattern
- Service Layer Pattern
- Debug Logs
- Git
- GitHub
- VS Code
- Salesforce CLI

---

# Apex Components

## Trigger

### ApplicationTrigger

Trigger Events

- Before Insert
- After Update

Purpose

- Executes automatically whenever an Application record is inserted or updated.
- Calls the Trigger Handler methods.

---

## Trigger Handler

### ApplicationTriggerHandler

Methods

### beforeInsert()

Responsible for validating applications before saving.

### afterUpdate()

Responsible for monitoring application status updates.

---

## Service Class

### ApplicationService

Contains reusable business logic.

Responsibilities

- Validate student eligibility
- Prevent duplicate applications
- Validate application deadline
- Update application status

---

# Business Rules Implemented

## 1. Student Eligibility Validation

The student's CGPA must be greater than or equal to the Job's Minimum CGPA.

Example

Student CGPA = 7.8

Job Minimum CGPA = 8.0

Result

Application is rejected.

Error Message

Student is not eligible due to insufficient CGPA.

---

## 2. Duplicate Application Validation

A student cannot apply for the same job more than once.

Example

Student

Rahul

Job

Java Developer

If Rahul already applied,

Second application is blocked.

Error Message

Student has already applied for this job.

---

## 3. Last Date Validation

Students cannot apply after the Job Last Date.

Example

Last Date

01-Aug-2026

Today's Date

05-Aug-2026

Result

Application is rejected.

Error Message

Application deadline has passed.

---

## 4. Default Status

If the Status field is empty while creating an Application,

the Trigger automatically sets

Applied

as the default status.

---

# Trigger Flow

```
User Clicks Save
        │
        ▼
Application Trigger
        │
        ▼
beforeInsert()
        │
        ▼
ApplicationService.validateApplications()
        │
        ├── Validate CGPA
        ├── Validate Deadline
        ├── Check Duplicate
        └── Set Default Status
        │
        ▼
Application Saved
```

---

# Status Update Flow

```
User Updates Application Status
        │
        ▼
Application Trigger
        │
        ▼
afterUpdate()
        │
        ▼
ApplicationTriggerHandler.afterUpdate()
        │
        ▼
Status Changed?
        │
        ▼
Generate Debug Log
```

---

# Debug Logging

The application uses

System.debug()

to verify Trigger execution.

Messages Logged

- Placement statistics updated.
- Notification sent for status : Selected
- Notification sent for status : Interview Scheduled
- Notification sent for status : Rejected
- Notification sent for status : Offer Accepted

---

# Validation Scenarios Tested

## Test Case 1

### Valid Application

Expected Result

Application saved successfully.

Status automatically becomes

Applied

---

## Test Case 2

### Low CGPA

Expected Result

Student is not eligible due to insufficient CGPA.

---

## Test Case 3

### Duplicate Application

Expected Result

Student has already applied for this job.

---

## Test Case 4

### Last Date Passed

Expected Result

Application deadline has passed.

---

## Test Case 5

### Status Updated

Applied

↓

Selected

Expected Result

Debug Log generated.

Messages

Placement statistics updated.

Notification sent for status : Selected

---

# Apex Concepts Used

- Apex Classes
- Apex Triggers
- Trigger Handler Pattern
- Service Layer Pattern
- SOQL
- Maps
- Sets
- Lists
- DML Operations
- addError()
- System.debug()

---

# Folder Structure

```
PlacementManagementSystem

│
├── README.md
│
├── force-app
│   └── main
│       └── default
│
│           ├── classes
│           │
│           ├── ApplicationService.cls
│           ├── ApplicationService.cls-meta.xml
│           │
│           ├── ApplicationTriggerHandler.cls
│           ├── ApplicationTriggerHandler.cls-meta.xml
│           │
│           ├── StudentController.cls
│           ├── JobController.cls
│           │
│           └── triggers
│               │
│               ├── ApplicationTrigger.trigger
│               └── ApplicationTrigger.trigger-meta.xml
```

---

# Future Enhancements

- Send Email Notification to Students
- Generate Offer Letter Automatically
- Update Placement Statistics Dashboard
- Schedule Interview Notifications
- Add Lightning Web Components (LWC) for Placement Portal
- Implement Reports and Dashboards
- Add Unit Test Classes with 75%+ Code Coverage

---

# Learning Outcomes

Through this project, I gained practical experience in:

- Salesforce CRM Development
- Apex Programming
- SOQL Queries
- Trigger Development
- Trigger Handler Design Pattern
- Service Layer Pattern
- Business Rule Validation
- Debug Log Analysis
- Git and GitHub Version Control

---
