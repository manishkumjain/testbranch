// 
// (c) 2014 Appirio, Inc.
//
// Event trigger for different database events
//
// 19 Mar 2014     Shyam Sundar       Original
//

trigger EventTrigger on Event (after update, after insert, before insert, before update,after delete) 
{
    
    //Check to see if the TriggerSetting for EventTrigger IsActive
    if(TriggerState.isActive('EventTrigger') && EventTriggerHandler.isDisabled != true) 
    {   
        if(StopRecursiveTriggerCheck__c.getInstance('EventTrigger')== null || (StopRecursiveTriggerCheck__c.getInstance('EventTrigger') != null && StopRecursiveTriggerCheck__c.getInstance('EventTrigger').ExecuteRecursiveCheckCode__c == false))
        {
            // after update
            if(trigger.isAfter && trigger.isUpdate)
            {
                 EventTriggerHandler.handleAfterUpdate(trigger.new, trigger.old, trigger.newMap, trigger.oldMap);             
                 //Method to update Future and Past Follow up date on Account object. Ticket no:SFDC 1155 By:SK
                 PopulateFollowUpDatesOnAccount.PopulateDate(null, trigger.new);
            }
            
            //after insert
            if(trigger.isAfter && trigger.isInsert)
            {
                 EventTriggerHandler.handleAfterInsert(trigger.new, trigger.oldMap);
                 //Method to update Future and Past Follow up date on Account object. Ticket no:SFDC 1155 By:SK
                 PopulateFollowUpDatesOnAccount.PopulateDate(null, trigger.new);
            }
            
            //before insert
            if(trigger.isBefore && trigger.isInsert)
            {
                 EventTriggerHandler.handleBeforeInsert(trigger.new);
            }
            
            //before update
            if(trigger.isBefore && trigger.isUpdate)
            {
                 EventTriggerHandler.handleBeforeUpdate(trigger.new, trigger.old, trigger.newMap, trigger.oldMap);
            }
            
            // after delete
            if(trigger.isAfter && trigger.isDelete)
            {
                 EventTriggerHandler.handleAfterDelete(trigger.old,trigger.oldMap);
                 //Method to update Future and Past Follow up date on Account object. Ticket no:SFDC 1155 By:SK
                 PopulateFollowUpDatesOnAccount.PopulateDate(null, trigger.old);
            }
        } 
        else
        {
            // after update
            if(StopRecursiveTriggers.stopRecursiveEventAfterUpdateTrigger == false && trigger.isAfter && trigger.isUpdate)
            {
                StopRecursiveTriggers.stopRecursiveEventAfterUpdateTrigger = true;
                 EventTriggerHandler.handleAfterUpdate(trigger.new, trigger.old, trigger.newMap, trigger.oldMap);             
                 //Method to update Future and Past Follow up date on Account object. Ticket no:SFDC 1155 By:SK
                 PopulateFollowUpDatesOnAccount.PopulateDate(null, trigger.new);
            }
            
            //after insert
            if(StopRecursiveTriggers.stopRecursiveEventAfterInsertTrigger == false && trigger.isAfter && trigger.isInsert)
            {
                StopRecursiveTriggers.stopRecursiveEventAfterInsertTrigger = true;
                 EventTriggerHandler.handleAfterInsert(trigger.new, trigger.oldMap);
                 //Method to update Future and Past Follow up date on Account object. Ticket no:SFDC 1155 By:SK
                 PopulateFollowUpDatesOnAccount.PopulateDate(null, trigger.new);
            }
            
            //before insert
            if(StopRecursiveTriggers.stopRecursiveEventBeforeInsertTrigger == false && trigger.isBefore && trigger.isInsert)
            {
                StopRecursiveTriggers.stopRecursiveEventBeforeInsertTrigger = true;
                 EventTriggerHandler.handleBeforeInsert(trigger.new);
            }
            
            //before update
            if(StopRecursiveTriggers.stopRecursiveEventBeforeUpdateTrigger == false && trigger.isBefore && trigger.isUpdate)
            {
                StopRecursiveTriggers.stopRecursiveEventBeforeUpdateTrigger = true;
                 EventTriggerHandler.handleBeforeUpdate(trigger.new, trigger.old, trigger.newMap, trigger.oldMap);
            }
            
            // after delete
            if(StopRecursiveTriggers.stopRecursiveEventAfterDeleteTrigger == false && trigger.isAfter && trigger.isDelete)
            {
                StopRecursiveTriggers.stopRecursiveEventAfterDeleteTrigger = true;
                 EventTriggerHandler.handleAfterDelete(trigger.old,trigger.oldMap);
                 //Method to update Future and Past Follow up date on Account object. Ticket no:SFDC 1155 By:SK
                 PopulateFollowUpDatesOnAccount.PopulateDate(null, trigger.old);
            }
        }   
    }
}