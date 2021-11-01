// 
// (c) 2014 Appirio, Inc.
//
// Voucher__c trigger for different database events
//
// 19 Mar 2014     Shyam Sundar       Original
//

trigger VoucherTrigger on Voucher__c (after insert,after update) {

    //Check to see if the TriggerSetting for VoucherTrigger IsActive
    if(TriggerState.isActive('VoucherTrigger')) {   

    // after update
    if(trigger.isAfter && trigger.isUpdate){
         VoucherTriggerHandler.handleAfterUpdate(trigger.new, trigger.old, trigger.newMap, trigger.oldMap);
        }
        if(trigger.isAfter && trigger.isInsert){
          VoucherTriggerHandler.handleAfterInsert(trigger.new,trigger.newMap);
        }    
    }
}