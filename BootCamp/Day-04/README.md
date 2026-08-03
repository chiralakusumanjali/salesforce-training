#  Placement Cell Management System - Lightning Web Components (LWC)

## 📌 Project Overview

This project was developed as part of Salesforce Training – Day 4 to learn Lightning Web Components (LWC).

The components are integrated into a Placement Cell Management System and demonstrate how LWC can be used to build interactive Salesforce user interfaces.

##  Components Developed

### 1. Student Details (placementHome)

Displays student information retrieved from the **Student__c** object using Apex.

**Features**

- Displays Student Name
- Displays Student ID
- Displays Branch
- Displays CGPA
- Displays Email
- Displays Phone Number
- Uses Apex with `@wire`
- Reads data from Salesforce Database

---

### 2. Welcome Message (welcomeMessage)

Displays a welcome message when the user clicks a button.

**Features**

- Button Click Event
- Dynamic Message Display
- JavaScript Event Handling

---

### 3. Application Status (applicationStatus)

Displays the student's application status.

Initially:

```
Status : Not Applied
```

After clicking **Apply**:

```
Status : Applied
```

**Features**

- Data Binding
- Event Handling
- Dynamic UI Update

---

# 📂 Project Structure

```text
force-app
└── main
    └── default
        ├── classes
        │   ├── StudentController.cls
        │   └── StudentController.cls-meta.xml
        │
        └── lwc
            ├── placementHome
            ├── welcomeMessage
            └── applicationStatus
```

---

# 📸 Screenshots

## Student Details

<img width="1917" height="992" alt="Screenshot 2026-08-03 113321" src="https://github.com/user-attachments/assets/dd9e4aa5-c1ba-418b-8915-b3e5b04f2a1d" />


---

## Welcome Message (Before)

<img width="1916" height="983" alt="Screenshot 2026-08-03 113039" src="https://github.com/user-attachments/assets/11641ad7-0bb1-4270-9b4f-cc1177ce084d" />


---

## Welcome Message (After)

<img width="1913" height="982" alt="Screenshot 2026-08-03 112704" src="https://github.com/user-attachments/assets/31332ade-c380-4f23-849d-7b31f24d14ab" />


---

## Application Status (Before)

<img width="1917" height="916" alt="Screenshot 2026-08-03 113441" src="https://github.com/user-attachments/assets/7578d3c8-ff58-4da7-8655-0c5aff700770" />



---

## Application Status (After)

<img width="1916" height="983" alt="Screenshot 2026-08-03 113039" src="https://github.com/user-attachments/assets/11641ad7-0bb1-4270-9b4f-cc1177ce084d" />



---

# ❓ README Questions

## What is Lightning Web Components (LWC)?

Lightning Web Components (LWC) is Salesforce's modern JavaScript framework used to build fast, reusable, and interactive user interfaces. It is based on web standards and uses HTML, JavaScript, CSS, and XML.

---

## What did you build?

During this project, I built three Lightning Web Components:

- Student Details
- Welcome Message
- Application Status

The Student Details component retrieves records from Salesforce using Apex, while the other components demonstrate JavaScript-based UI interactions.

---

## Which file contains HTML?

The `.html` file defines the user interface of the Lightning Web Component.

Example:

```
placementHome.html
```

---

## Which file contains JavaScript?

The `.js` file contains the component's logic, including variables, event handling, Apex integration, and dynamic updates.

Example:

```
placementHome.js
```

---

## What did you learn?

Through this project, I learned:

- Lightning Web Components
- Component Structure
- HTML Templates
- JavaScript Controllers
- Meta XML Configuration
- Apex Integration using @wire
- Data Binding
- Event Handling
- Dynamic UI Updates
- Deploying LWC using Salesforce CLI

---

# Technologies Used

- Salesforce Developer Org
- Lightning Web Components (LWC)
- Apex
- Salesforce CLI
- Visual Studio Code
- HTML
- JavaScript
- XML

---

# 📚 Conclusion

This project provided hands-on experience with Lightning Web Components by integrating them into a Placement Cell Management System. I learned how to retrieve Salesforce data using Apex, build interactive user interfaces, handle user events, and dynamically update components using JavaScript.
