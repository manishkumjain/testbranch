trigger AccountTrigger on Account (before delete, after undelete, before update, after update, before insert,after insert) 
{
    
    //Check to see if the TriggerSetting for AccountTrigger IsActive
    if(TriggerState.isActive('AccountTrigger')) 
    {    
        if(StopRecursiveTriggerCheck__c.getInstance('AccountTrigger')== null || (StopRecursiveTriggerCheck__c.getInstance('AccountTrigger') != null && StopRecursiveTriggerCheck__c.getInstance('AccountTrigger').ExecuteRecursiveCheckCode__c == false))
        {
            //handle before delete event
            if (trigger.isBefore && trigger.isdelete )
            {
                AccountTriggerHandler.handleBeforeDelete(trigger.old, trigger.oldMap);
            }
            
            //handle undelete event
            if (trigger.isAfter && trigger.isUnDelete )
            {
                AccountTriggerHandler.handleAfterUndelete(trigger.new, trigger.newMap);
            }
            
            //handle before update event
            if(trigger.isBefore && trigger.isUpdate) 
            {
                    AccountTriggerHandler.handleBeforeUpdate(trigger.new, trigger.old, trigger.newMap, trigger.OldMap);
            }
            
            //handle After update event
            if(trigger.isAfter && trigger.isUpdate) 
            {
            system.debug('@@@@@afterupdate');
                    AccountTriggerHandler.handleAfterUpdate(trigger.new, trigger.old, trigger.newMap, trigger.OldMap);
            }
          
          //Handle before insert event
            if(trigger.isBefore && trigger.isInsert) 
            {
                AccountTriggerHandler.handleBeforeInsert(trigger.new);
            }
            //Handle After insert event
            if(trigger.isAfter && trigger.isInsert) 
            {
                AccountTriggerHandler.handleAfterInsert(trigger.new);
            }
        }
        else
        {
             //handle before delete event
            if (StopRecursiveTriggers.stopRecursiveAccountBeforeDeleteTrigger == false && trigger.isBefore && trigger.isdelete )
            {
                StopRecursiveTriggers.stopRecursiveAccountBeforeDeleteTrigger = true;
                AccountTriggerHandler.handleBeforeDelete(trigger.old, trigger.oldMap);
            }
            
            //handle undelete event
            if (StopRecursiveTriggers.stopRecursiveAccountAfterUndeleteTrigger == false && trigger.isAfter && trigger.isUnDelete )
            {
                StopRecursiveTriggers.stopRecursiveAccountAfterUndeleteTrigger = true;
                AccountTriggerHandler.handleAfterUndelete(trigger.new, trigger.newMap);
            }
            
            //handle before update event
            if(StopRecursiveTriggers.stopRecursiveAccountBeforeUpdateTrigger == false && trigger.isBefore && trigger.isUpdate) 
            {
                StopRecursiveTriggers.stopRecursiveAccountBeforeUpdateTrigger = true;
                AccountTriggerHandler.handleBeforeUpdate(trigger.new, trigger.old, trigger.newMap, trigger.OldMap);
            }
            
            //handle After update event
            if(StopRecursiveTriggers.stopRecursiveAccountAfterUpdateTrigger == false && trigger.isAfter && trigger.isUpdate) 
            {
                StopRecursiveTriggers.stopRecursiveAccountAfterUpdateTrigger = true;
                AccountTriggerHandler.handleAfterUpdate(trigger.new, trigger.old, trigger.newMap, trigger.OldMap);
            }
          
          //Handle before insert event
            if(StopRecursiveTriggers.stopRecursiveAccountBeforeInsertTrigger == false && trigger.isBefore && trigger.isInsert) 
            {
                StopRecursiveTriggers.stopRecursiveAccountBeforeInsertTrigger = true;
                AccountTriggerHandler.handleBeforeInsert(trigger.new);
            }
            //Handle After insert event
            if(StopRecursiveTriggers.stopRecursiveAccountAfterInsertTrigger == false && trigger.isAfter && trigger.isInsert) 
            {
                StopRecursiveTriggers.stopRecursiveAccountAfterInsertTrigger = true;
                AccountTriggerHandler.handleAfterInsert(trigger.new);
            }
        }
    
    }
    
}