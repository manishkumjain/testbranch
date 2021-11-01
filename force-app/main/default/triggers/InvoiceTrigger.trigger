/* 
   Invoice trigger for different database events
   13 June 2018     Pintoo Jadaun       */

trigger InvoiceTrigger on Invoice__c (before insert, after insert, before update, after undelete, before delete,after delete, after update) {
    
    //Check to see if the TriggerSetting for InvoiceTrigger IsActive
    if(TriggerState.isActive('InvoiceTrigger')) 
    {   
        // before insert
        if(trigger.isBefore && trigger.isInsert){
             InvoiceTriggerHandler.beforeInsert(trigger.new);
        }
        // after insert
        else if(trigger.isAfter && trigger.isInsert){
            InvoiceTriggerHandler.afterInsert(trigger.new, trigger.oldMap);
        }
        // before update
        else if(trigger.isBefore && trigger.isUpdate){

            InvoiceTriggerHandler.beforeUpdate(trigger.new, trigger.oldMap);
        }
        // after update
        else if(trigger.isAfter && trigger.isUpdate){
            InvoiceTriggerHandler.afterUpdate(trigger.new, trigger.oldMap);
        }
        // Before Delete
        else if(trigger.isBefore && trigger.isDelete){
             InvoiceTriggerHandler.beforeDelete(trigger.old);
        }
        // After Delete
        else if(trigger.isAfter && trigger.isDelete){
             InvoiceTriggerHandler.afterDelete(trigger.old);
        }
        // After UnDelete
        else if(trigger.isAfter && trigger.isUnDelete){
             InvoiceTriggerHandler.afterUnDelete(trigger.new);
        }
        
    }
}