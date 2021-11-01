trigger EquifitTrigger on Equifit__c(before insert, after undelete, before delete, after insert, after update, before update) {
    
    //Check to see if the TriggerSetting for ContactTrigger IsActive
   if(TriggerState.isActive('EquifitTrigger') && EquifitTriggerHandler.isDisabled != true) {   
  
    //handle before insert event
    if(trigger.isBefore && trigger.isInsert){
        EquifitTriggerHandler.handleBeforeInsert(trigger.new);
    }
    
   //handle before update event
    if(trigger.isBefore && trigger.isUpdate) {   
        EquifitTriggerHandler.handleBeforeUpdate(trigger.new, trigger.old, trigger.newMap, trigger.oldMap);  
    }
    //handle before delete event
    if (trigger.isBefore && trigger.isdelete ){
         // EquifitTriggerHandler.handleBeforeDelete(trigger.old, trigger.oldMap);     
    }
    
    //handle undelete event
    if (trigger.isAfter && trigger.isUnDelete ){
       // EquifitTriggerHandler.handleAfterUndelete(trigger.new, trigger.newMap);
    }
    
   //handle after update event
    if(trigger.isAfter && trigger.isUpdate) {   
       // EquifitTriggerHandler.handleAfterUpdate(trigger.new, trigger.old, trigger.newMap, trigger.oldMap);  
       
    }
    //handle after delete
    if (trigger.isAfter && trigger.isdelete ){  
       
       // EquifitTriggerHandler.handleAfterDelete(trigger.oldMap);
    }
        //handle after insert
        if(trigger.isinsert && trigger.isAfter){ 
        EquifitTriggerHandler.handleAfterInsert(Trigger.newMap);    
    }
    }
    
  
    
}