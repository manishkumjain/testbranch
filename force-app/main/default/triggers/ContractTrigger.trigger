trigger ContractTrigger on Contract (after undelete, before delete) {

    //Check to see if the TriggerSetting for ContractTrigger IsActive
    if(TriggerState.isActive('ContractTrigger')) {   

    set<ID>         cIds    = new set<ID>();
    List<String>    apIds   = new List<String>();
   // List<ActionPlan__c> deletePermantently_apIds= new List<ActionPlan__c>();    
    //handle before delete event
    if (trigger.isBefore && trigger.isdelete ){
        ContractTriggerHandler.handleBeforeDelete(trigger.old, trigger.oldMap);
    }
    
    //handle after undelete event
    if (trigger.isAfter && trigger.isUnDelete ){
        ContractTriggerHandler.handleAfterUndelete(trigger.new, trigger.newMap);
    }
    }

}