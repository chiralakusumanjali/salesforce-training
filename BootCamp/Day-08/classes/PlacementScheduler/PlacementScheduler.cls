public class PlacementScheduler implements Schedulable {

    public void execute(SchedulableContext context) {

        System.debug('========================================');
        System.debug('PLACEMENT SCHEDULER STARTED');
        System.debug('Starting Placement Batch...');
        System.debug('========================================');

        Id batchJobId = Database.executeBatch(
            new PlacementBatch(),
            2
        );

        System.debug('PLACEMENT BATCH SUBMITTED');
        System.debug('Batch Job Id: ' + batchJobId);

        System.debug('PLACEMENT SCHEDULER COMPLETED');
        System.debug('========================================');
    }
}
