trigger MassCommReptTrigger on Mass_Communication_Recipient__c (before insert,after Insert) {
   
    //Check to see if the TriggerSetting for Mass Communication Recipient object IsActive
    if(TriggerState.isActive('MassCommReptTrigger')) 
    { 
        if(trigger.isAfter && trigger.isInsert)
        {
            MassCommReptTriggerHandler.handleAfterInsert(trigger.new,trigger.newMap);
        }
        if(trigger.isBefore && trigger.isInsert)
        {
            MassCommReptTriggerHandler.handleBeforeInsert(trigger.new);
        }
    }
}