Salesforce Training – Day 02 Notes

Understanding Salesforce Platform Basics

📌 Introduction to Salesforce

Salesforce is a web-based business platform used for managing customer information, business operations, and company workflows. It allows organizations to create applications, maintain records, automate tasks, and generate reports using cloud technology.

Main capabilities of Salesforce:

* Customer management
* Business process automation
* Data storage and management
* Application customization
* Analytics and reporting
* Team collaboration

Because Salesforce runs on cloud infrastructure, users can log in and work from any location using internet access.

---

📌 Salesforce Environment Structure

Salesforce platform is organized into multiple layers that help businesses manage operations smoothly.

Main Components:

* Apps
* Objects
* Fields
* Records
* Tabs
* Reports
* Dashboards

These components work together to store data and provide business functionality.

---

📌 Understanding Apps in Salesforce

An App is a collection of related features created for a particular business purpose.

Example Apps:

* Sales Management App
* Hospital Management App
* Employee Tracking App
* Inventory Management App

Example:

An Employee Management App may include:

* Employee Object
* Department Object
* Payroll Object
* Attendance Object

Apps help organize all related modules in one place for easier access.

---

📌 Understanding Objects

Objects are used to store information in Salesforce.
They are similar to tables in a database.

Each object contains:

* Fields → Individual pieces of information
* Records → Complete entries of data

Example:

Employee Object may contain:

* Employee Name
* Employee ID
* Email
* Department

Each employee entry becomes a separate record.

---

📌 What are Fields?

Fields store specific information inside an object.

Types of Fields:

* Text
* Number
* Date
* Checkbox
* Picklist
* Email

Example:

Inside Student Object:

* Name → Text Field
* Roll Number → Number Field
* Date of Birth → Date Field

Fields define what type of data users can store.

---

📌 What is a Record?

A Record is a single row of data inside an object.

Example:

| Name | Roll No | Department |
| ---- | ------- | ---------- |
| Ravi | 101     | CSE        |

This complete row represents one record.

---

📌 Understanding Tabs

Tabs are shortcuts used to open objects, dashboards, reports, and pages.

Examples:

* Accounts Tab
* Contacts Tab
* Students Tab
* Reports Tab

Tabs improve navigation and help users quickly access information.

---

📌 Salesforce Navigation Features

Salesforce provides different navigation tools for users.

Important Navigation Elements:

* App Launcher
* Navigation Menu
* Global Search
* Recent Items
* Setup Menu
* Notifications Panel

These tools help users move across applications efficiently.

---

📌 Features that Make Salesforce Unique

Salesforce stands out because of its modern cloud architecture and flexibility.

Advantages:

* Completely cloud-based
* No hardware maintenance
* Supports mobile access
* Easy customization
* Faster deployment
* Automatic platform upgrades
* Strong security model
* Supports both admins and developers

---

📌 Salesforce User Interface Overview

The Salesforce interface is designed for easy business usage.

UI Components:

* Home Page
* Tabs
* Record Pages
* Related Lists
* Dashboards
* Reports
* Setup Area

The interface allows users to manage records without technical complexity.

---

📌 Working Process of Salesforce Platform

Salesforce platform works using:

1. Cloud servers
2. Applications
3. Database objects
4. Automation tools
5. Security permissions
6. Integration services

Business users interact through apps while developers extend functionality using coding tools.

---

📌 Multi-Tenant System in Salesforce

Salesforce follows a multi-tenant architecture.

Meaning:

Many customers share the same infrastructure while keeping data isolated and secure.

Real-Life Example:

A shopping mall contains many stores:

* Same building
* Separate shops
* Separate customers
* Separate business operations

Similarly in Salesforce:

* Shared servers
* Separate customer organizations
* Independent secure data

This architecture reduces maintenance cost and improves scalability.

---

📌 Salesforce Administrator Role

Salesforce Administrators manage the system using configuration tools.

Responsibilities:

* Create users
* Configure security
* Customize page layouts
* Create reports
* Build flows
* Manage permissions

Admins mainly use no-code tools.

---

📌 Salesforce Developer Role

Developers create advanced solutions using programming.

Responsibilities:

* Write Apex classes
* Create Lightning Web Components
* Integrate third-party systems
* Develop APIs
* Build advanced automation

Developers handle complex technical requirements.

---

📌 Customization Methods in Salesforce

Salesforce customization happens using two approaches.

1️⃣ Declarative Development (No Coding)

Uses built-in tools provided by Salesforce.

Tools:

* Flow Builder
* Validation Rules
* Object Manager
* Approval Processes
* Formula Fields

Benefits:

* Quick implementation
* Easy maintenance
* Minimal technical knowledge

---

2️⃣ Programmatic Development (Coding)

Used when advanced functionality is required.

Technologies:

* Apex
* SOQL
* Lightning Web Components
* REST APIs

Used For:

* Complex business logic
* External system integration
* Advanced automation
* Custom services

---

📌 Declarative vs Programmatic Development

| Declarative         | Programmatic       |
| ------------------- | ------------------ |
| No coding required  | Uses programming   |
| Easy for admins     | Used by developers |
| Faster setup        | More customization |
| Limited flexibility | Highly flexible    |
| Built-in tools      | Apex and APIs      |

---

📌 When Declarative Tools are Preferred

Use no-code solutions when:

* Requirement is simple
* Standard features are sufficient
* Quick delivery is needed

Examples:

* Creating fields
* Approval process
* Validation rules
* Basic workflows

---

📌 When Coding is Required

Use coding when:

* Logic becomes complicated
* Integration with external systems is needed
* Standard tools cannot solve the problem

Examples:

* Payment integrations
* Real-time APIs
* Advanced calculations
* Custom automation

---

📌 CRM Concepts Inside Salesforce

Salesforce stores CRM information using standard objects.

| CRM Concept          | Salesforce Object |
| -------------------- | ----------------- |
| Company Details      | Account           |
| Customer Information | Contact           |
| Sales Deal           | Opportunity       |
| Support Ticket       | Case              |

These objects work together to manage customer relationships effectively.

---

📌 Example Business Application Design

Hospital Management App

Objects:

* Patient
* Doctor
* Appointment
* Billing
* Prescription

User Activities:

* Receptionist schedules appointments
* Doctors update prescriptions
* Billing team manages payments
* Patients access records

This structure helps organizations manage data efficiently inside Salesforce.

---

📌 Summary

Salesforce platform provides:

* Cloud-based business management
* Data organization using objects
* Easy navigation through apps and tabs
* Automation using flows and Apex
* Flexible customization
* Secure multi-tenant environment

The platform supports both business users and developers for building scalable applications.