public with sharing class JobController {

    @AuraEnabled(cacheable=true)
    public static List<Jobss__c> getJobs() {

        return [
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
            ORDER BY Last_Date__c ASC
        ];
    }
}
