Revision Questions – Detailed Answers

---

1. Why do enterprise systems need modular architecture?

Enterprise systems are large and complex applications that contain many features, users, and business processes.

Modular architecture divides the system into smaller independent modules or components.

Examples:

* Student Module
* Faculty Module
* Course Module
* Attendance Module

Benefits of Modular Architecture

* Easier maintenance
* Better scalability
* Faster development
* Reusable components
* Independent updates
* Improved team collaboration

Problems Without Modular Architecture

* Systems become tightly coupled
* Small changes affect the entire application
* Debugging becomes difficult
* Development becomes slower
* Reusability decreases

Conclusion

Modular architecture improves flexibility, maintainability, scalability, and system organization in enterprise applications.

---

2. Why are relationships important?

Relationships connect data between different objects in a system.

Examples:

* Student belongs to Course
* Faculty teaches Course
* Course belongs to Department

Benefits of Relationships

* Avoid duplicate data
* Improve reporting
* Maintain data consistency
* Enable connected records
* Simplify data management

Problems Without Relationships

* Data becomes isolated
* Reporting becomes difficult
* Data redundancy increases
* Data inconsistencies occur

Conclusion

Relationships are essential for organizing enterprise data efficiently and maintaining accurate business information.

---

3. Why are Flows insufficient for some cases?

Flows are powerful Salesforce automation tools, but they have limitations.

Flows Work Well For

* Simple automation
* Notifications
* Record updates
* Approval processes

Complex Scenarios Require Apex

Examples:

* Complex calculations
* Bulk processing
* Advanced validations
* Multi-object business logic
* High-performance operations

Why Apex Is Needed

* More flexibility
* Better control
* Advanced programming capabilities
* Better handling of complex logic

Conclusion

Enterprise applications often combine Flows and Apex together to build scalable and flexible automation systems.

---

4. Why do systems need event-driven behavior?

Enterprise systems must respond automatically to business events and changes.

Event-driven behavior means:

“When an event occurs, the system reacts automatically.”

Examples

* Course becomes full
* Attendance becomes low
* Student registration completed
* Payment received

Benefits

* Real-time response
* Reduced manual work
* Faster operations
* Better user experience
* Improved automation

Problems Without Event-driven Systems

* Manual monitoring becomes necessary
* Delays occur
* Business operations slow down
* Human errors increase

Conclusion

Event-driven architecture improves automation, efficiency, responsiveness, and overall business productivity.

---

5. Why is UI/backend separation important?

The frontend (UI) and backend have different responsibilities in an application.

Frontend Responsibilities

* User interaction
* Displaying information
* Collecting user input

Backend Responsibilities

* Business logic
* Database operations
* Data processing
* Security handling

Benefits of Separation

* Easier maintenance
* Better security
* Independent development
* Reusable backend services
* Improved scalability
* Better testing

Example in Salesforce

* LWC handles the user interface
* Apex handles backend logic

Conclusion

Separating the UI and backend is a critical enterprise architecture principle that improves maintainability, scalability, and security.

---

6. Why do enterprise systems require testing?

Enterprise systems manage important business data and processes.

Testing ensures:

* Correct functionality
* Stable performance
* Secure operations
* Error prevention

Types of Testing

* Unit Testing
* Integration Testing
* UI Testing
* Automation Testing

Problems Without Testing

* Bugs reach production
* Data corruption may occur
* System failures increase
* User trust decreases

Salesforce Requirement

Salesforce requires Apex test classes before deployment to production.

Conclusion

Testing improves system reliability, performance, quality, and business trust.

---

7. Why is reusable UI architecture powerful?

Reusable UI architecture allows components to be used multiple times across applications.

Example Components

* Header component
* Notification component
* Attendance component

Benefits

* Faster development
* Reduced duplicate code
* Easier updates
* Better consistency
* Improved maintenance
* Better scalability

Example in LWC

One notification component can work in:

* Student Dashboard
* Faculty Dashboard
* Admin Dashboard

Conclusion

Reusable UI architecture improves development efficiency, scalability, and maintainability in enterprise systems.

---

8. What problems happen when systems scale?

As enterprise systems grow, they face scalability challenges.

Example

50,000 students using the system simultaneously.

Possible Problems

* Slow performance
* Database overload
* Notification delays
* Security risks
* Data conflicts

Why These Problems Occur

* Large data volume
* High concurrent users
* Heavy processing requests

Solutions

* Bulk processing
* Asynchronous operations
* Query optimization
* Caching
* Proper indexing

Conclusion

Scalability is a major challenge in enterprise architecture and requires proper optimization strategies.

---

9. Why should automation be designed carefully?

Automation is powerful but can create major problems if designed incorrectly.

Problems Caused by Poor Automation

* Infinite loops
* Duplicate records
* Performance issues
* Incorrect notifications
* Data corruption

Example

A trigger repeatedly updates the same record causing recursion.

Benefits of Careful Automation Design

* Better stability
* Improved performance
* Correct business logic
* Controlled execution flow

Best Practices

* Avoid unnecessary automation
* Use bulk-safe logic
* Test thoroughly
* Prevent recursion
* Optimize processing

Conclusion

Enterprise automation requires careful planning, testing, and optimization to ensure system reliability.

---

10. How do all Salesforce concepts integrate together?

Salesforce technologies work together to build complete enterprise applications.

Integration Example

```text id="zbnm9w"
Student clicks Register
→ LWC captures data
→ Apex controller processes request
→ SOQL retrieves records
→ Validation rules verify input
→ Database updated
→ Flow automation triggered
→ Trigger executes event logic
→ Notification sent
```

Integrated Components

* CRM stores business data
* Objects organize records
* Relationships connect data
* Validation rules protect data quality
* SOQL retrieves information
* Apex handles backend processing
* Flows automate business processes
* Triggers respond to events
* LWC provides frontend UI

Conclusion

All Salesforce technologies integrate together to create scalable, automated, secure, and enterprise-level business applications.
