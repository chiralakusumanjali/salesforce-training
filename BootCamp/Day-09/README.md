# Placement Management System

## Eligible Jobs and Job Application Module

---

## 1. Project Overview

The **Placement Management System** is a Salesforce-based application designed to support and manage the college placement process.

The system provides a platform for students to view available placement opportunities and interact with job postings.

The **Eligible Jobs** module is responsible for displaying available jobs to students and providing the ability to:

- View available jobs.
- View job information.
- View eligibility requirements.
- View complete job details.
- Close the job details view.
- Apply for a job.
- Submit an application through Apex.
- Display application success or error messages.
- Provide a responsive and user-friendly interface.

The implementation uses:

- Salesforce Custom Objects
- Apex
- SOQL
- Lightning Web Components
- HTML
- JavaScript
- CSS
- Salesforce CLI
- Git and GitHub

---

# 2. Today's Task

## Task Name

**Eligible Jobs LWC and Job Application Integration**

---

## Task Objective

The objective of this task is to create an **Eligible Jobs Lightning Web Component** for the Placement Portal.

The component retrieves job records from the `Jobss__c` Salesforce object and displays them as job cards.

Each job card provides important information about the job and allows the student to:

1. View job details.
2. Apply for the job.

The application process communicates with Apex and creates an application record in Salesforce.

---

# 3. Features Implemented

The following features are part of today's task:

- Job list retrieval.
- Job cards.
- Side-by-side job card layout.
- Job information display.
- Eligibility information display.
- View Details functionality.
- Close Details functionality.
- Apply functionality.
- Student Id passing.
- Job Id passing.
- Apex integration.
- Application processing.
- Success toast notification.
- Error toast notification.
- Processing/loading state.
- CSS styling.
- Salesforce CLI deployment.
- Git version control.

---

# 4. Technology Stack

| Technology | Purpose |
|---|---|
| Salesforce | Application platform |
| Apex | Server-side business logic |
| SOQL | Query Salesforce records |
| Lightning Web Components | User interface |
| HTML | UI structure |
| JavaScript | Component logic |
| CSS | UI styling |
| Lightning Base Components | Buttons, spinner, toast, etc. |
| Salesforce CLI | Deployment |
| Git | Version control |
| GitHub | Source-code repository |

---

# 5. Salesforce Data Model

The module uses the following Salesforce objects.

---

## 5.1 Jobss__c

The `Jobss__c` object stores job opportunities available through the placement system.

### Fields Used

| Field API Name | Description |
|---|---|
| `Name` | Job/company record name |
| `Job_Role__c` | Role offered for the job |
| `Eligible_Branch__c` | Branches eligible for the job |
| `Minimum_CGPA__c` | Minimum CGPA required |
| `Maximum_Backlogs__c` | Maximum backlogs allowed |
| `Location__c` | Job location |
| `Last_Date__c` | Last date to apply |

---

## 5.2 Example Job Record

Example:

```text
Job Name:
Java Developer

Job Role:
Software Developer

Eligible Branch:
CSE, IT

Minimum CGPA:
7.5

Maximum Backlogs:
0

Location:
Hyderabad

Last Date:
15-Aug-2026
