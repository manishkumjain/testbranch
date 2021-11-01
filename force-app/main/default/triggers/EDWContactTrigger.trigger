// 
// (c) 2014 Appirio, Inc.
//
// EDW Contact trigger for different database events
//
// 21 Jun 2014     Shyam Sundar       Original
//

trigger EDWContactTrigger on EDW_Contact__c (before insert,before update,after insert, after update) {   

    //before insert
    if(trigger.isBefore && trigger.isInsert){
        //Check to see if the TriggerSetting for EDWContactTrigger IsActive
        if(TriggerState.isActive('EDWContactTrigger'))
            EDWContactTriggerHandler.handleBeforeInsert(trigger.new);
    }
    // after insert
    if(trigger.isAfter && trigger.isInsert){
        //Check to see if the TriggerSetting for EDWContactTrigger IsActive
        if(TriggerState.isActive('EDWContactTrigger'))
            EDWContactTriggerHandler.handleAfterInsert(trigger.new);
    }
        // befoe update
    else if(trigger.isBefore && trigger.isUpdate){
        //Check to see if the TriggerSetting for EDWContactTrigger IsActive
        if(TriggerState.isActive('EDWContactTrigger'))
            EDWContactTriggerHandler.handleBeforeUpdate(trigger.new, trigger.oldMap);
    }
    // after update
    else if(trigger.isAfter && trigger.isUpdate){
        //Check to see if the TriggerSetting for EDWContactTrigger IsActive
        if(TriggerState.isActive('EDWContactTrigger'))
            EDWContactTriggerHandler.handleAfterUpdate(trigger.new, trigger.oldMap);
    }
}