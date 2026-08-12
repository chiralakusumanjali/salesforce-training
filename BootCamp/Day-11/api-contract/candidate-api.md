# Candidate Recruitment API Contract

## 1. Purpose

This API is used by the Salesforce Placement Management System
to send selected student candidates to an external recruitment system.

The integration is triggered when an Application record has
Stauts__c = "Selected".

## 2. External System

For this Sprint 11 prototype, a mock external recruitment API
is used to demonstrate the Salesforce integration.

The external system represents a company's recruitment platform.

## 3. Endpoint

POST /candidates

The Salesforce Named Credential will provide the base URL.

Apex will use:

callout:Recruitment_API/candidates

## 4. HTTP Method

POST

POST is used because Salesforce is creating/registering a
candidate in the external recruitment system.

## 5. Request Headers

Content-Type: application/json

## 6. Request JSON

```json
{
  "studentId": "23PA1A-1231",
  "name": "Kusumanjali",
  "email": "chiralakusumanjali.com",
  "branch": "IT",
  "cgpa": 9.5,
  "jobId": "JOB1007",
  "company": "KSquare",
  "role": "Developer",
  "selectionDate": "2026-08-12"
}
