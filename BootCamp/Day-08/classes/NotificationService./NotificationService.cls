public with sharing class NotificationService {

    // ==========================================
    // FUTURE METHOD
    // ==========================================
    @future
    public static void sendApplicationEmail(
        Id applicationId
    ) {

        try {

            Application__c applicationRecord = [
                SELECT Id,
                       Name,
                       Application_Date__c,
                       Stauts__c,
                       Student__c,
                       Jobss__c
                FROM Application__c
                WHERE Id = :applicationId
                LIMIT 1
            ];

            System.debug('======================================');
            System.debug('FUTURE METHOD STARTED');
            System.debug(
                'Application Id: ' + applicationRecord.Id
            );
            System.debug(
                'Application Name: ' + applicationRecord.Name
            );
            System.debug(
                'Application Status: ' + applicationRecord.Stauts__c
            );
            System.debug(
                'Student Id: ' + applicationRecord.Student__c
            );
            System.debug(
                'Job Id: ' + applicationRecord.Jobss__c
            );

            System.debug(
                'Sending application email...'
            );

            System.debug(
                'Application email processing completed.'
            );

            System.debug('FUTURE METHOD COMPLETED');
            System.debug('======================================');

        } catch (Exception e) {

            System.debug(
                'Future Method Error: '
                + e.getMessage()
            );
        }
    }


    // ==========================================
    // SELECTION NOTIFICATION
    // ==========================================
    public static void sendSelectionNotification(
        Id applicationId
    ) {

        sendApplicationEmail(applicationId);
    }
}
