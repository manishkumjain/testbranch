trigger TrialTrigger on Trial__c (after delete, after insert, after undelete, 
after update, before delete, before insert, before update) {

    //Check to see if the TriggerSetting for TrialTrigger IsActive
    if(TriggerState.isActive('TrialTrigger')) {   
    
    //handle After 
    if (trigger.isAfter){
        //Handle before insert event
        if(trigger.isInsert) {
            TrialTriggerHandler.handleAfterInsert(trigger.new);
        } else if(trigger.isUpdate) {
            TrialTriggerHandler.handleAfterUpdate(trigger.new, trigger.OldMap);
        }
    }
    //handle Before- Vinay
    if(trigger.isBefore)
    {
        if (trigger.isUpdate)        
            TrialTriggerHandler.handleBeforeUpdate(trigger.new);
    }
    
    if(trigger.isAfter && trigger.isDelete){
    	TrialTriggerHandler.handleAfterDelete(trigger.old,trigger.OldMap);
    }   
    }
    
}