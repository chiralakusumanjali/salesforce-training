public with sharing class StatisticsService {

    public static void updatePlacementStatistics(){

        System.debug('========================================');
        System.debug('Placement Statistics Service Started');

        // Total Students
        Integer totalStudents = [

            SELECT COUNT()

            FROM Student__c

        ];

        // Total Jobs
        Integer totalJobs = [

            SELECT COUNT()

            FROM Jobss__c

        ];

        // Total Applications
        Integer totalApplications = [

            SELECT COUNT()

            FROM Application__c

        ];

        // Total Selected Students
        Integer totalSelected = [

            SELECT COUNT()

            FROM Application__c

            WHERE Stauts__c = 'Selected'

        ];

        System.debug('----------------------------------------');
        System.debug('Total Students      : ' + totalStudents);
        System.debug('Total Jobs          : ' + totalJobs);
        System.debug('Total Applications  : ' + totalApplications);
        System.debug('Total Selected      : ' + totalSelected);
        System.debug('----------------------------------------');

        Decimal placementPercentage = 0;

        if(totalStudents > 0){

            placementPercentage =
                ((Decimal)totalSelected / totalStudents) * 100;

        }

        System.debug(
            'Placement Percentage : '
            + placementPercentage.setScale(2)
            + '%'
        );

        System.debug('Placement Statistics Updated Successfully');
        System.debug('========================================');

    }

}
