trigger ApplicationTrigger on Application__c (after update) {

    for (Application__c newApplication : Trigger.new) {

        Application__c oldApplication =
            Trigger.oldMap.get(newApplication.Id);

        /*
         * Run only when the Application status
         * changes to Selected.
         */
        if (
            newApplication.Stauts__c == 'Selected' &&
            oldApplication.Stauts__c != 'Selected'
        ) {

            /*
             * Send the Application to the
             * asynchronous Queueable process.
             */
            System.enqueueJob(
                new CandidateSyncQueueable(
                    newApplication.Id
                )
            );
        }
    }
}
