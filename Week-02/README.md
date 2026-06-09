Salesforce Training – Week 02

Week Overview

Week 02 focused on advanced Salesforce development concepts and enterprise application development practices. The primary objective of this phase was to move beyond foundational Salesforce knowledge and gain practical experience in building scalable applications using Lightning Web Components (LWC), implementing component communication, managing source-driven development with Salesforce DX, automating deployments through DevOps practices, and designing business process automation using Flow Builder and Approval Processes.

During this week, several hands-on exercises and project activities were completed to understand how modern Salesforce applications are developed, tested, deployed, and governed within enterprise environments. The concepts learned throughout the week helped bridge the gap between Salesforce development and enterprise software engineering practices.

Day 08 – Lightning Web Components (LWC) Basics

Topics Learned

The first day of Week 02 introduced Lightning Web Components (LWC), Salesforce's modern web development framework used to build responsive and reusable user interfaces.

The following concepts were explored:

• Introduction to Lightning Web Components

• Understanding the LWC architecture

• LWC project structure

• HTML templates

• JavaScript controllers

• Component metadata configuration

• Data binding

• Event handling

• Reactive properties

• Component lifecycle methods

Lightning Web Components use modern JavaScript standards and Web Component APIs to provide a lightweight and efficient framework for building Salesforce user interfaces.

Key Concepts

One-Way Data Binding

One-way data binding allows information from JavaScript controllers to be displayed in HTML templates dynamically. Any updates to the underlying data automatically refresh the user interface.

Reactive User Interfaces

Reactive properties ensure that changes in data are reflected immediately on the screen without manually refreshing components.

Component Lifecycle

Lifecycle hooks help developers execute specific actions during component creation, rendering, updating, and destruction.

Reusable Components

LWC encourages modular development where components can be reused throughout multiple pages and applications.

Outcome

By the end of the day, I understood the fundamentals of Lightning Web Components and successfully created reusable UI components using HTML, JavaScript, and metadata configuration files.

---

Day 09 – Lightning Web Component Communication

Topics Learned

Enterprise applications often consist of multiple components working together. This session focused on enabling communication between Lightning Web Components.

The following communication methods were studied:

• Parent-to-Child Communication

• Child-to-Parent Communication

• Custom Events

• Public Properties (@api)

• Event Handling Patterns

• Component Reusability

Parent-to-Child Communication

Information is passed from parent components to child components using public properties decorated with the @api annotation.

Child-to-Parent Communication

Child components communicate with parent components by dispatching custom events.

Custom Events

Custom events allow components to notify other components when specific actions occur.

Component Communication Architecture

Proper communication architecture improves maintainability and scalability within enterprise applications.

Outcome

Successfully implemented communication between multiple components and gained practical knowledge of event-driven application development.

---

Day 10 – Mini Project Development

Project Title

College Management System

Objective

The objective of the mini-project was to apply previously learned Salesforce concepts in a real-world academic management solution.

Features Designed

Student Management

• Student Registration

• Student Profile Management

• Student Information Tracking

Faculty Management

• Faculty Records

• Department Assignments

• Course Allocation

Course Management

• Course Catalog

• Course Enrollment

• Credit Management

Attendance Tracking

• Attendance Monitoring

• Attendance Reporting

• Performance Evaluation

Scholarship Requests

• Scholarship Application Submission

• Approval Process Integration

• Scholarship Status Tracking

Concepts Applied

• Lightning Web Components

• Component Communication

• Salesforce Data Handling

• User Interface Design

• Business Logic Implementation

• Application Architecture

Outcome

This project provided practical experience in building a Salesforce application and demonstrated how multiple components can work together to solve business problems efficiently.

---

Day 11 – Testing and Asynchronous Operations

Topics Learned

Modern applications require testing and efficient execution of background operations. This session focused on testing methodologies and asynchronous JavaScript programming.

Testing Concepts

• Unit Testing

• Component Testing

• Test Coverage

• Error Detection

• Quality Assurance

Asynchronous Programming

• JavaScript Promises

• Async/Await

• Background Processing

• Error Handling

• Performance Optimization

Importance of Testing

Testing ensures reliability, stability, and maintainability of enterprise applications by identifying issues before deployment.

Importance of Asynchronous Processing

Asynchronous programming allows applications to execute long-running operations without blocking the user interface, resulting in improved user experience and application performance.

Outcome

Developed an understanding of testing principles and learned how asynchronous programming improves performance and responsiveness in Salesforce applications.

---

Day 12 – Salesforce DX Workflow

Topics Learned

Salesforce DX (Developer Experience) introduces a modern development model focused on source-driven development and collaboration.

Topics covered included:

• Salesforce DX Fundamentals

• Source-Driven Development

• Project Structure

• Scratch Orgs

• Metadata Management

• Version Control Integration

Tools Used

Salesforce CLI

The Salesforce Command Line Interface enables developers to create, manage, and deploy Salesforce applications directly from the terminal.

Visual Studio Code

VS Code serves as the primary development environment for Salesforce projects.

Git

Git was used for version control and source code management.

GitHub

GitHub was used to store source code and collaborate on project development.

Benefits of Salesforce DX

• Improved collaboration

• Better version control

• Faster development cycles

• Simplified deployments

• Enhanced project organization

Outcome

Learned how enterprise Salesforce teams manage development projects using source-driven workflows and modern development tools.

---

Day 13 – DevOps and CI/CD

Topics Learned

DevOps practices were introduced to automate software development and deployment processes.

Core Topics

• DevOps Principles

• Continuous Integration (CI)

• Continuous Deployment (CD)

• GitHub Actions

• Automated Testing

• Deployment Pipelines

Continuous Integration

Continuous Integration ensures that code changes are automatically validated whenever developers commit updates to the repository.

Continuous Deployment

Continuous Deployment automates application deployment after successful testing and validation.

GitHub Actions

GitHub Actions was used to automate workflows such as:

• Code Validation

• Automated Testing

• Deployment Execution

• Release Management

Enterprise Benefits

• Faster release cycles

• Reduced deployment errors

• Improved software quality

• Consistent development standards

• Increased productivity

Outcome

Developed an understanding of how enterprise organizations automate software delivery processes and maintain application quality through DevOps practices.

---

Day 14 – Flow Builder and Enterprise Governance

Topics Learned

The final day focused on business process automation and governance within Salesforce.

Flow Builder Concepts

• Flow Builder Architecture

• Decision Elements

• Variables

• Formula Logic

• Branching Workflows

• Automation Design

Approval Process Design

Approval processes were created for:

• Course Creation Requests

• Faculty Leave Requests

• Student Scholarship Requests

• Budget Approval Requests

Attendance Monitoring Workflow

A practical workflow was designed using branching logic:

Attendance below 50%

→ Escalate to Administration

Attendance below 60%

→ Notify Parents

Attendance below 75%

→ Send Warning Notification

Attendance 75% or above

→ No Action Required

Enterprise Governance Concepts

Security

Protecting organizational data and controlling access to business information.

Accountability

Tracking actions performed by users within the system.

Auditability

Maintaining records of system activities for compliance and monitoring purposes.

Compliance

Ensuring organizational processes follow regulatory requirements and standards.

Risk Management

Reducing operational risks through controlled workflows and approval mechanisms.

Outcome

Learned how Salesforce enables organizations to automate complex business processes while maintaining governance, compliance, and operational control.

---

Skills Developed During Week 02

Salesforce Skills

• Lightning Web Components (LWC)

• Component Communication

• Flow Builder

• Approval Processes

• Salesforce DX

• Deployment Management

Development Skills

• JavaScript Programming

• Component-Based Architecture

• Event-Driven Development

• Testing Methodologies

• Application Design

DevOps Skills

• Git

• GitHub

• CI/CD Pipelines

• GitHub Actions

• Automated Deployments

• Release Management

Enterprise Skills

• Governance

• Workflow Design

• Approval Management

• Security Planning

• Compliance Awareness

• Risk Assessment

---

Tools Used

• Salesforce Platform

• Lightning Web Components

• Visual Studio Code

• Salesforce CLI

• Git

• GitHub

• GitHub Actions

• Flow Builder

---

Major Learning Outcomes

By successfully completing Week 02, I gained practical experience in:

• Building modern Lightning Web Components

• Designing reusable Salesforce applications

• Implementing component communication patterns

• Applying testing methodologies

• Working with Salesforce DX development workflows

• Managing source-driven development

• Automating deployments through CI/CD pipelines

• Creating advanced Flow Builder automations

• Designing approval workflows

• Understanding governance and compliance principles

• Applying enterprise software development practices

---

Repository Structure

week-salesforce-advanced/

├── day08-lwc-basics/

├── day09-lwc-communication/

├── day10-mini-project/

├── day11-testing-async/

├── day12-dx-workflow/

├── day13-devops-cicd/

└── day14-flow-governance/

---

Conclusion

Week 02 represented a major transition from foundational Salesforce development to enterprise application engineering. Through hands-on experience with Lightning Web Components, Salesforce DX, DevOps practices, CI/CD automation, Flow Builder, and Governance concepts, I developed a comprehensive understanding of how enterprise Salesforce solutions are designed, built, tested, deployed, automated, and maintained.

The knowledge gained during this week strengthened my technical skills in application development while also introducing industry-standard practices for collaboration, deployment automation, governance, and enterprise-scale solution design. These experiences provided a strong foundation for advanced Salesforce development and prepared me for building real-world business applications using modern Salesforce technologies.
