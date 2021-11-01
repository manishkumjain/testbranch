trigger ClubTrigger on Club__c (after update, before update,after insert) {

    //Check to see if the TriggerSetting for ClubTrigger IsActive
    if(TriggerState.isActive('ClubTrigger')) {   
    
    
      // Handle after insert event
      if (trigger.isAfter && trigger.isInsert) {
         ClubTriggerHandler.handleAfterInsert(trigger.new, trigger.newMap);
      }
      // Handle after update event
      if (trigger.isAfter && trigger.isUpdate) {
         ClubTriggerHandler.handleAfterUpdate(trigger.new, trigger.oldMap);
      }
    }

}