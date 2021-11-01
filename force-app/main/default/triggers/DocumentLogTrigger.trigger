trigger DocumentLogTrigger on Document_Log__c (after insert) {
 
    //Check to see if the TriggerSetting for DocumentLogTriggerIsActive
    if(TriggerState.isActive('DocumentLogTrigger')) {   
    
    if(trigger.isAfter && trigger.isInsert){
        DocumentLogTriggerHandler.handleAfterInsert(trigger.new);
    }
    }
}