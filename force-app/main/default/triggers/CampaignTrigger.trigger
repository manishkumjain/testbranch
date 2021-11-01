trigger CampaignTrigger on Campaign (after undelete, before delete,after insert,before update,after update) {
    
    //Check to see if the TriggerSetting for CampaignTrigger IsActive
    if(TriggerState.isActive('CampaignTrigger')) {   
    
    if(trigger.isAfter && trigger.isInsert){
        CampaignTriggerHandler.handleAfterInsert(trigger.new);
    }
     
    if(trigger.isAfter && trigger.isUpdate)  {
       CampaignTriggerHandler.handleAfterUpdate(trigger.new, trigger.old, trigger.newMap, trigger.oldMap);
    }  
    
    //handle before delete event
    if ( trigger.isBefore && trigger.isdelete ){
        CampaignTriggerHandler.handleBeforeDelete(trigger.old, trigger.oldMap);
    }
    
    //handle after undelete event
    if ( trigger.isAfter && trigger.isUnDelete ){
        CampaignTriggerHandler.handleAfterUndelete(trigger.new, trigger.newMap);
    }
    }

}