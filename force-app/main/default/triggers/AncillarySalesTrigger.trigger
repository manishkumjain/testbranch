// 
// (c) 2014 Appirio, Inc.
//
// AnsillarySales trigger for different database events
//
// 24 June 2014     Shyam Sundar       Original
//

trigger AncillarySalesTrigger on EDW_Ancillary_Sales__c (before insert, before update) {
    
    //Check to see if the TriggerSetting for AncillarySalesTrigger IsActive
    if(TriggerState.isActive('AncillarySalesTrigger')) {   
    
    // Before insert
    if(trigger.isBefore && trigger.isInsert){
         AncillarySalesTriggerHandler.beforeInsert(trigger.new);
    }

    
    // Before Update
    else if(trigger.isBefore && trigger.isUpdate){
         AncillarySalesTriggerHandler.beforeUpdate(trigger.new, trigger.oldMap);
    }
    }

}