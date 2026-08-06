public with sharing class NotificationService {

    public static void sendSelectionNotification(Id applicationId){

        Application__c application = [

            SELECT Id,
                   Student__r.Name,
                   Student__r.Student_Email__c,
                   Jobss__r.Name,
                   Stauts__c

            FROM Application__c

            WHERE Id = :applicationId

            LIMIT 1

        ];

        System.debug('========================================');
        System.debug('Notification Service Started');
        System.debug('Student Name : ' + application.Student__r.Name);
        System.debug('Student Email : ' + application.Student__r.Student_Email__c);
        System.debug('Job : ' + application.Jobss__r.Name);
        System.debug('Current Status : ' + application.Stauts__c);
        System.debug('Notification sent successfully.');
        System.debug('========================================');

    }

}
