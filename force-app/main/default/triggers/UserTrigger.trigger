// 
// (c) 2014 Appirio, Inc.
//
// User trigger for different database events
//
// 27 Mar 2014     Shyam Sundar       Original/Merged
//

trigger UserTrigger on User (before insert, before update, after insert, after update) {

    //Check to see if the TriggerSetting for UserTrigger IsActive
    if(TriggerState.isActive('UserTrigger')) {   
    
        // handle after insert event
        if(StopRecursiveTriggers.stopRecursiveUserAfterInsertTrigger == false && trigger.isAfter && trigger.isInsert){
            System.debug('User After Insert');
            StopRecursiveTriggers.stopRecursiveUserAfterInsertTrigger = true;
            UserTriggerHandler.handleAfterInsert(trigger.new, trigger.newMap);
        }
        else if(StopRecursiveTriggers.stopRecursiveUserAfterUpdateTrigger == false &&trigger.isAfter && trigger.isUpdate){
             System.debug('User After Update');
            StopRecursiveTriggers.stopRecursiveUserAfterUpdateTrigger = true;
            UserTriggerHandler.handleAfterUpdate(trigger.new, trigger.old, trigger.newMap, trigger.oldMap);
        }
        //Before Insert
        else if(StopRecursiveTriggers.stopRecursiveUserBeforeInsertTrigger == false && trigger.isBefore && trigger.isInsert ){
            System.debug('User Before Insert');
            StopRecursiveTriggers.stopRecursiveUserBeforeInsertTrigger = true;
              UserTriggerHandler.handleBeforeInsert(trigger.new);
        }
          //Before Update
        else if(StopRecursiveTriggers.stopRecursiveUserBeforeUpdateTrigger == false && trigger.isBefore && trigger.isUpdate ){
            System.debug('User Before Update');
            StopRecursiveTriggers.stopRecursiveUserBeforeUpdateTrigger = true;
              UserTriggerHandler.handleBeforeUpdate(trigger.new, trigger.old,trigger.newMap,trigger.oldMap);
        }
    }
}