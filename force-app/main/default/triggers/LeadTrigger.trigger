trigger LeadTrigger on Lead (before insert, after insert, before update, after update, before delete, after undelete) 
{
    
    //Check to see if the TriggerSetting for LeadTrigger IsActive
    if(TriggerState.isActive('LeadTrigger')) 
    {   
        if(StopRecursiveTriggerCheck__c.getInstance('LeadTrigger')== null || (StopRecursiveTriggerCheck__c.getInstance('LeadTrigger') != null && StopRecursiveTriggerCheck__c.getInstance('LeadTrigger').ExecuteRecursiveCheckCode__c == false))
        {
            // before insert
            if(trigger.isBefore && trigger.isInsert)
            {
                LeadTriggerHandler.handleBeforeInsert(trigger.new);
            }
            // handle after insert event
            else if(trigger.isAfter && trigger.isInsert)
            {
                LeadTriggerHandler.handleAfterInsert(trigger.new, trigger.newMap);
            }
            // before update
            else if(trigger.isBefore && trigger.isUpdate)
            {
                LeadTriggerHandler.handleBeforeUpdate(trigger.new, trigger.old, trigger.newMap, trigger.oldMap); 
            }
            // after update
            else if(trigger.isAfter && trigger.isUpdate)
            {
                LeadTriggerHandler.handleAfterUpdate(trigger.new, trigger.old, trigger.newMap, trigger.oldMap);
            }
            // before insert
            else if(trigger.isBefore && trigger.isDelete)
            {
                 LeadTriggerHandler.handleBeforeDelete(trigger.old,trigger.oldMap);
            }
            // before insert
            else if(trigger.isAfter && trigger.isUnDelete)
            {
                 LeadTriggerHandler.handleAfterUndelete(trigger.new, trigger.newMap);
            }
        }
        else
        {
            // before insert
            if(StopRecursiveTriggers.stopRecursiveLeadBeforeInsertTrigger == false && trigger.isBefore && trigger.isInsert)
            {
             StopRecursiveTriggers.stopRecursiveLeadBeforeInsertTrigger = true;
                LeadTriggerHandler.handleBeforeInsert(trigger.new);
            }
            // handle after insert event
            else if(StopRecursiveTriggers.stopRecursiveLeadAfterInsertTrigger == false && trigger.isAfter && trigger.isInsert)
            {
                StopRecursiveTriggers.stopRecursiveLeadAfterInsertTrigger = true;
                LeadTriggerHandler.handleAfterInsert(trigger.new, trigger.newMap);
            }
            // before update
            else if(StopRecursiveTriggers.stopRecursiveLeadBeforeUpdateTrigger == false && trigger.isBefore && trigger.isUpdate)
            {
                StopRecursiveTriggers.stopRecursiveLeadBeforeUpdateTrigger = true;
                LeadTriggerHandler.handleBeforeUpdate(trigger.new, trigger.old, trigger.newMap, trigger.oldMap); 
            }
            // after update
            else if(StopRecursiveTriggers.stopRecursiveLeadAfterUpdateTrigger == false && trigger.isAfter && trigger.isUpdate)
            {
                StopRecursiveTriggers.stopRecursiveLeadAfterUpdateTrigger = true;
                LeadTriggerHandler.handleAfterUpdate(trigger.new, trigger.old, trigger.newMap, trigger.oldMap);
            }
            // before insert
            else if(StopRecursiveTriggers.stopRecursiveLeadBeforeDeleteTrigger == false && trigger.isBefore && trigger.isDelete)
            {
                StopRecursiveTriggers.stopRecursiveLeadBeforeDeleteTrigger = true;
                 LeadTriggerHandler.handleBeforeDelete(trigger.old,trigger.oldMap);
            }
            // before insert
            else if(StopRecursiveTriggers.stopRecursiveLeadAfterUnDeleteTrigger == false && trigger.isAfter && trigger.isUnDelete)
            {
                StopRecursiveTriggers.stopRecursiveLeadAfterUnDeleteTrigger = true;
                 LeadTriggerHandler.handleAfterUndelete(trigger.new, trigger.newMap);
            } 
        }
    }
}