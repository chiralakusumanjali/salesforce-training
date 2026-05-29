Day 9 – LWC Communication & Architecture

Topics Covered

* Component Communication
* Parent-Child Communication
* Event Handling
* Data Flow Architecture
* Dashboard Design
* Aura vs LWC
* Modular Architecture

---

Component Communication

Lightning Web Components communicate to share data and update the user interface dynamically.

Types of Communication

* Parent to Child Communication
* Child to Parent Communication
* Sibling Communication
* Event-based Communication

Benefits

* Reusable architecture
* Clean and organized code
* Better maintainability
* Dynamic UI updates
* Improved scalability

---

Dashboard Design

Student Dashboard

Components:

* Student Profile
* Attendance
* Courses
* Notifications

Features:

* Attendance tracking
* Course progress monitoring
* Notification updates
* Profile management

Faculty Dashboard

Components:

* Student List
* Attendance Management
* Course Management

Features:

* Manage attendance
* Update student marks
* Allocate courses
* Generate reports

Admin Dashboard

Components:

* User Management
* Reports
* System Settings

Features:

* Manage users and permissions
* Monitor system activity
* Generate analytics
* Configure application settings

---

Data Flow Example

Student Registration Flow

```text id="jlwmq9"
UI → Validation → Apex Controller → Database → Notification
```

Process Flow

1. User fills the registration form.
2. LWC validates user inputs.
3. Apex controller processes the data.
4. Salesforce database stores the record.
5. Notification is sent to the user.

---

Aura vs LWC

| Aura                | LWC                    |
| ------------------- | ---------------------- |
| Older framework     | Modern framework       |
| Slower performance  | Faster performance     |
| More complex        | Simpler syntax         |
| Less optimized      | Better optimized       |
| Salesforce-specific | Based on Web Standards |

Why Salesforce Moved to LWC

* Better browser performance
* Faster rendering
* Modern JavaScript support
* Lightweight framework
* Easier maintenance
* Better scalability

---

Reflection

Enterprise applications require modular architecture because it provides:

* Easier maintenance
* Reusable components
* Faster development
* Better scalability
* Easier debugging
* Improved team collaboration

Modular systems help developers build clean, scalable, and maintainable enterprise applications.

---

Revision Answers

1. Why do components communicate?

Components communicate to share data and update the user interface dynamically.

2. Difference between parent-child communication and events?

Parent-child communication uses properties and `@api`, while events are used for sending actions or messages from child to parent.

3. Why is modular architecture useful?

It improves scalability, maintainability, reusability, and development efficiency.

4. Why did Salesforce move toward LWC?

Salesforce moved to LWC for better performance, modern web standards, and improved developer experience.

5. What problems occur in tightly coupled systems?

Tightly coupled systems are difficult to maintain, debug, test, and scale.

6. Why is frontend architecture important?

Frontend architecture improves user experience, scalability, maintainability, and application structure.

7. Why should UI and backend remain separate?

Separation simplifies development, improves maintainability, and enhances security.

8. Why do large systems need reusable modules?

Reusable modules reduce duplicate code, improve consistency, and speed up development.
