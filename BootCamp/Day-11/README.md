# Sprint 11 - External Recruitment Integration

## Overview

This sprint extends the Placement Management System by integrating Salesforce with an external recruitment system.

The integration allows a selected student application to be synchronized with an external recruitment platform.

The implementation uses:

* Salesforce Apex
* Queueable Apex
* HTTP REST Callouts
* Named Credentials
* JSON request and response handling
* Integration status tracking
* Duplicate prevention
* Error handling

---

# 1. Business Problem

The Placement Management System stores student applications and selection information inside Salesforce.

After a student is selected for a job, the candidate information also needs to be sent to an external recruitment system.

Without an integration, users would have to manually enter the selected candidate's information into the external system.

This creates several problems:

* Duplicate data entry
* Increased manual effort
* Possibility of incorrect information
* Delayed candidate registration
* No reliable synchronization status

The purpose of this integration is to automatically synchronize selected candidates from Salesforce with the external recruitment system.

---

# 2. External System

The external system represents an external recruitment service that provides candidate registration.

Salesforce sends selected candidate information to the external system through a REST API.

The API endpoint used by the Salesforce integration is:

```text
callout:Recruitment_API/candidates
```

The external system returns an external candidate identifier after successful registration.

Example:

```text
EXT-10001
```

This identifier is stored in Salesforce in:

```text
External_Candidate_Id__c
```

---

# 3. Integration Architecture

The integration follows this architecture:

```text
Salesforce Application
        |
        v
CandidateSyncQueueable
        |
        v
Recruitment_API
Named Credential
        |
        v
External Recruitment REST API
        |
        v
HTTP Response
        |
        v
Process Response
        |
        v
Update Application Integration Fields
```

The architecture diagrams are available in:

```text
architecture/
├── integration-flow.png
├── sequence-diagram.png
└── integration-pattern.png
```

---

# 4. Data Flow

The integration follows these steps.

## Step 1 - Application Selection

A student application is selected for a job.

The Application record must have the appropriate selected status.

Example:

```text
Application
Status = Selected
```

---

## Step 2 - Queueable Apex

The selected Application is processed using:

```text
CandidateSyncQueueable
```

The Queueable class implements:

```text
Queueable
Database.AllowsCallouts
```

This allows the integration to execute asynchronously and perform an HTTP callout.

---

## Step 3 - Retrieve Salesforce Data

The Queueable retrieves the required information from Salesforce.

Typical information includes:

* Student information
* Student ID
* Student name
* Student email
* Branch
* CGPA
* Job information
* Job ID
* Company
* Job role
* Application date

---

## Step 4 - Build Candidate Request

The retrieved Salesforce information is mapped into a candidate request object.

Example:

```text
Candidate
    |
    ├── studentId
    ├── name
    ├── email
    ├── branch
    ├── cgpa
    ├── jobId
    ├── company
    ├── role
    └── selectionDate
```

---

## Step 5 - Convert to JSON

The candidate object is serialized into JSON using:

```apex
JSON.serialize(candidate)
```

---

## Step 6 - Send REST Request

Salesforce sends a POST request to:

```text
callout:Recruitment_API/candidates
```

The request is sent through the Salesforce Named Credential:

```text
Recruitment_API
```

---

## Step 7 - Process Response

The Queueable processes the HTTP response based on the returned status code.

The response body is deserialized when appropriate and the external candidate ID is extracted.

---

## Step 8 - Update Salesforce

The Application record is updated with the integration result.

The integration fields include:

```text
Integration_Status__c
External_Candidate_Id__c
Last_Integration_Attempt__c
Integration_Error__c
```

---

# 5. API Contract

## Endpoint

```text
callout:Recruitment_API/candidates
```

## HTTP Method

```text
POST
```

## Content Type

```text
application/json
```

## Request JSON

Example:

```json
{
  "studentId": "STU-1001",
  "name": "Kusumanjali",
  "email": "student@example.com",
  "branch": "Computer Science",
  "cgpa": 8.5,
  "jobId": "JOB-1001",
  "company": "Example Company",
  "role": "Software Developer",
  "selectionDate": "2026-08-12"
}
```

## Response JSON

Example successful response:

```json
{
  "success": true,
  "externalCandidateId": "EXT-10001",
  "message": "Candidate registered successfully"
}
```

The detailed API contract is available at:

```text
api-contract/candidate-api.md
```

---

# 6. Authentication

Salesforce uses a Named Credential for the external API connection.

The Named Credential used by this integration is:

```text
Recruitment_API
```

The Apex code references the Named Credential rather than hardcoding authentication information.

The callout endpoint is:

```text
callout:Recruitment_API/candidates
```

This separates authentication configuration from Apex code.

No username, password, API key, or secret is hardcoded into the Apex class.

---

# 7. Error Handling

The integration processes different types of responses.

## HTTP 200 / 201

HTTP 200 and HTTP 201 responses are treated as successful responses.

The Application is updated with:

```text
Integration Status = Sent
```

The external candidate identifier is stored in:

```text
External_Candidate_Id__c
```

Example:

```text
Integration Status: Sent
External Candidate Id: EXT-10001
```

---

## HTTP 4xx

HTTP 4xx responses indicate client-side or request-related errors.

The Application is updated with:

```text
Integration Status = Failed
```

The error information is stored in:

```text
Integration_Error__c
```

Example:

```text
Integration Status: Failed
Integration Error: Invalid candidate request
```

---

## HTTP 500+

HTTP 500 and other server-side errors indicate that the external recruitment service may be temporarily unavailable.

The Application is updated with:

```text
Integration Status = Retry Required
```

The error information is recorded in:

```text
Integration_Error__c
```

Example:

```text
Integration Status: Retry Required
Integration Error: External server error
```

---

## Callout/System Exception

If Salesforce cannot reach the external recruitment API, the Application is updated with:

```text
Integration Status = Retry Required
```

Example:

```text
HTTP Callout Error -
External recruitment API could not be reached.
```

The latest attempt time is recorded in:

```text
Last_Integration_Attempt__c
```

---

# 8. Integration Status Tracking

The integration uses the following Application fields:

| Field                         | Purpose                                           |
| ----------------------------- | ------------------------------------------------- |
| `Integration_Status__c`       | Stores the current integration status             |
| `External_Candidate_Id__c`    | Stores the external candidate identifier          |
| `Last_Integration_Attempt__c` | Stores the time of the latest integration attempt |
| `Integration_Error__c`        | Stores integration error information              |

Example successful state:

```text
Integration Status: Sent
External Candidate Id: EXT-10001
Last Integration Attempt: 2026-08-12
```

Example failure state:

```text
Integration Status: Failed
Integration Error: Invalid candidate request
```

Example temporary failure state:

```text
Integration Status: Retry Required
Integration Error: External recruitment API unavailable
```

---

# 9. Retry Strategy

Temporary external-system failures are identified using:

```text
Integration Status = Retry Required
```

This prevents a temporary external API failure from being incorrectly treated as a successful synchronization.

When a temporary external-system failure occurs:

```text
External API Failure
        |
        v
Integration Status = Retry Required
        |
        v
Error information recorded
        |
        v
Last attempt time recorded
```

The current implementation records the failure and marks the Application as:

```text
Retry Required
```

### What happens next?

The Application remains visible as requiring another integration attempt.

A controlled retry mechanism should be used for temporary failures.

A future retry implementation should:

1. Detect Applications with `Retry Required`.
2. Check the retry count.
3. Attempt synchronization again.
4. Increment the retry count after each attempt.
5. Stop retrying after the configured maximum number of attempts.
6. Preserve the final error information for troubleshooting.

The retry mechanism must not continuously retry the same Application without a limit.

A maximum retry count should therefore be introduced when automatic retry processing is implemented.

---

# 10. Idempotency and Duplicate Prevention

Duplicate candidate registration is prevented using:

```text
External_Candidate_Id__c
```

Before sending a candidate to the external system, the Queueable checks whether an external candidate ID already exists.

The logic is:

```apex
if (String.isNotBlank(
    applicationRecord.External_Candidate_Id__c
)) {
    return;
}
```

If the external candidate ID already exists, the Queueable stops and does not make another external API request.

Example first synchronization:

```text
First synchronization
        |
        v
External Recruitment API
        |
        v
Candidate registered
        |
        v
EXT-10001
        |
        v
Saved in Salesforce
```

If the same Queueable executes again:

```text
Queueable starts
        |
        v
External_Candidate_Id__c exists
        |
        v
Stop processing
        |
        v
No new external API request
        |
        v
No duplicate candidate submission
```

This is important because asynchronous jobs may potentially execute more than once or be retried.

The external candidate ID acts as an important synchronization marker.

---

# 11. Integration Pattern

The selected integration pattern is a direct point-to-point integration:

```text
Salesforce
    |
    | REST API
    v
External Recruitment API
```

Salesforce directly communicates with the external recruitment service.

A middleware platform is not used for this implementation because:

* There is currently one external recruitment system.
* The business process is focused.
* The API interaction is relatively simple.
* Salesforce can directly perform the REST callout.

If the organization later integrates with multiple external systems, transforms complex data, or requires centralized integration monitoring, middleware could become more appropriate.

---

# 12. Synchronous vs Asynchronous Processing

The integration uses asynchronous processing with Queueable Apex.

The Queueable class is:

```text
CandidateSyncQueueable
```

and implements:

```text
Queueable, Database.AllowsCallouts
```

### Why asynchronous processing?

The external recruitment system is outside Salesforce.

The external API may be:

* Slow
* Temporarily unavailable
* Incorrectly configured
* Overloaded
* Returning errors
* Experiencing network problems

Using Queueable Apex separates the external integration work from the main Salesforce transaction.

It also provides a better foundation for:

* Monitoring
* Error handling
* Retry handling
* Independent processing
* Callout execution

---

# 13. Why Queueable Apex?

Queueable Apex was selected because:

* The integration is asynchronous.
* The job needs to perform an HTTP callout.
* The candidate synchronization is an independent unit of work.
* The process can be monitored as an asynchronous job.
* The design can be extended with controlled retry handling.
* Queueable Apex supports `Database.AllowsCallouts`.

The basic pattern is:

```apex
public class CandidateSyncQueueable
    implements Queueable, Database.AllowsCallouts {

    public void execute(QueueableContext context) {
        // Integration logic
    }
}
```

---

# 14. Why Named Credential?

Named Credentials are used because authentication information should not be hardcoded in Apex.

The Named Credential is:

```text
Recruitment_API
```

The Apex endpoint is:

```text
callout:Recruitment_API/candidates
```

This approach provides separation between:

```text
Business Logic
       |
       v
Apex Code
```

and:

```text
Authentication / Endpoint Configuration
       |
       v
Named Credential
```

This improves security, maintainability, and configuration management.

---

# 15. Security Considerations

The integration follows these security principles:

* Do not hardcode credentials in Apex.
* Use Salesforce Named Credentials.
* Do not expose API secrets in source code.
* Keep authentication configuration separate from application logic.
* Use HTTPS for external communication.
* Store only the external candidate identifier required for synchronization.
* Record integration errors for monitoring and troubleshooting.
* Avoid exposing sensitive authentication information in error messages or logs.

---

# 16. Integration Flow

```text
Application
    |
    | Status = Selected
    v
CandidateSyncQueueable
    |
    | Check External_Candidate_Id__c
    |
    +------------------------------+
    |                              |
    | Exists                       | Does not exist
    v                              v
Stop                        Build Candidate JSON
                                   |
                                   v
                            Recruitment_API
                                   |
                                   | POST /candidates
                                   v
                        External Recruitment API
                                   |
                                   | HTTP Response
                                   v
                            Process Response
                                   |
                 +-----------------+------------------+
                 |                 |                  |
                 v                 v                  v
             200 / 201          4xx              500+ / Exception
                 |                 |                  |
                 v                 v                  v
               Sent              Failed        Retry Required
                 |
                 v
      External Candidate ID
                 |
                 v
        Update Salesforce
```

---

# 17. Evidence

The project contains the following Sprint 11 evidence:

```text
Sprint-11-Integration/
│
├── README.md
│
├── architecture/
│   ├── integration-flow.png
│   ├── sequence-diagram.png
│   └── integration-pattern.png
│
├── force-app/
│   ├── main/
│   │   └── default/
│   │       ├── classes/
│   │       ├── namedCredentials/
│   │       └── objects/
│
├── api-contract/
│   └── candidate-api.md
│
├── screenshots/
│
└── learning-notes/
    └── sprint-11.md
```

Screenshots should demonstrate the important parts of the implementation, such as:

* Named Credential configuration
* Application integration fields
* Selected Application
* Successful synchronization
* External Candidate ID
* Failed synchronization
* Retry Required status
* Apex execution or debug output
* External API response where applicable

---

# 18. Key Learning

The main lesson from this sprint is that an API integration is more than simply sending an HTTP request.

An integration involves two independent systems.

The external system may be:

* Slow
* Unavailable
* Incorrectly configured
* Temporarily overloaded
* Authenticated differently
* Returning unexpected responses

Therefore, integration design needs to consider:

* Timeouts
* Errors
* Authentication
* Retries
* Duplicates
* Monitoring
* Data ownership
* API contracts
* Response handling
* Security

The API call represents a business interaction between two independent systems.

Therefore, the integration must be designed so that failures are visible and do not silently result in lost synchronization.

---

# 19. Sprint Outcome

At the end of this sprint, the Placement Management System can communicate with an external recruitment system using Salesforce REST callouts.

The implementation demonstrates:

* REST API integration
* HTTP POST requests
* JSON serialization
* Queueable Apex
* `Database.AllowsCallouts`
* Named Credentials
* Authentication configuration
* HTTP response handling
* Integration status tracking
* Error handling
* Retry-required state
* Duplicate prevention
* API contract documentation
* Integration architecture documentation
* Asynchronous processing

The integration provides a foundation for implementing controlled automatic retries in a future enhancement.

---

# 20. Interview Explanation

A simple explanation of the implementation is:

> The Placement Management System integrates Salesforce with an external recruitment system. When an application is selected, Queueable Apex prepares the candidate information as JSON and sends it through a Named Credential to the external recruitment REST API. Salesforce processes the response and updates the Application with the integration status, external candidate ID, last attempt time, and error information. Duplicate prevention is handled by checking whether an external candidate ID already exists. Temporary external-system failures are marked as Retry Required so they are visible for controlled retry processing.

### If the interviewer asks: "Why Queueable Apex?"

Answer:

> I used Queueable Apex because the integration performs an external HTTP callout and should not block the main Salesforce transaction. Queueable also provides a clean asynchronous unit of work and can be extended with retry and monitoring logic.

### If the interviewer asks: "Why Named Credential?"

Answer:

> I used a Named Credential so authentication and endpoint configuration are separated from Apex business logic. This avoids hardcoding credentials or API secrets in the source code.

### If the interviewer asks: "How do you prevent duplicates?"

Answer:

> Before making the external API request, the Queueable checks `External_Candidate_Id__c`. If an external candidate ID already exists, the process stops and does not submit the candidate again.

### If the interviewer asks: "What happens if the external API is down?"

Answer:

> The integration catches the callout failure, records the error and latest attempt time, and marks the Application as `Retry Required`. This makes the temporary failure visible instead of treating it as a successful synchronization.

### If the interviewer asks: "Is automatic retry implemented?"

Answer:

> The current implementation identifies temporary failures using the `Retry Required` status and records the failure. A controlled automatic retry mechanism with a maximum retry count is the next enhancement. This prevents us from claiming an automatic retry mechanism that has not yet been implemented.

---

# 21. Conclusion

This sprint extends the Placement Management System beyond Salesforce and demonstrates how Salesforce can communicate safely with an external recruitment system.

The integration is designed around:

* Asynchronous processing
* Secure authentication configuration
* REST API communication
* JSON request and response handling
* Integration status tracking
* Error visibility
* Duplicate prevention
* Retry-required state

The goal is not only to make one API request succeed, but to design an integration that can handle real-world external-system behavior.

The completed architecture provides a foundation for future improvements such as:

* Automatic retry processing
* Maximum retry limits
* Scheduled retry jobs
* Integration monitoring dashboards
* Centralized integration logs
* Advanced idempotency keys
* Integration event tracking

---

# 22. Sprint 11 Checklist

Before considering Sprint 11 complete, verify the following:

* [ ] `CandidateSyncQueueable` exists.
* [ ] Queueable implements `Database.AllowsCallouts`.
* [ ] Named Credential `Recruitment_API` exists.
* [ ] Apex uses `callout:Recruitment_API/candidates`.
* [ ] HTTP POST request is implemented.
* [ ] Candidate information is converted to JSON.
* [ ] HTTP 200/201 responses are handled as success.
* [ ] HTTP 4xx responses are handled as failures.
* [ ] HTTP 500+ responses are marked `Retry Required`.
* [ ] Callout/system exceptions are handled.
* [ ] `Integration_Status__c` is updated.
* [ ] `External_Candidate_Id__c` is stored after success.
* [ ] `Last_Integration_Attempt__c` is updated.
* [ ] `Integration_Error__c` is populated for errors.
* [ ] Duplicate prevention checks `External_Candidate_Id__c`.
* [ ] API contract documentation exists.
* [ ] Architecture documentation exists.
* [ ] Evidence screenshots are captured.
* [ ] README is committed to Git.
* [ ] Final implementation is tested in Salesforce.

---

# 23. Final Sprint Summary

```text
Selected Application
        |
        v
Queueable Apex
        |
        v
Named Credential
        |
        v
External Recruitment REST API
        |
        v
HTTP Response
        |
        +--------------------+
        |                    |
        v                    v
     Success              Failure
        |                    |
        v                    +-------> Failed
      Sent
        |
        v
External Candidate ID

Temporary Failure
        |
        v
Retry Required
```

The Sprint 11 implementation demonstrates a complete Salesforce-to-external-system integration pattern using Queueable Apex, REST callouts, Named Credentials, JSON processing, status tracking, error handling, and duplicate prevention.
