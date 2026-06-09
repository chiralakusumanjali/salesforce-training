Source-Code-Documentation.md

Introduction

The College Management System uses Salesforce programmatic and declarative development tools to automate academic operations. The source code consists of Apex Classes, Apex Triggers, Lightning Web Components, Validation Rules, Formula Fields, and Flow Automations.

The purpose of the source code is to provide business functionality, automate processes, enforce data quality, and deliver an interactive user experience.

---

Apex Class

StudentController.cls

Purpose

The StudentController Apex class acts as the backend controller for the Student Dashboard Lightning Web Component.

The controller retrieves student information from Salesforce and provides it to the frontend component.

Responsibilities

• Retrieve student records

• Execute SOQL queries

• Return student information

• Support Lightning Web Components

Source Code

```java
public with sharing class StudentController {

    @AuraEnabled(cacheable=true)
    public static List<Student__c> getStudents() {

        return [
            SELECT Id,
                   Name,
                   Student_ID__c,
                   Email__c,
                   Attendance__c,
                   Eligibility_Status__c
            FROM Student__c
            ORDER BY Name
        ];
    }
}
```

Explanation

public with sharing class StudentController

Creates an Apex class that respects Salesforce sharing rules.

@AuraEnabled(cacheable=true)

Allows Lightning Web Components to access the method.

cacheable=true improves performance by storing results temporarily.

SOQL Query

Retrieves student records from the Salesforce database.

Returned Fields

• Student Name

• Student ID

• Email

• Attendance

• Eligibility Status

Benefits

• Centralized business logic

• Improved maintainability

• Better security

• Reusable backend service

---

Apex Trigger

CourseTrigger.trigger

Purpose

The CourseTrigger automatically updates course enrollment information whenever a student registration is created.

Source Code

```java
trigger CourseTrigger on Registration__c
(after insert, after update) {

    CourseTriggerHandler.updateCourseSeats(
        Trigger.new
    );
}
```

Explanation

after insert

Runs after a registration record is created.

after update

Runs after a registration record is updated.

Trigger.new

Contains newly inserted or updated records.

Purpose

Automatically synchronize registration activity with course enrollment data.

Benefits

• Automation

• Data consistency

• Reduced manual updates

---

Trigger Handler

CourseTriggerHandler.cls

Purpose

Implements trigger logic separately from the trigger itself.

This follows Salesforce Trigger Framework best practices.

Responsibilities

• Retrieve related courses

• Update filled seats

• Maintain enrollment counts

Source Code

```java
public class CourseTriggerHandler {

    public static void updateCourseSeats(
        List<Registration__c> registrations
    ){

        Set<Id> courseIds = new Set<Id>();

        for(Registration__c reg : registrations){

            if(reg.Course__c != null){
                courseIds.add(reg.Course__c);
            }
        }

        List<Course__c> courses = [
            SELECT Id,
                   Filled_Seats__c
            FROM Course__c
            WHERE Id IN :courseIds
        ];

        for(Course__c course : courses){

            course.Filled_Seats__c =
                course.Filled_Seats__c + 1;
        }

        update courses;
    }
}
```

Explanation

Step 1

Collect Course IDs.

Step 2

Retrieve corresponding course records.

Step 3

Increment filled seat count.

Step 4

Update course records.

Benefits

• Clean architecture

• Reusable logic

• Easier maintenance

---

Test Class

StudentControllerTest.cls

Purpose

Provides test coverage for StudentController.

Salesforce requires minimum 75% code coverage before deployment.

Source Code

```java
@isTest
public class StudentControllerTest {

    @isTest
    static void testGetStudents() {

        Student__c student = new Student__c(
            Name='Rahul Kumar',
            Student_ID__c='STU001',
            Email__c='rahul@test.com',
            Attendance__c=90
        );

        insert student;

        Test.startTest();

        List<Student__c> students =
            StudentController.getStudents();

        Test.stopTest();

        System.assertEquals(1, students.size());
    }
}
```

Explanation

Creates test data.

Executes controller method.

Verifies returned records.

Benefits

• Code reliability

• Deployment readiness

• Quality assurance

---

Lightning Web Component

Student Dashboard

Purpose

Provides an interactive interface for viewing student information.

Files

studentDashboard.html

studentDashboard.js

studentDashboard.js-meta.xml

User Features

• View student records

• Attendance information

• Eligibility status

• Dynamic data loading

---

studentDashboard.html

```html
<template>

    <lightning-card title="Student Dashboard">

        <lightning-datatable
            key-field="Id"
            data={students}
            columns={columns}>
        </lightning-datatable>

    </lightning-card>

</template>
```

Explanation

lightning-card

Creates a Salesforce card layout.

lightning-datatable

Displays records in tabular format.

Benefits

• Clean UI

• Responsive design

• Better user experience

---

studentDashboard.js

```javascript
import { LightningElement, wire } from 'lwc';

import getStudents
from '@salesforce/apex/StudentController.getStudents';

export default class StudentDashboard
extends LightningElement {

    students;

    columns = [
        {
            label: 'Student Name',
            fieldName: 'Name'
        },
        {
            label: 'Attendance',
            fieldName: 'Attendance__c'
        }
    ];

    @wire(getStudents)
    wiredStudents({data,error}){

        if(data){
            this.students = data;
        }
    }
}
```

Explanation

@wire

Calls Apex automatically.

students

Stores returned data.

columns

Defines table structure.

Benefits

• Dynamic data retrieval

• Faster UI updates

• Reduced code complexity

---

Flow Automation

Registration Approval Flow

Purpose

Automates registration approval processing.

Workflow

Student Registration Created

↓

Validate Student Information

↓

Validate Course Availability

↓

Generate Approval Request

↓

Faculty Review

↓

Approve / Reject

↓

Update Registration Status

↓

Send Notification

Benefits

• Faster processing

• Reduced manual effort

• Improved efficiency

---

Course Seat Update Flow

Purpose

Automatically updates seat availability.

Workflow

Registration Approved

↓

Get Course Record

↓

Increment Filled Seats

↓

Calculate Remaining Seats

↓

Update Course Record

Benefits

• Real-time updates

• Data consistency

• Automation

---

Validation Rules

Attendance Validation

Purpose

Prevent invalid attendance values.

Formula

```text
Attendance__c > 100
```

Error Message

Attendance cannot exceed 100%.

---

Seat Capacity Validation

Purpose

Prevent over-enrollment.

Formula

```text
Filled_Seats__c > Total_Seats__c
```

Error Message

Course capacity exceeded.

Benefits

• Data quality

• Business rule enforcement

---

Formula Fields

Remaining Seats

Formula

```text
Total_Seats__c - Filled_Seats__c
```

Purpose

Automatically calculates available seats.

---

Attendance Status

Formula

```text
IF(
Attendance__c < 75,
"Low Attendance",
"Good Standing"
)
```

Purpose

Monitor attendance performance.

---

Overall Source Code Architecture

Frontend Layer

• Lightning Web Components

Backend Layer

• Apex Classes

Business Logic Layer

• Apex Triggers

Automation Layer

• Salesforce Flows

Validation Layer

• Validation Rules

Calculation Layer

• Formula Fields

Data Layer

• Custom Objects

The source code architecture follows Salesforce enterprise application development best practices by separating user interface, business logic, automation, validation, and data management responsibilities into independent layers. This design improves maintainability, scalability, performance, and long-term sustainability of the College Management System.
