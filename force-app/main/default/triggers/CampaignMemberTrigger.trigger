trigger CampaignMemberTrigger on CampaignMember (before insert, before update, after insert, after update, after delete, before delete) {

    //Check to see if the TriggerSetting for CampaignMemberTrigger IsActive
    if(TriggerState.isActive('CampaignMemberTrigger')) {   
    
        if (trigger.isInsert && trigger.isBefore){
            CampaignMemberTriggerHandler.handleBeforeInsert(trigger.new);
        }
        /* Code for other events commented, Remove specific event from comment block as needed in future
        if (trigger.isUpdate && trigger.isBefore){     
            CampaignMemberTriggerHandler.handleBeforeUpdate(trigger.new, trigger.old, trigger.newMap, trigger.oldMap);
        }
        if (trigger.isInsert && trigger.isAfter){
            CampaignMemberTriggerHandler.handleAfterInsert(trigger.new, trigger.oldMap);
        }
        if (trigger.isUpdate && trigger.isAfter){
            CampaignMemberTriggerHandler.handleAfterUpdate(trigger.new, trigger.old, trigger.newMap, trigger.oldMap);
        }
        if (trigger.isDelete && trigger.isBefore){
            CampaignMemberTriggerHandler.handleBeforeDelete(trigger.old, trigger.oldMap);
        }
        if (trigger.isDelete && trigger.isAfter){
            CampaignMemberTriggerHandler.handleAfterDelete(trigger.old, trigger.oldMap);
        }
        */
    }
}