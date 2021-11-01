// 
// (c) 2014 Appirio, Inc.
//
// Trigger to handle different events of Task
//
// 22 May 2014     Shyam Sundar       Merged
//


trigger TaskTrigger on Task (before insert, before update, after insert, after update, after delete, before delete) 
{

    //Check to see if the TriggerSetting for TaskTrigger IsActive
    if(TriggerState.isActive('TaskTrigger') && TaskTriggerHandler.isEnabled) 
    {   
        if(StopRecursiveTriggerCheck__c.getInstance('TaskTrigger')== null || (StopRecursiveTriggerCheck__c.getInstance('TaskTrigger') != null && StopRecursiveTriggerCheck__c.getInstance('TaskTrigger').ExecuteRecursiveCheckCode__c == false))
        {
            if (trigger.isInsert && trigger.isAfter)
            {
                TaskTriggerHandler.handleAfterInsert(trigger.new, trigger.oldMap);
                
                //Method to update Future and Past Follow up date on Account object. Ticket no:SFDC 1155 By:SK
                PopulateFollowUpDatesOnAccount.PopulateDate(trigger.new, null);

                system.debug('@@@@@@ in after task insert');
                //DigitalSignatureTriggerHandler.handleAfterInsert(trigger.new);
            }
            if (trigger.isUpdate && trigger.isAfter)
            {
                TaskTriggerHandler.handleAfterUpdate(trigger.new, trigger.old, trigger.newMap, trigger.oldMap);
                
                //Method to update Future and Past Follow up date on Account object. Ticket no:SFDC 1155 By:SK
                PopulateFollowUpDatesOnAccount.PopulateDate(trigger.new, null);
            }
            if (trigger.isDelete && trigger.isBefore)
            {
                TaskTriggerHandler.handleBeforeDelete(trigger.old, trigger.oldMap);
            }
            if (trigger.isDelete && trigger.isAfter)
            {
                TaskTriggerHandler.handleAfterDelete(trigger.old, trigger.oldMap);
                
                //Method to update Future and Past Follow up date on Account object. Ticket no:SFDC 1155 By:SK
                PopulateFollowUpDatesOnAccount.PopulateDate(trigger.old, null);
            }
            if (trigger.isInsert && trigger.isBefore)
            {
                TaskTriggerHandler.handleBeforeInsert(trigger.new); //testing..
            }
            if (trigger.isUpdate && trigger.isBefore)
            {
            system.debug('@@@@@@@@@@@@@insert scenario');
            
                TaskTriggerHandler.handleBeforeUpdate(trigger.new, trigger.old, trigger.newMap, trigger.oldMap);
            }
        }
        else
        {
            if (StopRecursiveTriggers.stopRecursiveTaskAfterInsertTrigger == false && trigger.isInsert && trigger.isAfter)
            {
                StopRecursiveTriggers.stopRecursiveTaskAfterInsertTrigger = true;
                TaskTriggerHandler.handleAfterInsert(trigger.new, trigger.oldMap);
                //Method to update Future and Past Follow up date on Account object. Ticket no:SFDC 1155 By:SK
                PopulateFollowUpDatesOnAccount.PopulateDate(trigger.new, null);
                //DigitalSignatureTriggerHandler.handleAfterInsert(trigger.new);
            }
            if (StopRecursiveTriggers.stopRecursiveTaskAfterUpdateTrigger == false && trigger.isUpdate && trigger.isAfter)
            {
                StopRecursiveTriggers.stopRecursiveTaskAfterUpdateTrigger = true;
                TaskTriggerHandler.handleAfterUpdate(trigger.new, trigger.old, trigger.newMap, trigger.oldMap);
                //Method to update Future and Past Follow up date on Account object. Ticket no:SFDC 1155 By:SK
                PopulateFollowUpDatesOnAccount.PopulateDate(trigger.new, null);
            }
            if (StopRecursiveTriggers.stopRecursiveTaskBeforeDeleteTrigger == false && trigger.isDelete && trigger.isBefore)
            {
                StopRecursiveTriggers.stopRecursiveTaskBeforeDeleteTrigger = true;
                TaskTriggerHandler.handleBeforeDelete(trigger.old, trigger.oldMap);
            }
            if (StopRecursiveTriggers.stopRecursiveTaskAfterDeleteTrigger == false && trigger.isDelete && trigger.isAfter)
            {
                StopRecursiveTriggers.stopRecursiveTaskAfterDeleteTrigger = true;
                TaskTriggerHandler.handleAfterDelete(trigger.old, trigger.oldMap);
                //Method to update Future and Past Follow up date on Account object. Ticket no:SFDC 1155 By:SK
                PopulateFollowUpDatesOnAccount.PopulateDate(trigger.old, null);
            }
            if (StopRecursiveTriggers.stopRecursiveTaskBeforeInsertTrigger == false && trigger.isInsert && trigger.isBefore)
            {
                StopRecursiveTriggers.stopRecursiveTaskBeforeInsertTrigger = true;
                TaskTriggerHandler.handleBeforeInsert(trigger.new); //testing..
            }
            if (StopRecursiveTriggers.stopRecursiveTaskBeforeUpdateTrigger == false && trigger.isUpdate && trigger.isBefore)
            {
                StopRecursiveTriggers.stopRecursiveTaskBeforeUpdateTrigger = true;
                TaskTriggerHandler.handleBeforeUpdate(trigger.new, trigger.old, trigger.newMap, trigger.oldMap);
            }
        }
    }
}