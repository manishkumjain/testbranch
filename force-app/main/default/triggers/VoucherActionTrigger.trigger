// 
// Voucher Action Trigger
//
// 13 Dec 2018     Nitin Mahajan     Original
// 26 Feb 2019     Nitin Mahajan     Modified
//
trigger VoucherActionTrigger on Voucher_Action__c (before insert, before update, after insert, after update) {
    system.debug('###Trigger state');
    //if(TriggerState.isActive('VoucherActionTrigger')) {   
        if(trigger.isinsert && trigger.isBefore){
            system.debug('###Trigger handleBeforeInsert');
            if(TriggerState.isActive('VoucherActionTrigger'))
            	VoucherActionTriggerHandler.handleBeforeInsert(Trigger.new);
        }
        if(trigger.isupdate && trigger.isBefore){
            system.debug('###Trigger handleBeforeUpdate');
            if(TriggerState.isActive('VoucherActionTrigger'))
            	VoucherActionTriggerHandler.handleBeforeUpdate(Trigger.new, Trigger.old, Trigger.oldMap);
        }
        if(trigger.isinsert && trigger.isAfter){
            system.debug('###Trigger handleAfterInsert');
            if(TriggerState.isActive('VoucherActionTrigger'))
            	VoucherActionTriggerHandler.handleAfterInsert(trigger.new, trigger.oldMap);
        }
        if(trigger.isupdate && trigger.isAfter){
            system.debug('###Trigger handleAfterUpdate');
            if(TriggerState.isActive('VoucherActionTrigger'))
            	VoucherActionTriggerHandler.handleAfterUpdate(trigger.new, trigger.old, trigger.newMap, trigger.oldMap); 
        }
}