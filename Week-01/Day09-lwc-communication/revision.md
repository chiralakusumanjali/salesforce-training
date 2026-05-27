1. Why do components communicate?

Components communicate to exchange data, trigger actions, and keep the user interface updated dynamically. In modern applications, a single page is divided into multiple components, and each component handles a specific responsibility. For the application to work properly, these components must interact with one another.

For example, in a College Management System:

* A Student Form component collects student details.
* A Dashboard component displays student information.
* A Notification component shows success messages.

When a student submits the form, the dashboard must refresh automatically, and the notification component must display a confirmation message. This is possible only through component communication.

Importance of Component Communication

Data Sharing

Components share information such as:

* Student details
* Attendance records
* Course information

Dynamic UI Updates

When data changes in one component, other components can update automatically without reloading the entire page.

Better User Experience

Communication creates smooth and interactive applications.

Reusability

Components become reusable because they can work independently while still communicating with others.

Loose Coupling

Proper communication reduces dependency between components and improves maintainability.

Example in LWC

Parent Component

Sends student data to child component.

Child Component

Displays the student information.

Event Communication

Child component informs parent when a button is clicked.

Thus, communication is essential for building scalable and dynamic enterprise applications.

---

2. Difference between parent-child communication and events?

In Lightning Web Components, communication mainly happens in two ways:

1. Parent-to-child communication
2. Child-to-parent communication using events

Parent-to-Child Communication

This occurs when a parent component sends data to its child component.

How It Works

* Parent passes data using properties.
* Child receives data using the `@api` decorator.

Characteristics

* Data flows downward.
* Parent controls the child.
* Simple and direct communication.

Example

Parent Component

Passes student name:

```html
<c-student-card student-name="Rahul"></c-student-card>
```

Child Component

Receives value:

```javascript
@api studentName;
```

Use Cases

* Passing student information
* Sending configuration settings
* Passing dashboard data

Events (Child-to-Parent Communication)

Events are used when a child component wants to send information back to the parent.

How It Works

* Child creates a custom event.
* Parent listens to the event.

Characteristics

* Data flows upward.
* Child informs parent about actions.
* Used for interaction handling.

Example

Child Component

```javascript
this.dispatchEvent(new CustomEvent('save'));
```

Parent Component

```html
<c-child onsave={handleSave}></c-child>
```

Use Cases

* Button clicks
* Form submissions
* Notifications
* Status updates

Key Differences

| Parent-Child Communication | Events                     |
| -------------------------- | -------------------------- |
| Parent sends data to child | Child sends data to parent |
| Uses `@api`                | Uses `CustomEvent`         |
| Downward flow              | Upward flow                |
| Data sharing               | Action notification        |
| Controlled by parent       | Triggered by child         |

---

3. Why is modular architecture useful?

Modular architecture means dividing a large application into smaller independent modules or components. Each module handles a specific task.

For example:

* Attendance module
* Student management module
* Course module
* Notification module

Instead of building one huge system, developers build small reusable parts.

Benefits of Modular Architecture

Reusability

A component can be reused multiple times.

Example:
A notification component can be used in:

* Student dashboard
* Faculty dashboard
* Admin dashboard

This reduces duplicate code.

Easier Maintenance

If a bug occurs in one module, developers can fix only that module without affecting the entire application.

Better Scalability

New features can be added easily without rewriting the whole application.

Example:
Adding an Exam Management module later.

Team Collaboration

Different teams can work on different modules simultaneously.

Example:

* Team 1 → Student module
* Team 2 → Attendance module
* Team 3 → Reports module

Faster Development

Developers can reuse existing modules instead of creating everything again.

Better Testing

Each module can be tested independently.

Loose Coupling

Modules remain independent and changes in one module do not heavily affect others.

Example in Salesforce

In Salesforce LWC:

* Header component
* Sidebar component
* Dashboard component
* Notification component

All work independently but communicate when required.

This creates clean enterprise architecture.

---

4. Why did Salesforce move toward LWC?

Salesforce moved from Aura Components to Lightning Web Components because LWC provides:

* Better performance
* Simpler development
* Modern standards
* Improved scalability

Problems with Aura

Aura had several limitations:

* Heavy framework
* More complex syntax
* Slower rendering
* Less efficient performance
* Framework-specific coding

Developers found Aura harder to maintain.

Advantages of LWC

Uses Modern Web Standards

LWC is built using:

* HTML
* JavaScript
* CSS
* Web Components

Developers can use standard web development skills.

Better Performance

LWC runs faster because:

* It uses native browser features.
* Less framework overhead exists.
* Rendering is optimized.

Applications load faster.

Simpler Development

LWC syntax is cleaner and easier compared to Aura.

Example:

Aura:

```html
<aura:component>
```

LWC:

```html
<template>
```

Better JavaScript Support

LWC supports modern JavaScript features:

* ES6
* Modules
* Classes
* Async operations

Improved Security

LWC works with Lightning Web Security for safer applications.

Easier Testing and Maintenance

Smaller modular components simplify debugging and updates.

Conclusion

Salesforce adopted LWC to create:

* Faster applications
* Better user experience
* Modern frontend architecture
* Scalable enterprise systems

---

5. What problems happen in tightly coupled systems?

A tightly coupled system is a system where components depend heavily on each other. If one component changes, many other components are affected.

Problems in Tightly Coupled Systems

Difficult Maintenance

A small change in one module can break multiple modules.

Example:
Changing attendance logic may affect reports and notifications.

Hard Debugging

Finding bugs becomes difficult because components are interconnected.

Poor Scalability

Adding new features becomes risky and complicated.

Low Reusability

Components cannot be reused independently.

High Dependency

Every module depends heavily on others.

Difficult Testing

Independent testing becomes almost impossible.

Slower Development

Developers spend more time fixing dependency issues.

Example

Bad Architecture:

```text
Student Module → Attendance Module → Notification Module
```

If one module fails, the entire chain gets affected.

Better Approach

Use loosely coupled architecture where modules communicate cleanly through APIs and events.

---

6. Why is frontend architecture important?

Frontend architecture defines how the user interface is structured and organized.

Good frontend architecture improves:

* Performance
* Scalability
* User experience
* Maintainability

Importance of Frontend Architecture

Organized Structure

A proper structure keeps files and components clean.

Better User Experience

Well-designed architecture creates responsive and smooth applications.

Reusability

Reusable components reduce duplicate work.

Easier Maintenance

Developers can update components easily.

Scalability

Large applications grow more efficiently.

Faster Development

Reusable patterns speed up development.

Better Collaboration

Teams can work independently on different UI modules.

Example in LWC

Frontend architecture may include:

* Header component
* Sidebar component
* Dashboard component
* Modal component

Each has a separate responsibility.

---

7. Why should UI and backend remain separate?

The UI (frontend) and backend should remain separate because they have different responsibilities.

Responsibilities

Frontend

Handles:

* User interface
* User interaction
* Displaying data

Backend

Handles:

* Business logic
* Database operations
* Security
* Data processing

Benefits of Separation

Easier Maintenance

Frontend and backend can be updated independently.

Better Scalability

Frontend and backend can scale separately.

Reusable APIs

Multiple applications can use the same backend APIs.

Example:

* Web app
* Mobile app
* Salesforce app

Faster Development

Frontend and backend teams can work simultaneously.

Better Security

Sensitive logic stays on the server.

Easier Testing

Frontend and backend testing become independent.

Example in Salesforce

Frontend

LWC component:

```html
<lightning-button label="Save"></lightning-button>
```

Backend

Apex controller:

```apex
public static void saveStudent(){}
```

Frontend collects data.
Backend processes and stores data.

---

8. Why do large systems need reusable modules?

Large enterprise systems contain many features and pages. Without reusable modules, development becomes slow and difficult.

Reusable modules solve this problem.

Benefits of Reusable Modules

Reduce Duplicate Code

Developers write code once and use it multiple times.

Example:
One notification component used across all dashboards.

Faster Development

Existing modules save development time.

Consistency

Same design and functionality appear throughout the application.

Easier Maintenance

Fixing one reusable module updates all usages automatically.

Better Scalability

New features can be built using existing modules.

Improved Testing

Reusable modules are tested once and trusted everywhere.

Example in LWC

Reusable Components:

* Header component
* Button component
* Modal component
* Notification component

These can be reused across:

* Student dashboard
* Faculty dashboard
* Admin dashboard

Conclusion

Reusable modules are essential for:

* Enterprise scalability
* Faster development
* Maintainability
* Clean architecture
* Efficient teamwork

Modern applications heavily depend on reusable modular systems.
