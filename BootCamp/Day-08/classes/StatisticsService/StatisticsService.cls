public with sharing class StatisticsService {

    // ==========================================
    // UPDATE PLACEMENT STATISTICS
    // ==========================================
    public static void updatePlacementStatistics() {

        System.debug(
            'Placement statistics updated.'
        );
    }


    // ==========================================
    // MONITOR ASYNC APEX JOBS
    // ==========================================
    public static void monitorJobs() {

        List<AsyncApexJob> jobs = [

            SELECT Id,
                   Status,
                   JobType,
                   ApexClass.Name,
                   NumberOfErrors,
                   TotalJobItems,
                   JobItemsProcessed,
                   CreatedDate,
                   CompletedDate

            FROM AsyncApexJob

            ORDER BY CreatedDate DESC

            LIMIT 10
        ];


        System.debug('======================================');
        System.debug('ASYNC APEX JOB MONITORING');
        System.debug('Total Jobs Found: ' + jobs.size());
        System.debug('======================================');


        for (AsyncApexJob job : jobs) {

            System.debug('--------------------------------------');

            System.debug(
                'Job Id: ' + job.Id
            );

            System.debug(
                'Apex Class: ' +
                (job.ApexClass != null
                    ? job.ApexClass.Name
                    : 'N/A')
            );

            System.debug(
                'Job Type: ' + job.JobType
            );

            System.debug(
                'Status: ' + job.Status
            );

            System.debug(
                'Total Items: ' + job.TotalJobItems
            );

            System.debug(
                'Items Processed: ' +
                job.JobItemsProcessed
            );

            System.debug(
                'Errors: ' +
                job.NumberOfErrors
            );

            System.debug(
                'Created Date: ' +
                job.CreatedDate
            );

            System.debug(
                'Completed Date: ' +
                job.CompletedDate
            );
        }

        System.debug('======================================');
        System.debug('ASYNC JOB MONITORING COMPLETED');
        System.debug('======================================');
    }
}
