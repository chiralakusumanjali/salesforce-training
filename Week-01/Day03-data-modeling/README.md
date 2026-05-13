Salesforce Training – Day 03
Enterprise Data Modeling and Relationship Management

---

📌 Objective of Day 03

The main objective of Day 03 was to understand how Salesforce organizes enterprise-level information using structured data architecture. The session focused on designing connected business systems using Objects, Fields, Records, Relationships, Formula Fields, and Validation Rules.

The learning also emphasized how properly organized data improves automation, reporting, scalability, and overall business efficiency.

---

📖 Understanding Core Salesforce Components

| Component | Description                            | Example                 |
| --------- | -------------------------------------- | ----------------------- |
| App       | Collection of related business modules | Employee Management App |
| Object    | Structure used to store specific data  | Employee Object         |
| Record    | Individual data entry inside an object | Single Employee Details |
| Field     | Stores particular information          | Employee Email          |

---

📖 Standard Objects vs Custom Objects

| Standard Objects                  | Custom Objects                              |
| --------------------------------- | ------------------------------------------- |
| Provided by Salesforce by default | Created based on business needs             |
| Supports CRM processes            | Supports organization-specific applications |
| Examples: Account, Contact, Lead  | Examples: Employee, Project, Payroll        |

Understanding the Difference

Standard Objects are ready-made Salesforce components used for customer management and sales operations.

Custom Objects are designed according to specific business requirements such as education systems, healthcare systems, or inventory management applications.

---

🏢 Enterprise Project Example – Employee Management System

Objects Included

* Employee
* Department
* Project
* Attendance
* Payroll

---

🔗 Relationship Design

One-to-Many Relationships

* One Department can contain multiple Employees
* One Manager can supervise multiple Projects
* One Project can involve multiple Employees

These relationships help organize connected business information efficiently.

---

Lookup Relationships

Examples:

* Employee → Department
* Project → Manager

Lookup Relationships create flexible associations where child records can still exist independently.

---

Master-Detail Relationships

Examples:

* Payroll → Employee
* Attendance → Employee

Master-Detail Relationships create strong dependencies between parent and child records.

If the parent record is deleted, related child records are also removed automatically.

---

Many-to-Many Relationship

Salesforce handles Many-to-Many relationships using a Junction Object.

Example

Employee ↔ Project

One Employee can work on many Projects.
One Project can include many Employees.

Junction Object Used

Project Assignment

The Junction Object stores:

* Employee
* Project
* Assigned Date
* Role

---

📊 Sample Relationship Structure

Department
│
├── Employee
│        │
│        ├── Attendance
│        ├── Payroll
│
├── Project
│
├── Project Assignment

---

🛠️ Understanding Schema Builder

Schema Builder is a visual tool used to design and manage Salesforce data architecture.

Main Uses

* Create Custom Objects
* Add Fields
* Configure Relationships
* Visualize Connected Data Models

Schema Builder helps admins and developers understand complex systems visually.

---

⚡ Formula Fields

Formula Fields automatically generate values based on formulas.

They reduce manual effort and improve consistency.

Examples

1. Annual Salary Calculation

Formula:
Monthly Salary × 12

Purpose:
Automatically calculates yearly salary.

---

2. Employee Full Name

Combines:

* First Name
* Last Name

Purpose:
Creates a complete display name automatically.

---

3. Available Project Slots

Formula:
Maximum Members - Assigned Members

Purpose:
Tracks project availability dynamically.

---

✅ Validation Rules

Validation Rules help maintain clean and accurate data.

They prevent invalid information from being saved.

Examples

Employee Phone Number Validation

Purpose:
Ensures valid contact details are entered.

---

Negative Salary Restriction

Purpose:
Prevents incorrect salary values.

---

Mandatory Department Assignment

Purpose:
Ensures every employee belongs to a department.

---

💡 Reflection and Understanding

Why is structured data important for businesses?

Organizations handle massive amounts of interconnected information daily. Structured data helps maintain consistency, reduce redundancy, improve reporting accuracy, and support business automation.

Salesforce provides centralized and scalable data management compared to disconnected spreadsheets.

---

✨ Discussion Questions

1. Why are spreadsheets insufficient for enterprise applications?

Spreadsheets become difficult to manage when:

* Data volume increases
* Multiple users collaborate
* Relationships become complex
* Automation is required

Enterprise systems provide better scalability, security, and organization.

---

2. Why are object relationships important?

Relationships help connect related business data and improve reporting, automation, and overall data management efficiency.

---

3. What issues occur due to poor data quality?

Poor-quality data may result in:

* Incorrect reports
* Duplicate entries
* Business confusion
* Inefficient decision-making

---

4. Why should calculations be automated?

Automation:

* Saves time
* Reduces manual errors
* Improves productivity
* Ensures consistent calculations

---

5. Why should invalid data be prevented early?

Preventing invalid data improves:

* System reliability
* Data accuracy
* Reporting quality
* Business performance

---

6. Why is Salesforce called a metadata-driven platform?

Salesforce allows applications to be customized through configuration instead of modifying core system code.

This makes the platform:

* Flexible
* Scalable
* Easy to maintain
* Faster to customize

---

📚 Key Knowledge Gained

* Understood Salesforce enterprise data architecture
* Learned the purpose of Objects, Fields, and Records
* Explored relationship types in Salesforce
* Studied Lookup and Master-Detail Relationships
* Learned the importance of Junction Objects
* Explored Schema Builder for visual data modeling
* Understood Formula Fields and Validation Rules
* Learned how structured data supports scalable business applications
* Explored how Salesforce enables no-code and low-code customization

---

🚀 Outcome of Day 03

By completing Day 03 activities, gained practical understanding of:

* Enterprise data organization
* Relationship-based system design
* Automated calculations using Formula Fields
* Data quality management using Validation Rules
* Scalable Salesforce application architecture
* Metadata-driven customization concepts
