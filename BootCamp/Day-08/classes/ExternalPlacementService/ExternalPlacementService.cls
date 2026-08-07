public class ExternalPlacementService implements Queueable {

    private Id applicationId;

    public ExternalPlacementService(Id applicationId) {
        this.applicationId = applicationId;
    }

    public void execute(QueueableContext context) {

        System.debug('========================================');
        System.debug('EXTERNAL PLACEMENT SERVICE STARTED');
        System.debug('Application Id: ' + applicationId);

        if (applicationId == null) {
            System.debug('Application Id is null.');
            System.debug('EXTERNAL PLACEMENT SERVICE FAILED');
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

        System.debug('Preparing external placement data...');
        System.debug('Application Name: ' + app.Name);
        System.debug('Application Date: ' + app.Application_Date__c);

        // Simulated successful external synchronisation
        Boolean syncSuccessful = true;

        if (syncSuccessful) {

            System.debug('EXTERNAL SYNCHRONISATION SUCCESSFUL');
            System.debug('Starting notification job...');

            System.enqueueJob(
                new PlacementNotificationJob(applicationId)
            );

            System.debug('PLACEMENT NOTIFICATION JOB QUEUED');

        } else {

            System.debug('EXTERNAL SYNCHRONISATION FAILED');
            System.debug('NOTIFICATION JOB WILL NOT BE STARTED');
        }

        System.debug('EXTERNAL PLACEMENT SERVICE COMPLETED');
        System.debug('========================================');
    }
}
