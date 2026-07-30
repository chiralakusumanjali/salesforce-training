# Salesforce Placement Cell Automation - Day 3 Assignment

## Overview

This project demonstrates the automation of a Placement Cell application using Salesforce Flows, Apex Triggers, and Validation Rules by following the **Clicks Before Code** approach.

The solution automates the application process, enforces business rules, and maintains data integrity.

---

# Objects Used

## Student__c

- Name
- CGPA__c

## Job__c

- Name
- Minimum_CGPA__c
- Last_Date__c

## Application__c

- Student__c (Lookup)
- Job__c (Lookup)
- Application_Date__c
- Status__c

---

# Relationships

- Student__c → Application__c (Lookup)
- Job__c → Application__c (Lookup)

---

# Requirements Implemented

| Requirement | Solution |
|------------|----------|
| Automatically populate Application Date | ✅ Before Save Record-Triggered Flow |
| Send confirmation email | ✅ After Save Record-Triggered Flow |
| Display success message | ❌ Not possible using Record-Triggered Flow |
| Prevent duplicate applications | ✅ Apex Trigger |
| Reject students with low CGPA | ✅ Apex Trigger |
| Validate Job Closing Date | ✅ Apex Trigger |
| Mandatory fields | ✅ Required Fields / Validation Rule |

---

# Flow Implementation

## Before Save Record-Triggered Flow

Implemented to:

- Automatically populate Application Date.

### Flow

Application Created

↓

Application Date = Today()

---

## After Save Record-Triggered Flow

Implemented to:

- Send confirmation email to Placement Officer.

### Flow

Application Created

↓

Send Email Action

---

# Success Message Requirement

## Requirement

Display a success message after completion.

## Status

Not Implemented.

## Reason

Record-Triggered Flows run in the background without any user interface.

They **cannot display a success message** after execution.

To display a confirmation message such as:

> "Application Submitted Successfully"

a **Screen Flow** is required because only Screen Flows support Screen elements.

---

# Apex Trigger Implementation

The following requirements were implemented using Apex Trigger.

## Duplicate Application

Checks whether the same student has already applied for the selected job.

If yes,

Application is rejected.

---

## CGPA Validation

Compares

Student CGPA

with

Job Minimum CGPA

If Student CGPA is lower,

Application is rejected.

---

## Closing Date Validation

Checks whether

Application Date

is later than

Job Closing Date.

If yes,

Application is rejected.

---

# Validation Rules

Only simple field validations were suitable for Validation Rules.

## Mandatory Fields

Formula

```text
OR(
ISBLANK(Student__c),
ISBLANK(Job__c)
)
```

Error Message

```
Student and Job fields are mandatory.
```

---

## Validation Rule Limitation

The following validations could not be implemented using Validation Rules because of the current object relationships.

- Student CGPA vs Job Minimum CGPA
- Duplicate Applications
- Application Date vs Job Closing Date

These validations require querying related records and comparing values across lookup objects, so Apex Trigger was used.

---

# Screenshots

## Flow Canvas
<img width="1917" height="983" alt="Screenshot 2026-07-30 152841" src="https://github.com/user-attachments/assets/ac631021-64b4-4cfd-a345-392c76c08b11" />


---

## Application Date Auto Population

<img width="1917" height="983" alt="Screenshot 2026-07-30 152841" src="https://github.com/user-attachments/assets/0e6e9eca-0dd4-4a3e-b193-27f6eb8cb731" />


---

## Send Email Flow

<img width="1917" height="977" alt="Screenshot 2026-07-30 153810" src="https://github.com/user-attachments/assets/51af974c-31a9-498e-b507-e98ed5065d19" />


---

## Validation Rule
<img width="1913" height="973" alt="Screenshot 2026-07-29 164702" src="https://github.com/user-attachments/assets/10e77368-a050-4526-a020-7c032ebbe6cc" />
<img width="1917" height="978" alt="Screenshot 2026-07-29 165328" src="https://github.com/user-attachments/assets/df68daa3-1048-427a-8f92-af781b3018f1" />
<img width="1917" height="982" alt="Screenshot 2026-07-29 165222" src="https://github.com/user-attachments/assets/ac53def5-a96c-4b15-89b2-4955ea4f76fe" />


---

## Successful Execution

<img width="1425" height="548" alt="Screenshot 2026-07-30 161207" src="https://github.com/user-attachments/assets/a32aa18c-d83d-4eae-9aa1-df0d5bec3eae" />


---

# Assignment Questions

## 1. Which requirements did you solve using Flow?

- Automatically populate Application Date.
- Send confirmation email to the Placement Officer.

---

## 2. Which requirements required Validation Rules?

Validation Rules were used only for:

- Mandatory field validation.

---

## 3. Which requirements still needed Apex?

- Prevent duplicate applications.
- Reject students with CGPA lower than the Job's minimum CGPA.
- Validate Application Date against Job Closing Date.

---

## 4. Why did you choose those solutions?

The implementation follows Salesforce's **Clicks Before Code** principle.

- **Flows** were used for declarative automation such as updating fields and sending emails.
- **Validation Rules** were used only for simple field-level validations.
- **Apex Triggers** were used for business logic involving related records, duplicate detection, and cross-object comparisons that cannot be implemented using Validation Rules.

---

# Known Limitations

- Record-Triggered Flows cannot display success messages.
- Email delivery depends on the Salesforce org's **Deliverability** settings.
- In Trailhead Playgrounds, external email delivery may be
---
# Conclusion
This assignment demonstrates how declarative automation can efficiently solve business requirements without writing Apex code wherever possible. Using Validation Rules and Record-Triggered Flows improves data quality, reduces manual effort, enhances maintainability, and follows Salesforce best practices.
