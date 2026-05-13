Salesforce Summer Program – Day 5

Apex Programming Introduction

Objective

The goal of Day 5 is to understand:

* What Apex is
* Why Salesforce needs programming
* Difference between declarative and programmatic development
* How Apex connects with real business logic
* When to use Flow vs Apex

---

1. What is Apex?

Apex is Salesforce’s object-oriented programming language used to build custom business logic on the Salesforce platform.

It is similar to Java and is specially designed for:

* Database operations
* Automation
* Complex validations
* Integrations
* Backend business logic

Apex allows developers to create advanced enterprise applications that cannot be built using only clicks and configuration tools.

---

2. Difference Between Flow vs Apex

| Feature           | Flow                | Apex                 |
| ----------------- | ------------------- | -------------------- |
| Type              | No-code/Low-code    | Programming Language |
| Complexity        | Simple to Medium    | Medium to Advanced   |
| Development Style | Drag-and-drop       | Coding               |
| Best For          | Standard automation | Complex logic        |
| Performance       | Moderate            | High                 |
| Integrations      | Limited             | Advanced             |
| Maintenance       | Easier              | Requires developers  |

---

3. Configuration vs Coding

| Configuration               | Coding                  |
| --------------------------- | ----------------------- |
| Uses clicks instead of code | Uses programming        |
| Faster development          | More flexible           |
| Easy to maintain            | Handles complex logic   |
| Suitable for admins         | Suitable for developers |
| Limited customization       | Unlimited customization |

---

4. Real Examples Where Apex Is Needed

Example 1: Complex Fee Calculation

A university system may calculate fees based on:

* Scholarship
* Attendance
* Course type
* Hostel facility
* Late payment penalties

This logic becomes too complex for normal flows.

Why Apex?

Apex handles multiple conditions efficiently.

---

Example 2: External Payment Integration

When students pay fees online:

* Salesforce must connect with payment gateways
* Verify transaction status
* Generate receipts automatically

Why Apex?

External API integration requires programming.

---

Example 3: Advanced Eligibility Logic

Before course registration:

* Check attendance
* Verify prerequisites
* Check seat availability
* Verify fee payment

Why Apex?

Complex validations and database operations require Apex.

---

5. Integrated College Management System Design

CRM Concept

The College Management System acts like a CRM system where:

* Students are managed
* Admissions are tracked
* Courses are organized
* Faculty interactions are maintained

---

Objects Used

| Object     | Purpose                   |
| ---------- | ------------------------- |
| Student    | Store student information |
| Course     | Store course details      |
| Faculty    | Store faculty details     |
| Admission  | Manage admission records  |
| Attendance | Track attendance          |

---

Relationships

| Relationship         | Description                    |
| -------------------- | ------------------------------ |
| Student → Course     | Students enroll in courses     |
| Faculty → Course     | Faculty teach courses          |
| Student → Attendance | Attendance belongs to students |

---

Validation Rules

Examples:

* Email cannot be blank
* Phone number must contain 10 digits
* Attendance cannot exceed 100%
* Seat limit validation

---

Flow Automation

Examples:

* Send admission confirmation email
* Notify faculty after registration
* Auto-create attendance records
* Reminder notifications for fee payment

---

Apex Usage

Examples:

* Complex eligibility checking
* Dynamic fee calculations
* Payment gateway integration
* Custom reporting logic

---

6. Pseudocode Examples

Example 1: Seat Availability

IF seats are full
THEN block student registration

---

Example 2: Attendance Warning

IF attendance < 75%
THEN send warning notification to student

---

Example 3: Fee Due Reminder

IF fee payment is pending
THEN send payment reminder email

---

7. Reflection

Enterprise systems eventually need programming because:

* Real business logic becomes complex
* External integrations require code
* Advanced automation needs flexibility
* Performance optimization requires programming
* Large-scale systems need custom control

Flows are powerful, but Apex provides complete customization and scalability.

---

Conclusion

Day 5 helped in understanding:

* Why Apex exists
* How coding fits into Salesforce
* Difference between no-code and programmatic development
* Real-world enterprise automation concepts
