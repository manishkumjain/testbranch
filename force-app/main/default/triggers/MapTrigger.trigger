trigger MapTrigger on MAPs__c (before insert,before update, after update, after insert) {

    //Check to see if the TriggerSetting for MapTrigger IsActive
    if(TriggerState.isActive('MapTrigger ') && MapTriggerHandler.isDisabled != true) {   
    
      //before insert
      if(trigger.isBefore && trigger.isInsert){
            MapTriggerHandler.handleBeforeInsert(trigger.new);
      }
      
      //before update
      if(trigger.isBefore && trigger.isUpdate){
           MapTriggerHandler.handleBeforeUpdate(trigger.new, trigger.old, trigger.newMap, trigger.oldMap);
      }
      
     // after update
      if(trigger.isAfter && trigger.isUpdate){
           MapTriggerHandler.handleAfterUpdate(trigger.new, trigger.old, trigger.newMap, trigger.oldMap);
      } 
      
      //after insert
      if(trigger.isAfter && trigger.isInsert){
           MapTriggerHandler.handleAfterInsert(trigger.new, trigger.oldMap);
      }
      
     /* // after delete
      if(trigger.isAfter && trigger.isDelete){
           MapTriggerHandler.handleAfterDelete(trigger.old,trigger.oldMap);
      } */
    }
}