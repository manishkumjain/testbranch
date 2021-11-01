// 
// (c) 2014 Appirio, Inc.
//
// Different events for Case Trigger
//
// 3 Apr 2014     Shyam Sundar       Modified
//

trigger OpportunityTrigger on Opportunity (after undelete, before delete, after insert, after update, after delete, before insert, before update) 
{
    
    //Check to see if the TriggerSetting for OpportunityTrigger IsActive
    if(TriggerState.isActive('OpportunityTrigger') && OpportunityTriggerHandler.isActive)
    {     
        if(StopRecursiveTriggerCheck__c.getInstance('OpportunityTrigger')== null || (StopRecursiveTriggerCheck__c.getInstance('OpportunityTrigger') != null && StopRecursiveTriggerCheck__c.getInstance('OpportunityTrigger').ExecuteRecursiveCheckCode__c == false))
        {
            //Delete related action plans
            if (trigger.isBefore && trigger.isdelete )
            {
                OpportunityTriggerHandler.handleBeforeDelete(trigger.old, trigger.oldMap);
            }
            //Undelete related action plans
            else if (trigger.isAfter && trigger.isUnDelete )
            {
                OpportunityTriggerHandler.handleAfterUndelete(trigger.new, trigger.newMap);
            }
            //Before Insert
            else if (trigger.isBefore && trigger.isInsert )
            {
                OpportunityTriggerHandler.handleBeforeInsert(trigger.new);
            }
            //Before Update
            //SFDC-3616
            else if (trigger.isBefore && trigger.isUpdate )
            {
                System.debug('Trigger.New[0].Last_Follow_Up_Date__c before before update ::::: ' + Trigger.New[0].Last_Follow_Up_Date__c);
                OpportunityTriggerHandler.handleBeforeUpdate(trigger.new, trigger.newMap, trigger.oldMap);
                System.debug('Trigger.New[0].Last_Follow_Up_Date__c after before update ::::: ' + Trigger.New[0].Last_Follow_Up_Date__c);
            }
            //After Insert 
            else if (trigger.isAfter && trigger.isInsert )
            {
                OpportunityTriggerHandler.handleAfterInsert(trigger.new);
            }
            //After Update
            else if (trigger.isAfter && trigger.isUpdate )
            {
            System.debug('Trigger.New[0].Last_Follow_Up_Date__c before after update ::::: ' + Trigger.New[0].Last_Follow_Up_Date__c);
                OpportunityTriggerHandler.handleAfterUpdate(trigger.new, trigger.oldMap);
                //Added by Nitin, to set Contact Owning Trainer based on EDW dates in Opportunity
                //OpportunityTriggerHelperTrainingOwner.handleAfterUpdate(trigger.new, trigger.oldMap);
                System.debug('Trigger.New[0].Last_Follow_Up_Date__c after after update ::::: ' + Trigger.New[0].Last_Follow_Up_Date__c);
            }
            //After Delete
            else if (trigger.isAfter && trigger.isDelete )
            {
                OpportunityTriggerHandler.handleAfterDelete(trigger.old);
            }
        }
        else
        {
            //Delete related action plans
            if (StopRecursiveTriggers.stopRecursiveOpportunityBeforeDeleteTrigger == false && trigger.isBefore && trigger.isdelete )
            {
                StopRecursiveTriggers.stopRecursiveOpportunityBeforeDeleteTrigger = true;
                OpportunityTriggerHandler.handleBeforeDelete(trigger.old, trigger.oldMap);
            }
            //Undelete related action plans
            else if (StopRecursiveTriggers.stopRecursiveOpportunityAfterUndeleteTrigger == false && trigger.isAfter && trigger.isUnDelete )
            {
                StopRecursiveTriggers.stopRecursiveOpportunityAfterUndeleteTrigger = true;
                OpportunityTriggerHandler.handleAfterUndelete(trigger.new, trigger.newMap);
            }
            //Before Insert
            else if (StopRecursiveTriggers.stopRecursiveOpportunityBeforeInsertTrigger == false && trigger.isBefore && trigger.isInsert )
            {
                StopRecursiveTriggers.stopRecursiveOpportunityBeforeInsertTrigger = true;
                OpportunityTriggerHandler.handleBeforeInsert(trigger.new);
            }
            //Before Update
            //SFDC-3616
            else if (StopRecursiveTriggers.stopRecursiveOpportunityBeforeUpdateTrigger == false && trigger.isBefore && trigger.isUpdate )
            {
                StopRecursiveTriggers.stopRecursiveOpportunityBeforeUpdateTrigger = true;
                System.debug('Trigger.New[0].Last_Follow_Up_Date__c before before update ::::: ' + Trigger.New[0].Last_Follow_Up_Date__c);
                OpportunityTriggerHandler.handleBeforeUpdate(trigger.new, trigger.newMap, trigger.oldMap);
                System.debug('Trigger.New[0].Last_Follow_Up_Date__c after before update ::::: ' + Trigger.New[0].Last_Follow_Up_Date__c);
            }
            //After Insert 
            else if (StopRecursiveTriggers.stopRecursiveOpportunityAfterInsertTrigger == false && trigger.isAfter && trigger.isInsert )
            {
                StopRecursiveTriggers.stopRecursiveOpportunityAfterInsertTrigger = true;
                OpportunityTriggerHandler.handleAfterInsert(trigger.new);
            }
            //After Update
            else if (StopRecursiveTriggers.stopRecursiveOpportunityAfterUpdateTrigger == false && trigger.isAfter && trigger.isUpdate )
            {
                StopRecursiveTriggers.stopRecursiveOpportunityAfterUpdateTrigger = true;
                OpportunityTriggerHandler.handleAfterUpdate(trigger.new, trigger.oldMap);
                //Added by Nitin, to set Contact Owning Trainer based on EDW dates in Opportunity
                //OpportunityTriggerHelperTrainingOwner.handleAfterUpdate(trigger.new, trigger.oldMap);
            }
            //After Delete
            else if (StopRecursiveTriggers.stopRecursiveOpportunityAfterDeleteTrigger == false && trigger.isAfter && trigger.isDelete )
            {
                StopRecursiveTriggers.stopRecursiveOpportunityAfterDeleteTrigger = true;
                OpportunityTriggerHandler.handleAfterDelete(trigger.old);
            }
        }
    }
}