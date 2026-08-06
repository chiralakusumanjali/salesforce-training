trigger ApplicationTrigger on Application__c (

    before insert,
    after update

) {

    if (Trigger.isBefore && Trigger.isInsert) {

        System.debug('===== APPLICATION TRIGGER : BEFORE INSERT =====');

        ApplicationTriggerHandler.beforeInsert(

            Trigger.new

        );

    }

    if (Trigger.isAfter && Trigger.isUpdate) {

        System.debug('===== APPLICATION TRIGGER : AFTER UPDATE =====');

        ApplicationTriggerHandler.afterUpdate(

            Trigger.new,

            Trigger.oldMap

        );

    }

}
