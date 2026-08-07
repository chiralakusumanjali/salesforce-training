public class PlacementBatch implements Database.Batchable<SObject> {

    public Database.QueryLocator start(Database.BatchableContext context) {

        System.debug('========================================');
        System.debug('PLACEMENT BATCH STARTED');
        System.debug('========================================');

        return Database.getQueryLocator([
            SELECT Id,
                   Name,
                   Application_Date__c,
                   Student__c,
                   Jobss__c
            FROM Application__c
        ]);
    }

    public void execute(
        Database.BatchableContext context,
        List<Application__c> scope
    ) {

        System.debug('========================================');
        System.debug('PLACEMENT BATCH EXECUTE');
        System.debug('Records in current scope: ' + scope.size());

        for (Application__c app : scope) {

            System.debug(
                'Processing Application: ' +
                app.Name +
                ' | Id: ' +
                app.Id
            );
        }

        System.debug('Current batch processed successfully.');
        System.debug('========================================');
    }

    public void finish(Database.BatchableContext context) {

        System.debug('========================================');
        System.debug('PLACEMENT BATCH FINISHED');
        System.debug('Batch Job Id: ' + context.getJobId());
        System.debug('========================================');
    }
}
