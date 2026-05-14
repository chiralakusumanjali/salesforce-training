Salesforce Summer Program – Day 6

SOQL & Apex Triggers

---

Introduction

Salesforce is a cloud-based CRM platform used by businesses to manage customers, data, and business processes.

To build intelligent business applications, Salesforce provides:

* SOQL for querying data
* Apex Triggers for automation
* Flows for declarative process automation

This project explains the basics of SOQL, Apex Triggers, automation concepts, and real-world business use cases using a College Management System.

---

1. What is SOQL?

SOQL stands for Salesforce Object Query Language.

It is the language used in Salesforce to retrieve data from Salesforce objects.

SOQL is similar to SQL, but it is specially designed for Salesforce databases and object relationships.

Using SOQL, developers can:

* Retrieve records
* Filter data
* Sort results
* Access related records
* Generate reports
* Support automation logic

---

Why SOQL is Important

Enterprise systems store huge amounts of data such as:

* Student records
* Employee information
* Orders
* Attendance details
* Payments
* Customer records

Without queries, retrieving useful information becomes difficult.

SOQL helps:

* Fetch required data quickly
* Improve application performance
* Reduce manual searching
* Support business automation

---

Basic SOQL Syntax

```sql
SELECT FieldName FROM ObjectName
```

Example:

```sql
SELECT Name FROM Student__c
```

This query retrieves all student names from the Student object.

---

SOQL Examples

Example 1: Retrieve Student Names and Emails

```sql
SELECT Name, Email__c FROM Student__c
```

Purpose:
Retrieve student names along with email addresses.

---

Example 2: Find Students with Attendance Below 75%

```sql
SELECT Name, Attendance__c
FROM Student__c
WHERE Attendance__c < 75
```

Purpose:
Identify students whose attendance percentage is below the required limit.

---

Example 3: Retrieve Courses Handled by Faculty

```sql
SELECT Name
FROM Course__c
WHERE Faculty__c = 'Faculty Id'
```

Purpose:
Find courses assigned to a particular faculty member.

---

2. What is an Apex Trigger?

An Apex Trigger is a block of Apex code that executes automatically when specific events occur on Salesforce records.

Triggers help Salesforce systems react automatically to data changes.

Triggers can execute during:

* Insert operations
* Update operations
* Delete operations
* Restore operations

---

Why Apex Triggers are Needed

Businesses require automation for repetitive and important operations.

Examples:

* Sending notifications
* Validating data
* Updating related records
* Preventing invalid actions
* Performing calculations
* Integrating with external systems

Without triggers:

* Manual work increases
* Errors become common
* Business processes become slower

Triggers help create intelligent and automated systems.

---

Common Trigger Events

| Trigger Event | Description                   |
| ------------- | ----------------------------- |
| Before Insert | Runs before records are saved |
| After Insert  | Runs after records are saved  |
| Before Update | Runs before updating records  |
| After Update  | Runs after updating records   |
| Before Delete | Runs before deleting records  |
| After Delete  | Runs after deleting records   |

---

3. Difference Between Flow and Trigger

Salesforce provides two major automation methods:

1. Flow
2. Apex Trigger

---

Flow

Flow is a no-code or low-code automation tool in Salesforce.

Admins can create automation visually without writing code.

Best Use Cases

* Sending emails
* Updating fields
* Approval processes
* Simple workflows

Advantages

* Easy to create
* Faster development
* Easier maintenance

Limitations

* Limited flexibility
* Difficult for complex business logic

---

Apex Trigger

Apex Trigger is a code-based automation approach.

Developers use Apex programming to build advanced business logic.

Best Use Cases

* Complex validations
* Bulk data processing
* Advanced calculations
* External API integrations

Advantages

* Highly flexible
* Powerful customization
* Better for complex operations

Limitations

* Requires coding knowledge
* More difficult to maintain

---

Flow vs Trigger Comparison

| Feature             | Flow              | Apex Trigger           |
| ------------------- | ----------------- | ---------------------- |
| Coding Required     | No                | Yes                    |
| Complexity Handling | Simple            | Advanced               |
| Flexibility         | Limited           | High                   |
| Best For            | Simple automation | Complex business logic |
| Maintenance         | Easier            | Harder                 |

---

Difference Between Before Trigger and After Trigger

---

Before Trigger

A before trigger executes before records are saved to the database.

Uses

* Data validation
* Updating field values
* Preventing invalid records

Example

Validate student age before saving the student record.

---

After Trigger

An after trigger executes after records are saved to the database.

Uses

* Sending notifications
* Creating related records
* Logging activities

Example

Send welcome email after student registration.

---

Before vs After Trigger Comparison

| Before Trigger          | After Trigger                      |
| ----------------------- | ---------------------------------- |
| Executes before saving  | Executes after saving              |
| Used for validation     | Used for post-save actions         |
| Can modify field values | Mainly used for related operations |
| Faster for validations  | Useful for notifications           |

---

4. Trigger Use Cases (College Management System)

---

1. Student Registration Welcome Email

Trigger Event

After Insert on Student object

Purpose

Automatically send a welcome email when a student registers.

Business Benefit

Improves communication and reduces manual work.

---

2. Attendance Warning System

Trigger Event

After Update on Attendance

Purpose

Notify students when attendance falls below 75%.

Business Benefit

Helps students improve attendance before exams.

---

3. Course Capacity Notification

Trigger Event

After Update on Course

Purpose

Notify faculty when a course becomes full.

Business Benefit

Helps manage admissions effectively.

---

4. Fee Payment Confirmation

Trigger Event

After Update on Fee object

Purpose

Send confirmation after successful fee payment.

Business Benefit

Improves transparency and communication.

---

5. Exam Result Notification

Trigger Event

After Insert on Result object

Purpose

Notify students when results are published.

Business Benefit

Provides faster communication and better student experience.

---

5. Query Examples (English Query Ideas)

---

Query 1

Find all students enrolled in Course A.

Purpose

Retrieve students registered for a specific course.

---

Query 2

Find all courses handled by Faculty X.

Purpose

Retrieve courses assigned to a faculty member.

---

Query 3

Find students whose attendance is below 75%.

Purpose

Identify students at academic risk.

---

Query 4

Find students with pending fee payments.

Purpose

Retrieve unpaid fee records.

---

Query 5

Find top-performing students based on marks.

Purpose

Identify highest-scoring students.

---

6. Reflection

Why Enterprise Systems React Automatically to Data Changes

Modern enterprise systems process large amounts of data continuously.

Examples:

* Student registrations
* Payments
* Attendance updates
* Result publishing
* Course enrollments

Manual monitoring of all these activities is difficult and inefficient.

Therefore, enterprise systems use event-driven automation.

---

What is Event-Driven Behavior?

Event-driven behavior means the system reacts automatically whenever important events occur.

Examples:

* Student registered → Send welcome email
* Attendance dropped → Send warning notification
* Fee paid → Send payment confirmation

Instead of continuously checking for changes manually, the system responds instantly when events happen.

---

Benefits of Event-Driven Systems

1. Automation

Reduces repetitive manual work.

---

2. Faster Processing

Actions happen immediately after events occur.

---

3. Improved Accuracy

Reduces human errors.

---

4. Better User Experience

Users receive instant notifications and updates.

---

5. Scalability

Large organizations can manage huge operations efficiently.

---

Problems Without Automation

Without event-driven automation:

* Processes become slow
* Errors increase
* Notifications get delayed
* Productivity decreases
* Monitoring becomes difficult

---

Polling vs Event-Driven Systems

| Polling                         | Event-Driven                   |
| ------------------------------- | ------------------------------ |
| Continuously checks for changes | Reacts only when events happen |
| Uses more resources             | More efficient                 |
| Slower response                 | Faster response                |
| Higher cost                     | Better optimization            |

---

Conclusion

This project helped understand:

* Basics of SOQL
* Salesforce querying concepts
* Apex Trigger functionality
* Flow vs Trigger differences
* Before vs After Trigger behavior
* Event-driven systems
* Real-world automation use cases

These concepts form the foundation for advanced Salesforce development and enterprise automation systems.
