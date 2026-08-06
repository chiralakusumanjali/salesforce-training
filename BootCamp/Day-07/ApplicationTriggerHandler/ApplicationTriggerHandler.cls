public with sharing class ApplicationTriggerHandler {
    public static void beforeInsert(

        List<Application__c> newApplications

    ){

        System.debug('===== BEFORE INSERT STARTED =====');

        ApplicationService.validateApplications(

            newApplications

        );

        System.debug('===== BEFORE INSERT COMPLETED =====');

    }
    public static void afterUpdate(

        List<Application__c> newApplications,

        Map<Id, Application__c> oldMap

    ){

        System.debug('===== AFTER UPDATE STARTED =====');

        ApplicationService.handleStatusUpdates(

            newApplications,

            oldMap

        );

        System.debug('===== AFTER UPDATE COMPLETED =====');

    }

}
