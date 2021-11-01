trigger SubscriptionPipelineTrigger on Subscription_Pipeline__c(before insert, after insert, before update, after update) {

    //Check to see if the TriggerSetting for VoucherPipelineTrigger IsActive
    if(TriggerState.isActive('SubscriptionPipelineTrigger')) {   

    // Before insert
    if(trigger.isBefore && trigger.isInsert){
        SubscriptionPipelineTriggerHandler.beforeInsert(trigger.new);
    }
/*
    // After insert
    if(trigger.isAfter && trigger.isInsert){
         SubscriptionPipelineTriggerHandler.afterInsert(trigger.new);
    }
    
    // Before Update
    else if(trigger.isBefore && trigger.isUpdate){
         SubscriptionPipelineTriggerHandler.beforeUpdate(trigger.new, trigger.oldMap);
    }
    
    // After Update
    else if(trigger.isAfter && trigger.isUpdate){
         SubscriptionPipelineTriggerHandler.afterUpdate(trigger.new, trigger.oldMap);
    } */
   }
}