trigger UnfollowRuleTrigger on UnfollowRule__c (before insert, before update) {

    //Check to see if the TriggerSetting for UnfollowRuleTrigger IsActive
    if(TriggerState.isActive('UnfollowRuleTrigger')) {   
    
    if(trigger.isBefore && trigger.isInsert){
        UnfollowRuleTriggerHandler.handleBeforeInsert(trigger.new);
    } else if(trigger.isBefore && trigger.isUpdate){
        UnfollowRuleTriggerHandler.handleBeforeUpdate(trigger.new, trigger.old, trigger.newMap, trigger.oldMap);
    }  
    }
}