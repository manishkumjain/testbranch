/* 
AmexBenefit trigger for different database events
19 Sep 2019     Pintoo Jadaun       */

trigger AmexBenefitTrigger on Amex_Benefit__c (before insert,after Update) {
    
    //Check to see if the TriggerSetting for AmexBenefitTrigger IsActive
    if(TriggerState.isActive('AmexBenefitTrigger')) 
    {   
        // before insert
        if(trigger.isBefore && trigger.isInsert){
            AmexBenefitTriggerHandler.beforeInsert(trigger.new);
        }
        else if(trigger.isAfter && trigger.isUpdate){
            AmexBenefitTriggerHandler.handleAfterUpdate(trigger.new, trigger.old, trigger.newMap, trigger.oldMap);  
        }
    }
}