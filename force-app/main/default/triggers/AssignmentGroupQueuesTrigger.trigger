trigger AssignmentGroupQueuesTrigger on Assignment_Group_Queues__c (before insert, before update) {
    
    //Check to see if the TriggerSetting for AssignmentGroupQueuesTrigger IsActive
    if(TriggerState.isActive('AssignmentGroupQueuesTrigger')) {   
    //handle before update event
    if (StopRecursiveTriggers.stopRecursiveAGQBeforeInsertTrigger == false && trigger.isBefore && trigger.isUpdate){
        StopRecursiveTriggers.stopRecursiveAGQBeforeInsertTrigger = true;
        AssignmentGroupQueuesTriggerHandler.handleBeforeUpdate(trigger.new, trigger.old, trigger.newMap, trigger.oldMap);
    }
    //handle before update event
    if(StopRecursiveTriggers.stopRecursiveAGQBeforeUpdateTrigger == false && trigger.isBefore && trigger.isInsert) {
        StopRecursiveTriggers.stopRecursiveAGQBeforeUpdateTrigger = true;
        AssignmentGroupQueuesTriggerHandler.handleBeforeInsert(trigger.new);
    }
    }
}