public with sharing class ApplicationService {
    public static String submitApplication(
        Id studentId,
        Id jobssId
    ){

        if(isDuplicate(studentId, jobssId)){
            return 'Student has already applied for this job.';
        }

        Student__c student = getStudent(studentId);

        if(student == null){
            return 'Student not found.';
        }

        Jobss__c job = getJob(jobssId);

        if(job == null){
            return 'Job not found.';
        }

        // CGPA Validation

        if(student.CGPA__c < job.Minimum_CGPA__c){

            return 'Student CGPA is below the required minimum CGPA.';

        }

        // Branch Validation

        if(student.Branch__c != job.Eligible_Branch__c){

            return 'Student branch is not eligible.';

        }

        // Backlogs Validation

        if(student.Backlogs__c > job.Maximum_Backlogs__c){

            return 'Too many active backlogs.';

        }

        // Last Date Validation

        if(job.Last_Date__c != null &&
           Date.today() > job.Last_Date__c){

            return 'Application deadline has passed.';

        }

        Application__c application = new Application__c();

        application.Student__c = studentId;

        application.Jobss__c = jobssId;

        application.Application_Date__c = Date.today();

        application.Stauts__c = 'Applied';

        insert application;

        return 'Application submitted successfully.';

    }

    //=========================================================
    // UPDATE APPLICATION STATUS
    //=========================================================

    public static String updateApplicationStatus(

        Id applicationId,

        String newStatus

    ){

        Application__c application=[

            SELECT Id,
                   Stauts__c

            FROM Application__c

            WHERE Id=:applicationId

            LIMIT 1

        ];

        application.Stauts__c=newStatus;

        update application;

        return 'Application status updated successfully.';

    }

    //=========================================================
    // GET STUDENT
    //=========================================================

    public static Student__c getStudent(Id studentId){

        List<Student__c> students=[

            SELECT Id,
                   Name,
                   CGPA__c,
                   Branch__c,
                   Backlogs__c

            FROM Student__c

            WHERE Id=:studentId

        ];

        if(students.isEmpty()){

            return null;

        }

        return students[0];

    }

    //=========================================================
    // GET JOB
    //=========================================================

    public static Jobss__c getJob(Id jobssId){

        List<Jobss__c> jobs=[

            SELECT Id,
                   Name,
                   Minimum_CGPA__c,
                   Eligible_Branch__c,
                   Maximum_Backlogs__c,
                   Last_Date__c

            FROM Jobss__c

            WHERE Id=:jobssId

        ];

        if(jobs.isEmpty()){

            return null;

        }

        return jobs[0];

    }

    //=========================================================
    // DUPLICATE CHECK
    //=========================================================

    public static Boolean isDuplicate(

        Id studentId,

        Id jobssId

    ){

        Integer total=[

            SELECT COUNT()

            FROM Application__c

            WHERE Student__c=:studentId

            AND Jobss__c=:jobssId

        ];

        return total>0;

    }
        //=========================================================
    // VALIDATE APPLICATIONS (BULKIFIED)
    //=========================================================
    public static void validateApplications(

        List<Application__c> applications

    ){

        System.debug('===== VALIDATION STARTED =====');

        // Collect Student and Job IDs
        Set<Id> studentIds = new Set<Id>();
        Set<Id> jobIds = new Set<Id>();

        for(Application__c app : applications){

            if(app.Student__c != null){

                studentIds.add(app.Student__c);

            }

            if(app.Jobss__c != null){

                jobIds.add(app.Jobss__c);

            }

        }

        // Nothing to validate
        if(studentIds.isEmpty() || jobIds.isEmpty()){

            return;

        }

        // Query Students
        Map<Id, Student__c> studentMap =
        new Map<Id, Student__c>([

            SELECT Id,
                   Name,
                   CGPA__c,
                   Branch__c,
                   Backlogs__c

            FROM Student__c

            WHERE Id IN :studentIds

        ]);

        // Query Jobs
        Map<Id, Jobss__c> jobMap =
        new Map<Id, Jobss__c>([

            SELECT Id,
                   Name,
                   Minimum_CGPA__c,
                   Eligible_Branch__c,
                   Maximum_Backlogs__c,
                   Last_Date__c

            FROM Jobss__c

            WHERE Id IN :jobIds

        ]);

        // Existing Applications
        Set<String> duplicateSet = new Set<String>();

        for(Application__c app : [

            SELECT Student__c,
                   Jobss__c

            FROM Application__c

            WHERE Student__c IN :studentIds
            AND Jobss__c IN :jobIds

        ]){

            duplicateSet.add(

                String.valueOf(app.Student__c)

                +

                '-'

                +

                String.valueOf(app.Jobss__c)

            );

        }

        // Validate Each Application
        for(Application__c app : applications){

            Student__c student =
            studentMap.get(app.Student__c);

            Jobss__c job =
            jobMap.get(app.Jobss__c);

            if(student == null){

                app.addError(
                    'Student not found.'
                );

                continue;

            }

            if(job == null){

                app.addError(
                    'Job not found.'
                );

                continue;

            }

            // Rule 1 : CGPA

            if(student.CGPA__c < job.Minimum_CGPA__c){

                app.addError(
                    'Student CGPA is below the required minimum CGPA.'
                );

            }

            // Rule 2 : Branch

            if(student.Branch__c != job.Eligible_Branch__c){

                app.addError(
                    'Student branch is not eligible.'
                );

            }

            // Rule 3 : Backlogs

            if(student.Backlogs__c > job.Maximum_Backlogs__c){

                app.addError(
                    'Too many active backlogs.'
                );

            }

            // Rule 4 : Last Date

            if(job.Last_Date__c != null &&
               Date.today() > job.Last_Date__c){

                app.addError(
                    'Application deadline has passed.'
                );

            }

            // Rule 5 : Duplicate Application

            String key =

                String.valueOf(app.Student__c)

                +

                '-'

                +

                String.valueOf(app.Jobss__c);

            if(duplicateSet.contains(key)){

                app.addError(
                    'Student has already applied for this job.'
                );

            }

            // Rule 6 : Default Status

            if(String.isBlank(app.Stauts__c)){

                app.Stauts__c = 'Applied';

            }

        }

        System.debug('===== VALIDATION COMPLETED =====');

    }
        //=========================================================
    // HANDLE STATUS UPDATES
    //=========================================================
    public static void handleStatusUpdates(

        List<Application__c> newApplications,

        Map<Id,Application__c> oldMap

    ){

        System.debug('===== STATUS UPDATE STARTED =====');

        for(Application__c app : newApplications){

            Application__c oldApp = oldMap.get(app.Id);

            // Check if Status Changed
            if(oldApp.Stauts__c != app.Stauts__c){

                System.debug(
                    'Status Changed From '
                    + oldApp.Stauts__c
                    + ' To '
                    + app.Stauts__c
                );

                // Selected
                if(app.Stauts__c == 'Selected'){

                    StatisticsService.updatePlacementStatistics();

                    NotificationService.sendSelectionNotification(
                        app.Id
                    );

                }

                // Interview Scheduled
                if(app.Stauts__c == 'Interview Scheduled'){

                    System.debug(
                        'Interview Scheduled Notification Sent.'
                    );

                }

                // Rejected
                if(app.Stauts__c == 'Rejected'){

                    System.debug(
                        'Rejection Notification Sent.'
                    );

                }

                // Offer Accepted
                if(app.Stauts__c == 'Offer Accepted'){

                    System.debug(
                        'Offer Acceptance Notification Sent.'
                    );

                }

            }

        }

        System.debug('===== STATUS UPDATE COMPLETED =====');

    }

}
