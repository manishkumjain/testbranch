trigger EDWContractActionTrigger on EDW_Contract_Action__c (after insert,  
after update, before insert, before update) {
    //Check to see if the TriggerSetting for EDWContractActionTrigger IsActive
    if(TriggerState.isActive('EDWContractActionTrigger')) {   
    
        if (!EDWContractActionTriggerHandler.isDisabled) {
            TriggerFactory.executeHandler(EDW_Contract_Action__c.sObjectType);
        }
    }
}