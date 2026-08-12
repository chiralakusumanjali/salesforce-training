public with sharing class ApplicationController {

    // =====================================================
    // GET CURRENT STUDENT
    // =====================================================

    private static Student__c getCurrentStudent() {

        String userEmail = UserInfo.getUserEmail();

        List<Student__c> students = [
            SELECT Id,
                   Name,
                   Student_Id__c,
                   Student_Email__c,
                   Branch__c,
                   CGPA__c,
                   Backlogs__c
            FROM Student__c
            WHERE Student_Email__c = :userEmail
            LIMIT 1
        ];

        if (students.isEmpty()) {

            throw new AuraHandledException(
                'No Student record found for Salesforce email: '
                + userEmail
            );
        }

        return students[0];
    }


    // =====================================================
    // SUBMIT APPLICATION
    // =====================================================

    @AuraEnabled
    public static Id submitApplication(Id jobId) {

        if (jobId == null) {

            throw new AuraHandledException(
                'Job Id is required.'
            );
        }


        // -------------------------------------------------
        // GET CURRENT STUDENT
        // -------------------------------------------------

        Student__c student =
            getCurrentStudent();


        // -------------------------------------------------
        // GET JOB
        // -------------------------------------------------

        Jobss__c job = [
            SELECT Id,
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


        // -------------------------------------------------
        // DEADLINE VALIDATION
        // -------------------------------------------------

        if (
            job.Last_Date__c != null &&
            job.Last_Date__c < Date.today()
        ) {

            throw new AuraHandledException(
                'The application deadline has passed.'
            );
        }


        // -------------------------------------------------
        // BRANCH VALIDATION
        // -------------------------------------------------

        if (
            !String.isBlank(
                job.Eligible_Branch__c
            ) &&
            job.Eligible_Branch__c !=
                student.Branch__c
        ) {

            throw new AuraHandledException(
                'You are not eligible because your branch does not match.'
            );
        }


        // -------------------------------------------------
        // CGPA VALIDATION
        // -------------------------------------------------

        if (
            job.Minimum_CGPA__c != null &&
            (
                student.CGPA__c == null ||
                student.CGPA__c <
                    job.Minimum_CGPA__c
            )
        ) {

            throw new AuraHandledException(
                'You do not meet the minimum CGPA requirement.'
            );
        }


        // -------------------------------------------------
        // BACKLOG VALIDATION
        // -------------------------------------------------

        if (
            job.Maximum_Backlogs__c != null &&
            (
                student.Backlogs__c == null ||
                student.Backlogs__c >
                    job.Maximum_Backlogs__c
            )
        ) {

            throw new AuraHandledException(
                'You do not meet the maximum backlog requirement.'
            );
        }


        // -------------------------------------------------
        // DUPLICATE APPLICATION CHECK
        // -------------------------------------------------

        List<Application__c> existingApplications = [
            SELECT Id
            FROM Application__c
            WHERE Student__c = :student.Id
            AND Jobss__c = :job.Id
            LIMIT 1
        ];

        if (!existingApplications.isEmpty()) {

            throw new AuraHandledException(
                'You have already applied for this job.'
            );
        }


        // -------------------------------------------------
        // CREATE APPLICATION
        // -------------------------------------------------

        Application__c applicationRecord =
            new Application__c();

        applicationRecord.Name =
            'APP-' +
            String.valueOf(
                student.Student_Id__c
            ) +
            '-' +
            String.valueOf(
                DateTime.now().getTime()
            );

        applicationRecord.Student__c =
            student.Id;

        applicationRecord.Jobss__c =
            job.Id;

        applicationRecord.Application_Date__c =
            Date.today();

        applicationRecord.Stauts__c =
            'Applied';


        insert applicationRecord;


        return applicationRecord.Id;
    }


    // =====================================================
    // MY APPLICATIONS
    // =====================================================

    @AuraEnabled(cacheable=true)
    public static List<Application__c>
        getMyApplications() {

        Student__c student =
            getCurrentStudent();

        return [
            SELECT
                Id,
                Name,
                Student__c,
                Jobss__c,
                Jobss__r.Name,
                Jobss__r.Job_Role__c,
                Jobss__r.Location__c,
                Jobss__r.Last_Date__c,
                Application_Date__c,
                Stauts__c
            FROM Application__c
            WHERE Student__c = :student.Id
            ORDER BY Application_Date__c DESC
        ];
    }
}
