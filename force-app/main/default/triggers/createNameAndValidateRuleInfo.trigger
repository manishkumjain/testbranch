trigger createNameAndValidateRuleInfo on UnfollowRule__c (before insert, before update) {
    
    if(trigger.isBefore && trigger.isInsert){
        UnfollowRuleTriggerHandler.handleBeforeInsert(trigger.new);
    } else if(trigger.isBefore && trigger.isUpdate){
        UnfollowRuleTriggerHandler.handleBeforeUpdate(trigger.new, trigger.old, trigger.newMap, trigger.oldMap);
    }   
}