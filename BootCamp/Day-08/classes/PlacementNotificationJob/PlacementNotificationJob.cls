public class PlacementNotificationJob implements Queueable {

    private Id applicationId;

    public PlacementNotificationJob(Id applicationId) {
        this.applicationId = applicationId;
    }

    public void execute(QueueableContext context) {

        System.debug('========================================');
        System.debug('PLACEMENT NOTIFICATION JOB STARTED');
        System.debug('Application Id: ' + applicationId);

        if (applicationId == null) {
            System.debug('Application Id is null.');
            return;
        }

        Application__c app = [
            SELECT Id,
                   Name,
                   Application_Date__c
            FROM Application__c
            WHERE Id = :applicationId
            LIMIT 1
        ];

        System.debug('Preparing placement notification...');
        System.debug('Application Name: ' + app.Name);
        System.debug('Application Date: ' + app.Application_Date__c);

        System.debug('NOTIFICATION PROCESSING COMPLETED');
        System.debug('========================================');
    }
}
