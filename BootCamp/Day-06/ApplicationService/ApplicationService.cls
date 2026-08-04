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
public static void validateApplications(List<Application__c> newApplications) {

    Set<Id> studentIds = new Set<Id>();
    Set<Id> jobIds = new Set<Id>();

    for (Application__c app : newApplications) {

        if (app.Student__c != null)
            studentIds.add(app.Student__c);

        if (app.Jobss__c != null)
            jobIds.add(app.Jobss__c);
    }

    Map<Id, Student__c> studentMap = new Map<Id, Student__c>([
        SELECT Id,
               CGPA__c
        FROM Student__c
        WHERE Id IN :studentIds
    ]);

    Map<Id, Jobss__c> jobMap = new Map<Id, Jobss__c>([
        SELECT Id,
               Minimum_CGPA__c,
               Last_Date__c
        FROM Jobss__c
        WHERE Id IN :jobIds
    ]);

    List<Application__c> existingApplications = [
        SELECT Student__c,
               Jobss__c
        FROM Application__c
        WHERE Student__c IN :studentIds
        AND Jobss__c IN :jobIds
    ];

    Set<String> duplicateSet = new Set<String>();

    for (Application__c app : existingApplications) {

        duplicateSet.add(app.Student__c + '-' + app.Jobss__c);

    }

    for (Application__c app : newApplications) {

        Student__c student = studentMap.get(app.Student__c);

        Jobss__c job = jobMap.get(app.Jobss__c);

        if (student == null || job == null)
            continue;

        if (student.CGPA__c < job.Minimum_CGPA__c) {

            app.addError('Student is not eligible due to insufficient CGPA.');

        }

        if (job.Last_Date__c < Date.today()) {

            app.addError('Application deadline has passed.');

        }

        if (duplicateSet.contains(app.Student__c + '-' + app.Jobss__c)) {

            app.addError('Student has already applied for this job.');

        }

    }

} 
}
