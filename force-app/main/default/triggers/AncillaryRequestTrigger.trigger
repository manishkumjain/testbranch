trigger AncillaryRequestTrigger on Ancillary_Request__c (after delete, after insert, after undelete, before delete, before insert, before update) {
    
     //Check to see if the TriggerSetting for AncillaryRequestTrigger IsActive
   if(TriggerState.isActive('AncillaryRequestTrigger') && AncillaryRequestTriggerHandler.isDisabled != true) {   
  
    //handle before insert event
    if(trigger.isBefore && trigger.isInsert){
        AncillaryRequestTriggerHandler.handleBeforeInsert(trigger.new);
    }
    
   //handle before update event
    if(trigger.isBefore && trigger.isUpdate) {   
        AncillaryRequestTriggerHandler.handleBeforeUpdate(trigger.new, trigger.old, trigger.newMap, trigger.oldMap);  
    }
    //handle before delete event
    if (trigger.isBefore && trigger.isdelete ){
         // AncillaryRequestTriggerHandler.handleBeforeDelete(trigger.old, trigger.oldMap);     
    }
    
    //handle undelete event
    if (trigger.isAfter && trigger.isUnDelete ){
       // AncillaryRequestTriggerHandler.handleAfterUndelete(trigger.new, trigger.newMap);
    }
    
   //handle after update event
    if(trigger.isAfter && trigger.isUpdate) {   
       // AncillaryRequestTriggerHandler.handleAfterUpdate(trigger.new, trigger.old, trigger.newMap, trigger.oldMap);  
       
    }
    //handle after delete
    if (trigger.isAfter && trigger.isdelete ){  
       
       // AncillaryRequestTriggerHandler.handleAfterDelete(trigger.oldMap);
    }
        //handle after insert
        if(trigger.isinsert && trigger.isAfter){ 
        AncillaryRequestTriggerHandler.handleAfterInsert(Trigger.newMap);    
    }
    }
    
    
}