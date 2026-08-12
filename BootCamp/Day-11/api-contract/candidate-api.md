# Candidate Recruitment API Contract

## Sprint 11 – External Recruitment Integration

---

## 1. Purpose

This API is used by the Salesforce Placement Management System to send selected student candidates to an external recruitment system.

The integration is triggered when an Application record has:

```text
Stauts__c = "Selected"
```

The purpose of this integration is to synchronize selected students with an external recruitment platform.

---

## 2. External System

For this Sprint 11 prototype, a mock external recruitment API is used to demonstrate the Salesforce integration.

The external system represents a company's recruitment platform.

Salesforce sends selected candidate information to the external recruitment system using a REST API.

---

## 3. Endpoint

```http
POST /candidates
```

The Salesforce Named Credential will provide the base URL.

Apex will use:

```text
callout:Recruitment_API/candidates
```

The endpoint is used to create/register a selected candidate in the external recruitment system.

---

## 4. HTTP Method

```http
POST
```

POST is used because Salesforce is creating/registering a candidate in the external recruitment system.

---

## 5. Request Headers

The request uses the following header:

```http
Content-Type: application/json
```

Authentication is handled through the Salesforce Named Credential.

Authentication credentials are not hard-coded in Apex.

---

## 6. Request JSON

The external recruitment system expects candidate information in JSON format.

### Example Request

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
```

---

## 7. Request Fields

| Field           | Description                            |
| --------------- | -------------------------------------- |
| `studentId`     | Unique identifier of the student       |
| `name`          | Name of the student                    |
| `email`         | Email address of the student           |
| `branch`        | Branch of the student                  |
| `cgpa`          | CGPA of the student                    |
| `jobId`         | Identifier/name of the selected job    |
| `company`       | Company offering the job               |
| `role`          | Job role                               |
| `selectionDate` | Date on which the student was selected |

---

## 8. Salesforce Data Mapping

The candidate request is constructed using the Application record and its related Student and Jobss records.

| API Field       | Salesforce Field              |
| --------------- | ----------------------------- |
| `studentId`     | `Student__r.Student_Id__c`    |
| `name`          | `Student__r.Name`             |
| `email`         | `Student__r.Student_Email__c` |
| `branch`        | `Student__r.Branch__c`        |
| `cgpa`          | `Student__r.CGPA__c`          |
| `jobId`         | `Jobss__r.Name`               |
| `role`          | `Jobss__r.Job_Role__c`        |
| `selectionDate` | `Application_Date__c`         |

The current Jobss object does not have a confirmed Company field in the fields provided for this project.

Therefore, the Company value will be handled during the final integration implementation according to the available Jobss schema.

No unverified Salesforce field is assumed for Company.

---

## 9. Application Status

The Application object contains the following values for:

```text
Stauts__c
```

* Applied
* Shortlisted
* Selected
* Rejected

The integration is initiated when:

```text
Stauts__c = "Selected"
```

Only selected applications should be synchronized with the external recruitment system.

---

## 10. Integration Status

The Application object contains the following integration statuses:

* Pending
* Sent
* Failed
* Retry Required

The Integration Status is stored in:

```text
Integration_Status__c
```

---

## 11. Pending Status

When a selected candidate is waiting to be synchronized, the integration status is:

```text
Integration_Status__c = "Pending"
```

The candidate is then processed asynchronously using Queueable Apex.

---

## 12. Success Response

A successful candidate submission returns:

```http
HTTP 201 Created
```

### Example Response

```json
{
  "success": true,
  "externalCandidateId": "EXT-10045",
  "message": "Candidate successfully registered"
}
```

When the external system successfully creates the candidate, Salesforce updates:

```text
Integration_Status__c = "Sent"
```

The returned external candidate identifier is stored in:

```text
External_Candidate_Id__c
```

Example:

```text
External_Candidate_Id__c = "EXT-10045"
```

---

## 13. HTTP 200 Response

The external system may also return:

```http
HTTP 200 OK
```

A successful HTTP 200 response is treated as a successful integration when the response confirms that the candidate was processed successfully.

Salesforce updates:

```text
Integration_Status__c = "Sent"
```

If an external candidate identifier is returned, it is stored in:

```text
External_Candidate_Id__c
```

---

## 14. HTTP 400 Response

The external system may return:

```http
HTTP 400 Bad Request
```

### Example Response

```json
{
  "success": false,
  "message": "Invalid candidate information"
}
```

Salesforce updates:

```text
Integration_Status__c = "Failed"
```

The error message is stored in:

```text
Integration_Error__c
```

---

## 15. HTTP 401 Response

The external system may return:

```http
HTTP 401 Unauthorized
```

This indicates an authentication failure.

Possible reasons include:

* Invalid authentication configuration
* Invalid credentials
* Expired credentials
* Invalid access token

Salesforce updates:

```text
Integration_Status__c = "Failed"
```

The integration administrator should check the Named Credential and authentication configuration.

---

## 16. HTTP 403 Response

The external system may return:

```http
HTTP 403 Forbidden
```

This indicates that the authenticated user does not have permission to access the requested resource.

Salesforce updates:

```text
Integration_Status__c = "Failed"
```

The integration administrator should check the authorization and permissions configured for the external API.

---

## 17. HTTP 500 Response

The external system may return:

```http
HTTP 500 Internal Server Error
```

This indicates that the external recruitment system has encountered a server-side problem.

Salesforce updates:

```text
Integration_Status__c = "Retry Required"
```

The error information is stored in:

```text
Integration_Error__c
```

The candidate can be processed again using a retry mechanism.

---

## 18. Unexpected Errors

If an unexpected HTTP status or Apex callout exception occurs, Salesforce records the error in:

```text
Integration_Error__c
```

The integration status is updated appropriately so that the failure can be investigated or retried when required.

Examples include:

* Connection timeout
* Callout exception
* Unexpected HTTP status
* Invalid response
* External server unavailable

---

## 19. Integration Error

When an integration fails, the error information is stored in:

```text
Integration_Error__c
```

Example errors:

```text
HTTP 400 - Invalid candidate information
HTTP 401 - Authentication failure
HTTP 403 - Forbidden
HTTP 500 - External server error
Callout Exception - Connection timeout
```

---

## 20. Last Integration Attempt

The date and time of an integration attempt are stored in:

```text
Last_Integration_Attempt__c
```

This allows administrators to identify when the candidate synchronization was last attempted.

Example:

```text
Last_Integration_Attempt__c = 2026-08-12 13:30
```

---

## 21. External Candidate Id

When the external recruitment system successfully creates a candidate, it returns an external candidate identifier.

Example:

```text
EXT-10045
```

Salesforce stores this value in:

```text
External_Candidate_Id__c
```

This identifier can be used to identify the corresponding candidate in the external recruitment system.

---

## 22. Authentication

Salesforce uses a Named Credential named:

```text
Recruitment_API
```

Apex uses:

```text
callout:Recruitment_API/candidates
```

Authentication credentials are not hard-coded inside Apex.

The Named Credential manages the external API endpoint and authentication configuration.

---

## 23. Named Credential

The Named Credential is responsible for managing:

* External API endpoint
* Authentication configuration
* Secure credential information

Apex should reference the Named Credential instead of storing authentication information directly in source code.

Example:

```text
callout:Recruitment_API/candidates
```

The following information must not be hard-coded in Apex:

* Username
* Password
* API Key
* Access Token
* Client Secret

---

## 24. Queueable Apex

The integration uses a Queueable Apex class named:

```text
CandidateSyncQueueable
```

The Queueable class is responsible for:

1. Receiving the selected Application.
2. Loading the related Student record.
3. Loading the related Jobss record.
4. Creating the candidate JSON request.
5. Sending the HTTP POST request.
6. Processing the external API response.
7. Updating the Application integration fields.

---

## 25. Queueable Processing Flow

The Queueable processing flow is:

```text
Application
     |
     v
CandidateSyncQueueable
     |
     v
Load Student and Jobss information
     |
     v
Create candidate JSON
     |
     v
Create HTTP request
     |
     v
Send POST request
     |
     v
Receive HTTP response
     |
     v
Process response
     |
     v
Update Application integration fields
```

---

## 26. Integration Status Flow

The expected integration status flow is:

```text
Selected Application
        |
        v
     Pending
        |
        v
  Queueable Apex
        |
        v
External Recruitment API
        |
        +----------------+
        |                |
        v                v
     Success           Failure
        |                |
        v                v
      Sent       Failed / Retry Required
```

---

## 27. Successful Integration Flow

When the integration succeeds:

```text
Application
    |
    v
Stauts__c = "Selected"
    |
    v
Integration_Status__c = "Pending"
    |
    v
CandidateSyncQueueable
    |
    v
HTTP POST
    |
    v
HTTP 201 Created
    |
    v
Integration_Status__c = "Sent"
    |
    v
External_Candidate_Id__c is populated
```

---

## 28. Failed Integration Flow

When a temporary external-system failure occurs:

```text
Application
    |
    v
Stauts__c = "Selected"
    |
    v
Integration_Status__c = "Pending"
    |
    v
CandidateSyncQueueable
    |
    v
HTTP 500
    |
    v
Integration_Status__c = "Retry Required"
    |
    v
Integration_Error__c is populated
    |
    v
Candidate can be retried
```

---

## 29. Retry Strategy

External systems may temporarily become unavailable.

For example:

```text
Salesforce
    |
    v
External Recruitment API
    |
    v
Server Error
    |
    v
HTTP 500
```

In this situation, the Application is marked:

```text
Integration_Status__c = "Retry Required"
```

A future retry process can find Applications where:

```text
Integration_Status__c = "Retry Required"
```

and attempt the external synchronization again.

---

## 30. Retry Safety

Retries should not blindly submit the same candidate multiple times.

Before retrying, Salesforce should check whether the candidate has already been successfully synchronized.

The following fields are used when determining synchronization state:

* Application Id
* Integration_Status__c
* External_Candidate_Id__c
* Last_Integration_Attempt__c

---

## 31. Idempotency

Idempotency means that processing the same business request multiple times should not unintentionally create duplicate external records.

The Salesforce Application represents the unique business transaction for the candidate submission.

The Application Id and integration status can be used as the business reference for duplicate prevention.

---

## 32. Duplicate Prevention

Without duplicate protection, retrying the same Application could create multiple candidate records in the external system.

Example:

```text
Application
    |
    v
First synchronization
    |
    v
External Candidate EXT-10045
    |
    v
Retry
    |
    v
External Candidate EXT-10046
```

This would create a duplicate candidate.

Therefore, the integration should check the existing synchronization state before submitting the candidate again.

If the Application already has:

```text
Integration_Status__c = "Sent"
```

and:

```text
External_Candidate_Id__c
```

contains a value, the system should not submit the same candidate again unless a deliberate re-synchronization is required.

---

## 33. Security

The integration must not store sensitive credentials inside Apex source code.

The following information must not be hard-coded:

* Username
* Password
* API Key
* Access Token
* Client Secret

All authentication information should be managed through the Salesforce Named Credential.

---

## 34. Point-to-Point Integration

This Sprint 11 prototype uses a point-to-point integration model.

The architecture is:

```text
Salesforce
    |
    v
External Recruitment System
```

Salesforce directly communicates with the external recruitment REST API.

This approach is suitable for the prototype because the integration involves one primary external recruitment system.

---

## 35. Synchronous vs Asynchronous Processing

### Synchronous Processing

In synchronous processing:

```text
Salesforce
    |
    v
External API
    |
    v
Response
    |
    v
Salesforce
```

The user waits for the external API response.

### Asynchronous Processing

In asynchronous processing:

```text
Salesforce
    |
    v
Queueable Apex
    |
    v
External API
```

The user does not have to wait for the external system to complete its processing.

The candidate synchronization uses asynchronous Queueable Apex.

---

## 36. Why Queueable Apex?

The external recruitment synchronization is secondary to the main Salesforce business transaction.

The Application selection should be recorded in Salesforce without making the user wait for the external recruitment system.

Therefore, the external synchronization is performed asynchronously using Queueable Apex.

---

## 37. Complete Integration Flow

The complete integration flow is:

1. Student applies for a Jobss record.
2. Application is created.
3. Application status changes to Selected.
4. Integration Status becomes Pending.
5. CandidateSyncQueueable is submitted.
6. Queueable loads the Application record.
7. Queueable loads the related Student record.
8. Queueable loads the related Jobss record.
9. Candidate JSON is constructed.
10. HTTP POST request is created.
11. Named Credential is used.
12. Request is sent to:

```text
callout:Recruitment_API/candidates
```

13. External recruitment system processes the request.
14. Salesforce receives the HTTP response.
15. Salesforce processes the response.
16. Integration Status is updated.
17. If successful, the status becomes Sent.
18. External Candidate Id is stored.
19. If a temporary failure occurs, the status becomes Retry Required.
20. If a permanent or invalid request occurs, the status becomes Failed.

---

## 38. Example Successful Request

### Candidate Request

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
```

### External Response

```json
{
  "success": true,
  "externalCandidateId": "EXT-10045",
  "message": "Candidate successfully registered"
}
```

### Salesforce Result

```text
Integration_Status__c = "Sent"

External_Candidate_Id__c = "EXT-10045"

Integration_Error__c = blank
```

---

## 39. Example Failure Request

### External Response

```http
HTTP 500 Internal Server Error
```

### Salesforce Result

```text
Integration_Status__c = "Retry Required"

Integration_Error__c = "External recruitment server unavailable"
```

The candidate remains available for retry processing.

---

## 40. API Contract Summary

| Item                     | Value                         |
| ------------------------ | ----------------------------- |
| API                      | Candidate Recruitment API     |
| Endpoint                 | `/candidates`                 |
| HTTP Method              | POST                          |
| Request Format           | JSON                          |
| Response Format          | JSON                          |
| Trigger Condition        | `Stauts__c = Selected`        |
| Salesforce Object        | Application                   |
| Student Object           | Student                       |
| Job Object               | Jobss                         |
| Queueable Class          | CandidateSyncQueueable        |
| Named Credential         | Recruitment_API               |
| Success Status           | Sent                          |
| Failure Status           | Failed                        |
| Temporary Failure        | Retry Required                |
| External Candidate Field | `External_Candidate_Id__c`    |
| Attempt Field            | `Last_Integration_Attempt__c` |
| Error Field              | `Integration_Error__c`        |

---

## 41. Sprint 11 Requirements Covered

This API contract covers the following Sprint 11 requirements:

* REST API integration
* HTTP POST request
* JSON request and response
* Apex HTTP callout
* Queueable Apex
* Named Credentials
* External recruitment system
* Authentication
* Authorization
* Integration status tracking
* Error handling
* Retry strategy
* Idempotency
* Duplicate prevention
* Point-to-point integration
* Asynchronous processing
* API contract documentation

---

## 42. Prototype Scope

This is a Sprint 11 prototype.

The external recruitment platform is represented by a mock REST API for demonstration and testing.

The API contract defines how Salesforce communicates with the external recruitment system.

The actual external endpoint and authentication configuration are provided through the Salesforce Named Credential.

No real production credentials or secrets should be stored in Apex source code or the Git repository.
