trigger ClubHourTrigger on Club_Hour__c(before insert, after undelete, before delete, after insert, after update, before update) {
    
    //Check to see if the TriggerSetting for ContactTrigger IsActive
    if(TriggerState.isActive('ClubHourTrigger') && ContactTriggerHandler.isDisabled != true) 
    {   
  
        //handle before insert event
        if(trigger.isBefore && trigger.isInsert)
        {
            ClubHourTriggerHandler.handleBeforeInsert(trigger.new);
        }
        
       //handle before update event
        if(trigger.isBefore && trigger.isUpdate)
         {   
            ClubHourTriggerHandler.handleBeforeUpdate(trigger.new, trigger.old, trigger.newMap, trigger.oldMap);  
        }
      
        
     
        
       //handle after update event
        if(trigger.isAfter && trigger.isUpdate) 
        {   
            ClubHourTriggerHandler.handleAfterUpdate(trigger.new, trigger.old, trigger.newMap, trigger.oldMap);  
            
        }
    
            //handle after insert
        if(trigger.isinsert && trigger.isAfter)
        { 
            ClubHourTriggerHandler.handleAfterInsert(trigger.new,Trigger.newMap);    
        }
    }
    
  
    
}