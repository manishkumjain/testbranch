// 
// (c) 2014 Appirio, Inc.
//
// VoucherPipelineTrigger trigger for different database events
//
// 28 Apr 2014     Shyam Sundar       Original
//

trigger VoucherPipelineTrigger on Voucher_Pipeline__c (before insert, after insert, before update, after update) {

    //Check to see if the TriggerSetting for VoucherPipelineTrigger IsActive
    if(TriggerState.isActive('VoucherPipelineTrigger')) {   

    // Before insert
    if(trigger.isBefore && trigger.isInsert){
         VoucherPipelineTriggerHandler.beforeInsert(trigger.new);
    }

    // After insert
    if(trigger.isAfter && trigger.isInsert){
         VoucherPipelineTriggerHandler.afterInsert(trigger.new);
    }
    
    // Before Update
    else if(trigger.isBefore && trigger.isUpdate){
         VoucherPipelineTriggerHandler.beforeUpdate(trigger.new, trigger.oldMap);
    }
    
    // After Update
    else if(trigger.isAfter && trigger.isUpdate){
         VoucherPipelineTriggerHandler.afterUpdate(trigger.new, trigger.oldMap);
    }
    }
}