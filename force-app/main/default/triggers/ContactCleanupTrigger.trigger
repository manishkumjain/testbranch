trigger ContactCleanupTrigger on Contact_Clean_Up__c (after delete, after insert,  
after update, before delete, before insert, before update) {
    public static Boolean isActive = true;
   //Check to see if the TriggerSetting for ContactCleanup IsActive
    if(TriggerState.isActive('OpportunityTrigger') && OpportunityTriggerHandler.isActive) {                            
        if (trigger.isBefore && trigger.isUpdate ){
            ContactCleanupTriggerHandler.handleBeforeUpdate(trigger.new, trigger.newMap, trigger.oldMap);
        }
        else if (trigger.isBefore && trigger.isInsert ){
            ContactCleanupTriggerHandler.handleBeforeInsert(trigger.new);
        }
        //handle after insert
        if(trigger.isinsert && trigger.isAfter){ 
            ContactCleanupTriggerHandler.handleAfterInsert(Trigger.newMap);    
        }
        //handle after update event
        if(trigger.isAfter && trigger.isUpdate) {   
            ContactCleanupTriggerHandler.handleAfterUpdate(trigger.new, trigger.old, trigger.newMap, trigger.oldMap);  
        }
    }
}