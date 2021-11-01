trigger ContractActionExtensionTrigger on Contract_Action_Extension__c (before insert) {
    
    if(TriggerState.isActive('ContractActionExtensionTrigger')) {   
      //handle before insert event
    if(trigger.isBefore && trigger.isInsert){
        ContractActionExtensionTriggerHandler.handleBeforeInsert(trigger.new);
    }
    }
}