trigger NoteTrigger on Note (before delete, before update,after insert,after update,after delete, before insert) {
    
    //Check to see if the TriggerSetting for NoteTrigger IsActive
    if(TriggerState.isActive('NoteTrigger')) {    
    //handle before delete event
    if (trigger.isBefore && trigger.isdelete ){
        NoteTriggerHandler.handleBeforeDelete(trigger.old, trigger.oldMap);
    }
    
    if (trigger.isAfter && trigger.isdelete ){
        NoteTriggerHandler.handleAfterDelete(trigger.old, trigger.oldMap);
    }
    
    if(trigger.isinsert && trigger.isBefore){
    	NoteTriggerHandler.handleBeforeInsert(Trigger.new);
    }
    
    if(trigger.isinsert && trigger.isAfter){
        NoteTriggerHandler.handleAfterInsert(Trigger.new);    
    }
    
    if(trigger.isUpdate && trigger.isAfter){ 
        NoteTriggerHandler.handleAfterUpdate(Trigger.new);    
    }
    
    }
}