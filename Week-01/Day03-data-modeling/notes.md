Salesforce Training – Day 03 Notes

Data Modeling and Relationships in Salesforce

---

📌 Introduction to Data Modeling

Data Modeling in Salesforce refers to the method of designing and organizing business data using objects, fields, records, and relationships. It helps companies structure information in a meaningful and connected way.

A well-designed data model helps organizations:

* Organize data efficiently
* Improve business reporting
* Reduce duplicate records
* Maintain data consistency
* Support automation processes
* Build scalable applications

Salesforce applications rely heavily on properly connected and structured data.

---

📌 Understanding Objects, Fields, and Records

Object

An Object is a storage structure used to maintain a specific category of information in Salesforce.

Objects behave similarly to database tables.

Examples of Objects

* Employee
* Student
* Project
* Department
* Product

Example Scenario

A Project Object may contain:

* Project Name
* Project ID
* Start Date
* Team Lead
* Status

Each object stores related information in an organized manner.

---

Field

Fields represent individual pieces of information stored inside an object.

Fields are comparable to columns in a database table.

Common Field Types

* Text
* Number
* Date
* Currency
* Checkbox
* Email
* Picklist
* Formula

Example

Inside an Employee Object:

* Employee Name → Text
* Salary → Currency
* Joining Date → Date

Fields define the format and type of stored data.

---

Record

A Record is a complete data entry stored inside an object.

Records are similar to rows in a database.

Example

| Employee Name | Employee ID | Department |
| ------------- | ----------- | ---------- |
| Kiran         | EMP101      | HR         |

This complete entry represents one record.

---

📌 Standard Objects and Custom Objects

Standard Objects

Salesforce provides predefined objects called Standard Objects.

These are used for common CRM operations.

Examples

* Account
* Contact
* Lead
* Opportunity
* Case

These objects are ready to use and support sales and service processes.

---

Custom Objects

Custom Objects are user-created objects designed according to organizational needs.

Examples

* Library
* Student
* Examination
* Attendance
* Inventory

Custom Objects help businesses build domain-specific applications.

---

📌 Difference Between App, Object, and Tab

| Component | Purpose                                |
| --------- | -------------------------------------- |
| App       | Collection of related modules          |
| Object    | Stores business data                   |
| Tab       | User interface shortcut to access data |

Example

School Management App may contain:

* Student Tab
* Teacher Tab
* Subject Tab
* Attendance Tab

Each tab opens its related object records.

---

📌 Object Relationships in Salesforce

Relationships are used to connect objects with one another.

These relationships help maintain organized and connected business data.

Without relationships:

* Duplicate data increases
* Reporting becomes difficult
* Data management becomes complex

Relationships are essential for designing scalable systems.

---

📌 One-to-Many Relationship

A One-to-Many Relationship means one parent record can be linked to multiple child records.

Example

One Company can have many Employees.

| Company          | Employees           |
| ---------------- | ------------------- |
| ABC Technologies | Ravi, Kiran, Suresh |

Another Example:
One Teacher can handle multiple Subjects.

---

📌 Lookup Relationship

Lookup Relationship creates a flexible connection between objects.

In this relationship:

* Child records can exist independently
* Parent record deletion does not remove child records
* Relationship is loosely connected

Features

* Optional connection
* Independent ownership
* Flexible data structure

Example

Employee → Department

| Employee | Department |
| -------- | ---------- |
| Ravi     | IT         |
| Sneha    | HR         |

If the Department is removed, Employee records can still remain.

---

📌 Master-Detail Relationship

Master-Detail Relationship creates a strong dependency between parent and child records.

In this relationship:

* Child record depends completely on parent
* Parent controls ownership and security
* Deleting parent removes child automatically

Features

* Strong relationship
* Cascading deletion
* Shared security settings

Example

Order → Order Items

If an Order is deleted, all related Order Items are also deleted automatically.

---

📌 Lookup vs Master-Detail Relationship

| Feature             | Lookup        | Master-Detail        |
| ------------------- | ------------- | -------------------- |
| Relationship Nature | Flexible      | Strong Dependency    |
| Child Record        | Independent   | Dependent            |
| Parent Deletion     | Child remains | Child removed        |
| Security Control    | Separate      | Controlled by parent |
| Ownership           | Independent   | Parent-controlled    |

---

📌 Many-to-Many Relationship

A Many-to-Many Relationship allows multiple records from two objects to connect with each other.

Salesforce handles this using a Junction Object.

Example

Students and Subjects

* One Student can enroll in many Subjects
* One Subject can contain many Students

Since direct many-to-many relationships are not supported, Salesforce uses an intermediate object.

---

📌 Junction Object

A Junction Object acts as a bridge between two objects.

Example

Enrollment Object connects:

* Student
* Subject

Enrollment may also contain:

* Enrollment Date
* Semester
* Marks

Example Table

| Student | Subject |
| ------- | ------- |
| Ravi    | Java    |
| Ravi    | Python  |
| Sneha   | Java    |

Importance of Junction Objects

* Reduces repeated data
* Supports complex systems
* Improves scalability
* Simplifies reporting

---

📌 Schema Builder

Schema Builder is a visual design tool in Salesforce used for creating and viewing data structures.

Uses of Schema Builder

* Create Objects
* Add Fields
* Define Relationships
* Visualize System Design

It provides a graphical representation of how objects are connected.

---

📌 Benefits of Schema Builder

Without Schema Builder:

* Understanding complex systems becomes difficult

With Schema Builder:

* Relationships become visually clear
* Admins and developers understand structures quickly
* Data models become easier to maintain

---

📌 Example Data Model

Hospital Management System

Objects:

* Patient
* Doctor
* Appointment
* Prescription
* Billing

Relationships:

* Doctor → Appointment
* Patient → Appointment
* Appointment → Billing

This creates a connected healthcare management system.

---

📌 Formula Fields

Formula Fields automatically calculate values using formulas.

They reduce manual calculations and improve accuracy.

Examples

Age Calculation

Calculates age from Date of Birth automatically.

Total Amount

Formula:
Quantity × Price

Full Address

Combines:

* City
* State
* Country

Into a single field.

---

📌 Validation Rules

Validation Rules ensure users enter correct and meaningful data.

They help maintain data quality.

Examples

* Mobile Number must contain 10 digits
* Salary cannot be negative
* Required fields cannot be empty
* Stock quantity cannot exceed available limit

Validation Rules prevent invalid data from entering the system.

---

📌 Importance of Structured Data

Organized data is essential for enterprise systems.

Benefits:

* Better reporting
* Easier automation
* Improved scalability
* Reduced duplication
* Faster business processes

Poorly organized data creates confusion and reduces efficiency.

---

📌 Metadata-Driven Architecture

Salesforce is called a metadata-driven platform because customization happens using configuration instead of changing the core application code.

Admins can:

* Create Objects
* Add Fields
* Configure Automation
* Build Applications

Without modifying Salesforce’s internal system.

Advantages

* Flexible customization
* Faster development
* Easier upgrades
* Better scalability

---

📌 Summary

Day 03 focused on understanding Salesforce Data Modeling concepts including:

* Objects, Fields, and Records
* Standard and Custom Objects
* Relationships in Salesforce
* Lookup and Master-Detail Relationships
* Junction Objects
* Schema Builder
* Formula Fields
* Validation Rules
* Metadata-Driven Architecture

These concepts form the foundation for designing scalable and connected Salesforce applications.