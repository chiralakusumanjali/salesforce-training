public with sharing class StudentPlacementController {

    // =====================================================
    // GET STUDENT BY STUDENT ID (Student_Id__c)
    // =====================================================

    @AuraEnabled(cacheable=true)
    public static Student__c getStudent(String studentId){

        if(String.isBlank(studentId)){
            throw new AuraHandledException('Student ID is required.');
        }

        List<Student__c> students = [
            SELECT Id,
                   Name,
                   Student_Id__c,
                   Phone__c,
                   Student_Email__c,
                   Branch__c,
                   CGPA__c,
                   Backlogs__c
            FROM Student__c
            WHERE Student_Id__c = :studentId
            LIMIT 1
        ];

        if(students.isEmpty()){
            throw new AuraHandledException(
                'No student found with Student ID: ' + studentId
            );
        }

        return students[0];
    }


    // =====================================================
    // UPDATE STUDENT PROFILE
    // =====================================================

    @AuraEnabled
    public static Student__c updateStudent(
        Id studentId,
        String phone,
        String branch,
        Decimal cgpa,
        Decimal backlogs
    ){

        Student__c student = [
            SELECT Id,
                   Name,
                   Student_Id__c,
                   Phone__c,
                   Student_Email__c,
                   Branch__c,
                   CGPA__c,
                   Backlogs__c
            FROM Student__c
            WHERE Id = :studentId
            LIMIT 1
        ];

        if(String.isBlank(phone)){
            throw new AuraHandledException('Phone number is required.');
        }

        if(String.isBlank(branch)){
            throw new AuraHandledException('Branch is required.');
        }

        if(cgpa == null || cgpa < 0 || cgpa > 10){
            throw new AuraHandledException(
                'CGPA must be between 0 and 10.'
            );
        }

        if(backlogs == null || backlogs < 0){
            throw new AuraHandledException(
                'Backlogs cannot be negative.'
            );
        }

        student.Phone__c = phone;
        student.Branch__c = branch;
        student.CGPA__c = cgpa;
        student.Backlogs__c = backlogs;

        update student;

        return [
            SELECT Id,
                   Name,
                   Student_Id__c,
                   Phone__c,
                   Student_Email__c,
                   Branch__c,
                   CGPA__c,
                   Backlogs__c
            FROM Student__c
            WHERE Id = :student.Id
            LIMIT 1
        ];
    }
}
