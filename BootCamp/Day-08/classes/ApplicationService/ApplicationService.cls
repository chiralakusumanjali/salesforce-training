public with sharing class ApplicationService {

    // =========================================================
    // 1. SUBMIT APPLICATION
    // =========================================================
    public static String submitApplication(
        Id studentId,
        Id jobId
    ) {

        // Check duplicate application
        if (isDuplicate(studentId, jobId)) {
            return 'Application already exists.';
        }

        // Get Student
        Student__c student = getStudent(studentId);

        if (student == null) {
            return 'Student not found.';
        }

        // Get Jobss
        Jobss__c job = getJob(jobId);

        if (job == null) {
            return 'Job not found.';
        }

        // Check application deadline
        if (
            job.Last_Date__c != null &&
            Date.today() > job.Last_Date__c
        ) {
            return 'Application deadline has passed.';
        }

        // Check CGPA eligibility
        if (
            student.CGPA__c != null &&
            job.Minimum_CGPA__c != null &&
            student.CGPA__c < job.Minimum_CGPA__c
        ) {
            return 'Student is not eligible.';
        }

        // Create Application
        Application__c app = new Application__c(
            Student__c = studentId,
            Jobss__c = jobId,
            Application_Date__c = Date.today(),
            Stauts__c = 'Applied'
        );

        insert app;

        return 'Application submitted successfully.';
    }


    // =========================================================
    // 2. UPDATE APPLICATION STATUS
    // =========================================================
    public static String updateApplicationStatus(
        Id applicationId,
        String newStatus
    ) {

        Application__c app = [
            SELECT Id,
                   Stauts__c
            FROM Application__c
            WHERE Id = :applicationId
            LIMIT 1
        ];

        app.Stauts__c = newStatus;

        update app;

        return 'Application status updated successfully.';
    }


    // =========================================================
    // 3. GET STUDENT
    // =========================================================
    public static Student__c getStudent(
        Id studentId
    ) {

        List<Student__c> students = [
            SELECT Id,
                   Name,
                   CGPA__c
            FROM Student__c
            WHERE Id = :studentId
            LIMIT 1
        ];

        return students.isEmpty()
            ? null
            : students[0];
    }


    // =========================================================
    // 4. GET JOB
    // =========================================================
    public static Jobss__c getJob(
        Id jobId
    ) {

        List<Jobss__c> jobs = [
            SELECT Id,
                   Name,
                   Minimum_CGPA__c,
                   Last_Date__c
            FROM Jobss__c
            WHERE Id = :jobId
            LIMIT 1
        ];

        return jobs.isEmpty()
            ? null
            : jobs[0];
    }


    // =========================================================
    // 5. DUPLICATE APPLICATION CHECK
    // =========================================================
    public static Boolean isDuplicate(
        Id studentId,
        Id jobId
    ) {

        Integer countApp = [
            SELECT COUNT()
            FROM Application__c
            WHERE Student__c = :studentId
            AND Jobss__c = :jobId
        ];

        return countApp > 0;
    }


    // =========================================================
    // 6. VALIDATE APPLICATIONS
    // =========================================================
    public static void validateApplications(
        List<Application__c> applications
    ) {

        Set<Id> studentIds = new Set<Id>();
        Set<Id> jobIds = new Set<Id>();

        // Collect Student and Job Ids
        for (Application__c app : applications) {

            if (app.Student__c != null) {
                studentIds.add(app.Student__c);
            }

            if (app.Jobss__c != null) {
                jobIds.add(app.Jobss__c);
            }
        }


        // Query Students
        Map<Id, Student__c> students =
            new Map<Id, Student__c>([
                SELECT Id,
                       CGPA__c
                FROM Student__c
                WHERE Id IN :studentIds
            ]);


        // Query Jobs
        Map<Id, Jobss__c> jobs =
            new Map<Id, Jobss__c>([
                SELECT Id,
                       Minimum_CGPA__c,
                       Last_Date__c
                FROM Jobss__c
                WHERE Id IN :jobIds
            ]);


        // Validate each Application
        for (Application__c app : applications) {

            Student__c student =
                students.get(app.Student__c);

            Jobss__c job =
                jobs.get(app.Jobss__c);


            // Student validation
            if (student == null) {

                app.addError(
                    'Student not found.'
                );

                continue;
            }


            // Job validation
            if (job == null) {

                app.addError(
                    'Job not found.'
                );

                continue;
            }


            // CGPA validation
            if (
                student.CGPA__c != null &&
                job.Minimum_CGPA__c != null &&
                student.CGPA__c < job.Minimum_CGPA__c
            ) {

                app.addError(
                    'CGPA is below the minimum requirement.'
                );
            }


            // Deadline validation
            if (
                job.Last_Date__c != null &&
                Date.today() > job.Last_Date__c
            ) {

                app.addError(
                    'Application deadline has passed.'
                );
            }
        }
    }


    // =========================================================
    // 7. HANDLE STATUS UPDATES
    // =========================================================
    public static void handleStatusUpdates(
        List<Application__c> newList,
        Map<Id, Application__c> oldMap
    ) {

        System.debug(
            '=== HANDLE STATUS UPDATE START ==='
        );

        for (Application__c app : newList) {

            Application__c oldApp =
                oldMap.get(app.Id);


            System.debug(
                'Old Status: ' + oldApp.Stauts__c
            );

            System.debug(
                'New Status: ' + app.Stauts__c
            );


            // When Application becomes Selected
            if (
                oldApp.Stauts__c != app.Stauts__c &&
                app.Stauts__c == 'Selected'
            ) {

                System.debug(
                    'STATUS CHANGED TO SELECTED'
                );


                // Queue background processing
                System.enqueueJob(
                    new OfferProcessingJob(app.Id)
                );
            }
        }

        System.debug(
            '=== HANDLE STATUS UPDATE END ==='
        );
    }
}
