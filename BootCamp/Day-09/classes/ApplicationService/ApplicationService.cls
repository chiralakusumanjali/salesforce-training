public with sharing class ApplicationService {

    public static Id submitApplication(
        Id studentId,
        Id jobId
    ) {

        // =========================================
        // VALIDATE INPUT
        // =========================================

        if (studentId == null) {
            throw new AuraHandledException(
                'Student Id is missing.'
            );
        }

        if (jobId == null) {
            throw new AuraHandledException(
                'Job Id is missing.'
            );
        }


        // =========================================
        // GET STUDENT
        // =========================================

        List<Student__c> students = [
            SELECT
                Id,
                Name,
                CGPA__c,
                Branch__c,
                Backlogs__c
            FROM Student__c
            WHERE Id = :studentId
            LIMIT 1
        ];

        if (students.isEmpty()) {
            throw new AuraHandledException(
                'Student record was not found. Please configure a valid Student Id.'
            );
        }

        Student__c student = students[0];


        // =========================================
        // GET JOB
        // =========================================

        List<Jobss__c> jobs = [
            SELECT
                Id,
                Name,
                Job_Role__c,
                Eligible_Branch__c,
                Last_Date__c,
                Location__c,
                Maximum_Backlogs__c,
                Minimum_CGPA__c
            FROM Jobss__c
            WHERE Id = :jobId
            LIMIT 1
        ];

        if (jobs.isEmpty()) {
            throw new AuraHandledException(
                'Job record was not found.'
            );
        }

        Jobss__c job = jobs[0];


        // =========================================
        // DUPLICATE CHECK
        // =========================================

        List<Application__c> existingApplications = [
            SELECT Id
            FROM Application__c
            WHERE Student__c = :studentId
            AND Jobss__c = :jobId
            LIMIT 1
        ];

        if (!existingApplications.isEmpty()) {
            throw new AuraHandledException(
                'You have already applied for this job.'
            );
        }


        // =========================================
        // CGPA CHECK
        // =========================================

        if (student.CGPA__c == null) {
            throw new AuraHandledException(
                'Student CGPA is missing.'
            );
        }

        if (job.Minimum_CGPA__c == null) {
            throw new AuraHandledException(
                'Job minimum CGPA is missing.'
            );
        }

        if (student.CGPA__c < job.Minimum_CGPA__c) {
            throw new AuraHandledException(
                'You are not eligible based on CGPA.'
            );
        }


        // =========================================
        // BRANCH CHECK
        // =========================================

        if (
            student.Branch__c != job.Eligible_Branch__c
        ) {
            throw new AuraHandledException(
                'You are not eligible based on branch.'
            );
        }


        // =========================================
        // BACKLOG CHECK
        // =========================================

        if (student.Backlogs__c == null) {
            throw new AuraHandledException(
                'Student backlog information is missing.'
            );
        }

        if (job.Maximum_Backlogs__c == null) {
            throw new AuraHandledException(
                'Job maximum backlog information is missing.'
            );
        }

        if (
            student.Backlogs__c >
            job.Maximum_Backlogs__c
        ) {
            throw new AuraHandledException(
                'You are not eligible because your backlogs exceed the allowed limit.'
            );
        }


        // =========================================
        // LAST DATE CHECK
        // =========================================

        if (
            job.Last_Date__c != null &&
            job.Last_Date__c < Date.today()
        ) {
            throw new AuraHandledException(
                'Applications for this job are closed.'
            );
        }


        // =========================================
        // CREATE APPLICATION
        // =========================================

        Application__c applicationRecord =
            new Application__c();

        applicationRecord.Student__c =
            studentId;

        applicationRecord.Jobss__c =
            jobId;

        applicationRecord.Application_Date__c =
            Date.today();

        applicationRecord.Stauts__c =
            'Applied';


        // =========================================
        // INSERT
        // =========================================

        insert applicationRecord;


        return applicationRecord.Id;
    }
}
