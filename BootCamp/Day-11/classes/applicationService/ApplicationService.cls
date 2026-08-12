public with sharing class ApplicationService {

    // ============================================
    // SUBMIT APPLICATION
    // ============================================

    @AuraEnabled
    public static String submitApplication(
        Id studentId,
        Id jobssId
    ) {


        // ========================================
        // Validate Input
        // ========================================

        if (studentId == null) {

            throw new AuraHandledException(
                'Student record Id is required.'
            );

        }


        if (jobssId == null) {

            throw new AuraHandledException(
                'Job record Id is required.'
            );

        }


        // ========================================
        // 1. Retrieve Student
        // ========================================

        Student__c student = [

            SELECT Id,
                   Name,
                   CGPA__c,
                   Branch__c,
                   Backlogs__c

            FROM Student__c

            WHERE Id = :studentId

            LIMIT 1
        ];


        // ========================================
        // 2. Retrieve Job
        // ========================================

        Jobss__c job = [

            SELECT Id,
                   Name,
                   Eligible_Branch__c,
                   Minimum_CGPA__c,
                   Maximum_Backlogs__c,
                   Last_Date__c

            FROM Jobss__c

            WHERE Id = :jobssId

            LIMIT 1
        ];


        // ========================================
        // 3. Check Application Deadline
        // ========================================

        if (
            job.Last_Date__c != null &&
            job.Last_Date__c < Date.today()
        ) {

            throw new AuraHandledException(
                'Application deadline has passed.'
            );

        }


        // ========================================
        // 4. Check Branch
        // ========================================

        if (
            !String.isBlank(
                job.Eligible_Branch__c
            ) &&
            student.Branch__c !=
            job.Eligible_Branch__c
        ) {

            throw new AuraHandledException(
                'Student branch is not eligible for this job.'
            );

        }


        // ========================================
        // 5. Check CGPA
        // ========================================

        if (
            job.Minimum_CGPA__c != null &&
            (
                student.CGPA__c == null ||
                student.CGPA__c <
                job.Minimum_CGPA__c
            )
        ) {

            throw new AuraHandledException(
                'Student CGPA does not meet the minimum requirement.'
            );

        }


        // ========================================
        // 6. Check Backlogs
        // ========================================

        if (
            job.Maximum_Backlogs__c != null &&
            (
                student.Backlogs__c == null ||
                student.Backlogs__c >
                job.Maximum_Backlogs__c
            )
        ) {

            throw new AuraHandledException(
                'Student has more backlogs than allowed.'
            );

        }


        /*
         * ========================================
         * IMPORTANT
         * ========================================
         *
         * Do NOT add Application__c insertion
         * until we confirm the exact lookup
         * field API names on Application__c.
         *
         * The task requires:
         *
         * Student lookup
         * Job lookup
         * Status
         *
         * but those exact Application__c
         * field API names are not present in
         * the source material available here.
         */


        return
            'Student and Job validation successful.';

    }
    // ============================================
// RETRY CANDIDATE SYNCHRONIZATION
// ============================================

@AuraEnabled
public static String retryCandidateSync(
    Id applicationId
) {

    try {

        // ------------------------------------
        // Validate Application Id
        // ------------------------------------

        if (applicationId == null) {

            throw new AuraHandledException(
                'Application Id is required.'
            );
        }


        // ------------------------------------
        // Get Application
        // ------------------------------------

        Application__c applicationRecord = [

            SELECT
                Id,
                Stauts__c,
                Integration_Status__c,
                External_Candidate_Id__c

            FROM Application__c

            WHERE Id = :applicationId

            LIMIT 1
        ];


        // ------------------------------------
        // Only Selected applications
        // can be synchronized
        // ------------------------------------

        if (
            applicationRecord.Stauts__c != 'Selected'
        ) {

            return
                'Only Selected applications can be synchronized.';
        }


        // ------------------------------------
        // Prevent duplicate synchronization
        // ------------------------------------

        if (
            String.isNotBlank(
                applicationRecord.External_Candidate_Id__c
            )
        ) {

            return
                'Candidate has already been synchronized.';
        }


        // ------------------------------------
        // Check whether retry is allowed
        // ------------------------------------

        if (
            applicationRecord.Integration_Status__c != 'Failed'
            &&
            applicationRecord.Integration_Status__c
                != 'Retry Required'
        ) {

            return
                'Application is not eligible for retry.';
        }


        // ------------------------------------
        // Queue Candidate Synchronization
        // ------------------------------------

        System.enqueueJob(
            new CandidateSyncQueueable(
                applicationRecord.Id
            )
        );


        return
            'Candidate synchronization retry has been queued.';


    } catch (Exception e) {

        return
            'Error: ' + e.getMessage();
    }
}

}
