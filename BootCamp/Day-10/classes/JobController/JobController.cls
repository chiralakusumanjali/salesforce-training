public with sharing class JobController {

    // =====================================================
    // GET ELIGIBLE JOBS FOR CURRENT LOGGED-IN STUDENT
    // =====================================================
    @AuraEnabled(cacheable=true)
    public static List<Jobss__c> getEligibleJobs() {

        String userEmail = UserInfo.getUserEmail();

        List<Student__c> students = [
            SELECT Id,
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
                'No Student record found for Salesforce email: ' + userEmail
            );
        }

        Student__c student = students[0];

        List<Jobss__c> allJobs = [
            SELECT Id,
                   Name,
                   Job_Role__c,
                   Eligible_Branch__c,
                   Last_Date__c,
                   Location__c,
                   Maximum_Backlogs__c,
                   Minimum_CGPA__c
            FROM Jobss__c
            WHERE Last_Date__c >= :Date.today()
            ORDER BY Last_Date__c ASC
        ];

        List<Jobss__c> eligibleJobs = new List<Jobss__c>();

        for (Jobss__c job : allJobs) {

            Boolean branchEligible =
                String.isBlank(job.Eligible_Branch__c) ||
                job.Eligible_Branch__c == student.Branch__c;

            Boolean cgpaEligible =
                job.Minimum_CGPA__c == null ||
                (
                    student.CGPA__c != null &&
                    student.CGPA__c >= job.Minimum_CGPA__c
                );

            Boolean backlogEligible =
                job.Maximum_Backlogs__c == null ||
                (
                    student.Backlogs__c != null &&
                    student.Backlogs__c <= job.Maximum_Backlogs__c
                );

            if (
                branchEligible &&
                cgpaEligible &&
                backlogEligible
            ) {
                eligibleJobs.add(job);
            }
        }

        return eligibleJobs;
    }
}
