public with sharing class ApplicationService {
    public static String submitApplication(Id studentId, Id jobssId) {
        // Retrieve Student
        Student__c student = [
            SELECT Id,
                   Name,
                   CGPA__c,
                   Branch__c
            FROM Student__c
            WHERE Id = :studentId
            LIMIT 1
        ];

        // Retrieve Job
        Jobss__c job = [
            SELECT Id,
                   Name,
                   Minimum_CGPA__c,
                   Last_Date__c
            FROM Jobss__c
            WHERE Id = :jobssId
            LIMIT 1
        ];

        // Check Duplicate Application
        List<Application__c> existingApplications = [
            SELECT Id
            FROM Application__c
            WHERE Student__c = :studentId
            AND Jobss__c = :jobssId
        ];

        if (!existingApplications.isEmpty()) {
            return 'Student has already applied for this job.';
        }

        // Validate CGPA
        if (student.CGPA__c < job.Minimum_CGPA__c) {
            return 'Student is not eligible due to insufficient CGPA.';
        }
          // Validate Application Deadline
        if (job.Last_Date__c < Date.today()) {
            return 'Application deadline has passed.';
        }


        // Create Application
        Application__c application = new Application__c();

        application.Student__c = student.Id;
        application.Jobss__c = job.Id;
        application.Stauts__c = 'Applied';

        insert application;

        return 'Application submitted successfully.';
    }
    public static String updateApplicationStatus(Id applicationId, String status) {

    Application__c application = [
        SELECT Id,
               Stauts__c
        FROM Application__c
        WHERE Id = :applicationId
        LIMIT 1
    ];

    application.Stauts__c = status;

    update application;

    return 'Application status updated successfully.';
}
}
