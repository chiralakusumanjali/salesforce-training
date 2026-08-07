public class OfferProcessingJob implements Queueable {

    private Id applicationId;

    public OfferProcessingJob(Id applicationId) {
        this.applicationId = applicationId;
    }

    public void execute(QueueableContext context) {

        System.debug('========================================');
        System.debug('QUEUEABLE JOB STARTED');
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

        System.debug('Application Name: ' + app.Name);
        System.debug('Application Date: ' + app.Application_Date__c);

        System.debug('QUEUEABLE JOB COMPLETED');
        System.debug('========================================');
    }
}
