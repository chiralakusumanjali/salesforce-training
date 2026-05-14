Reflective Questions & Answers

---

1. Why do systems need triggers?

Systems need triggers to automate important business actions whenever data changes occur.

In enterprise applications, thousands of operations happen every day such as:

* Student registrations
* Fee payments
* Attendance updates
* Order placements
* Employee record changes

Manually monitoring all these activities is inefficient and error-prone.

Triggers help systems react automatically whenever specific events occur.

For example:

* After a student registers → send welcome email
* After fee payment → generate receipt
* After attendance drops → send warning notification

Without triggers:

* Employees would need to perform repetitive tasks manually
* Business processes become slower
* Human errors increase
* Important notifications may be missed

Triggers improve:

* Automation
* Accuracy
* Speed
* Consistency
* User experience

They are an essential part of modern event-driven enterprise systems.

---

2. Difference between polling and event-driven systems?

Polling and event-driven systems are two different approaches used to detect changes in a system.

---

Polling System

In a polling system, the application continuously checks whether any change has happened.

Example:

A system checks every 5 seconds:

* “Did a new student register?”
* “Did payment status change?”

Even if no changes occur, the system keeps checking repeatedly.

Problems with Polling

* Wastes system resources
* Increases unnecessary processing
* Slower response time
* Higher infrastructure cost

---

Event-Driven System

In an event-driven system, the system reacts only when an event actually occurs.

Example:

* Student registers → trigger executes immediately
* Payment completed → notification sent instantly

The system does not waste resources continuously checking for updates.

---

Comparison

| Polling                         | Event-Driven                  |
| ------------------------------- | ----------------------------- |
| Continuously checks for changes | Reacts only when events occur |
| Uses more resources             | More efficient                |
| Slower response                 | Faster response               |
| Higher processing cost          | Optimized performance         |
| Less scalable                   | Highly scalable               |

---

Why Event-Driven Systems are Better

Modern enterprise systems prefer event-driven architecture because it:

* Improves efficiency
* Reduces server load
* Supports real-time automation
* Handles large-scale operations effectively

Salesforce Triggers are examples of event-driven systems.

---

3. Why are database queries important?

Database queries are important because enterprise systems store huge amounts of data.

Examples:

* Student records
* Employee details
* Payments
* Attendance
* Courses
* Customer information

Without queries, retrieving useful information becomes extremely difficult.

Queries help systems:

* Retrieve required records
* Filter information
* Generate reports
* Support automation
* Improve decision-making

---

Importance of Queries in Real Systems

Example queries:

* Find students with attendance below 75%
* Retrieve unpaid fee records
* Find top-performing students
* Retrieve courses assigned to faculty

Without queries:

* Users would need to search manually
* Systems become slow and inefficient
* Reporting becomes difficult

---

Benefits of Database Queries

1. Faster Data Retrieval

Queries fetch only required information quickly.

2. Improved Performance

Efficient queries reduce unnecessary processing.

3. Better Decision Making

Businesses can analyze data easily.

4. Supports Automation

Triggers and Flows often depend on query results.

5. Scalability

Queries help systems manage millions of records efficiently.

SOQL is Salesforce’s query language used for this purpose.

---

4. When should Flows be preferred over Triggers?

Flows should be preferred when the business requirement is simple and does not require complex programming logic.

Flows are Salesforce’s declarative automation tools.

They allow admins to build automation visually without writing code.

---

Best Situations for Using Flows

1. Simple Field Updates

Example:

* Update status automatically

2. Email Notifications

Example:

* Send email after student registration

3. Approval Processes

Example:

* Manager approval workflows

4. Guided User Processes

Example:

* Multi-step form submissions

5. Basic Automation

Example:

* Create simple related records

---

Advantages of Using Flows

* Faster development
* No coding required
* Easier maintenance
* Suitable for admins
* Easier debugging

---

When Triggers are Better

Triggers should be preferred when:

* Logic becomes complex
* Bulk data handling is required
* External API integration is needed
* Advanced validations are required
* High-performance automation is necessary

---

Recommended Approach

Salesforce best practice:

* Use Flow for simple automation
* Use Apex Triggers only for advanced logic

This reduces system complexity and improves maintainability.

---

5. What problems happen if automation logic becomes too complex?

Complex automation can create serious technical and business problems.

Although automation is powerful, excessive or poorly designed automation becomes difficult to manage.

---

Common Problems of Complex Automation

1. Difficult Debugging

When many triggers, flows, and automations interact together:

* Errors become hard to identify
* Troubleshooting takes more time

---

2. Performance Issues

Complex automation increases:

* CPU usage
* Database operations
* Execution time

This may cause:

* Slow system performance
* Governor limit errors in Salesforce

---

3. Unexpected Behavior

Multiple automations may conflict with each other.

Example:

* One trigger updates a field
* Another trigger changes it again

This creates inconsistent results.

---

4. Maintenance Difficulty

Complex systems become difficult for developers to understand and maintain.

New developers may struggle to:

* Read the logic
* Fix issues
* Add new features

---

5. Scalability Problems

Automation designed for small datasets may fail when records grow large.

Enterprise systems must support:

* Thousands of users
* Millions of records

Poor automation design affects scalability.

---

Best Practices to Avoid Complexity

* Keep automation simple
* Avoid unnecessary triggers
* Use Flow for basic logic
* Document automation properly
* Follow Salesforce best practices

---

6. Why should developers think carefully before automating actions?

Automation directly affects business operations.

Poorly designed automation can:

* Create incorrect data
* Slow down systems
* Trigger unintended actions
* Cause business failures

Therefore, developers must think carefully before implementing automation.

---

Important Considerations Before Automation

1. Business Impact

Developers must understand:

* Why automation is needed
* What business problem it solves

Automation should add value, not unnecessary complexity.

---

2. Performance Impact

Automation should be optimized for:

* Speed
* Scalability
* Bulk operations

Poor automation affects system performance.

---

3. Error Prevention

Automation must handle:

* Invalid data
* Missing fields
* Edge cases
* Bulk processing safely

---

4. User Experience

Automation should improve user experience by:

* Reducing manual work
* Providing faster responses
* Sending accurate notifications

---

5. Long-Term Maintenance

Enterprise systems evolve over time.

Developers should create automation that is:

* Easy to maintain
* Easy to debug
* Well documented

---

Final Reflection

Automation is one of the most powerful features in enterprise systems.

However, automation should be:

* Planned carefully
* Designed efficiently
* Tested properly
* Maintained responsibly

Good automation improves:

* Productivity
* Accuracy
* Scalability
* User experience

Poor automation creates:

* Confusion
* Performance problems
* Business risks

Therefore, developers must always balance automation power with system simplicity and maintainability.
