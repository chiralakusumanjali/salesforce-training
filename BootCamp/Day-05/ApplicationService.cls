public with sharing class ApplicationService {

    public static String submitApplication(Id studentId, Id jobId) {

        List<Application__c> existingApplications = [
            SELECT Id
            FROM Application__c
            WHERE Student__c = :studentId
            AND Jobss__c = :jobId
            LIMIT 1
        ];

        if (!existingApplications.isEmpty()) {
            return 'Duplicate application found. You have already applied for this job.';
        }

        Student__c student = [
            SELECT CGPA__c
            FROM Student__c
            WHERE Id = :studentId
        ];

        Job__c job = [
            SELECT Minimum_CGPA__c
            FROM Job__c
            WHERE Id = :jobId
        ];

        if (student.CGPA__c < job.Minimum_CGPA__c) {
            return 'Application rejected. Minimum CGPA requirement not satisfied.';
        }

        Application__c application = new Application__c();

        application.Student__c = studentId;
        application.Job__c = jobId;
        application.Application_Date__c = Date.today();

        try {
            insert application;
            return 'Application submitted successfully.';
        }
        catch (DmlException e) {
            return 'Application could not be submitted. ' + e.getMessage();
        }
    }
}
