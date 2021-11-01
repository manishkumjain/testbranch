trigger ContactTrigger on Contact (before insert, after undelete, before delete, after insert, after update, before update) 
{
    Boolean isCloudJobScenario = false; //Executing Non Optimization logic in MOSO to Engage sync jobs
    //Check to see if the TriggerSetting for ContactTrigger IsActive
    if(TriggerState.isActive('ContactTrigger') && ContactTriggerHandler.isDisabled != true) 
    {   
        if((trigger.isInsert || trigger.isUpdate) && String.isNotEmpty(trigger.new[0].Job_Name__c) )
            isCloudJobScenario = true;
    
        if((StopRecursiveTriggerCheck__c.getInstance('ContactTrigger')== null || (StopRecursiveTriggerCheck__c.getInstance('ContactTrigger') != null && StopRecursiveTriggerCheck__c.getInstance('ContactTrigger').ExecuteRecursiveCheckCode__c == false))|| isCloudJobScenario)
        {
            system.debug('old logic');
            //handle before insert event
            if(trigger.isBefore && trigger.isInsert)
            {
                ContactTriggerHandler.handleBeforeInsert(trigger.new);
            }
            
           //handle before update event
            if(trigger.isBefore && trigger.isUpdate) 
            {   
                ContactTriggerHandler.handleBeforeUpdate(trigger.new, trigger.old, trigger.newMap, trigger.oldMap);  
            }
            //handle before delete event
            if (trigger.isBefore && trigger.isdelete )
            {
                  ContactTriggerHandler.handleBeforeDelete(trigger.old, trigger.oldMap);     
            }
            
            //handle undelete event
            if (trigger.isAfter && trigger.isUnDelete )
            {
                ContactTriggerHandler.handleAfterUndelete(trigger.new, trigger.newMap);
            }
            
           //handle after update event
            if(trigger.isAfter && trigger.isUpdate) 
            {   
                ContactTriggerHandler.handleAfterUpdate(trigger.new, trigger.old, trigger.newMap, trigger.oldMap);  
                //ContactTriggerHandler.populateContactHistoryObject(trigger.new, trigger.oldMap);
            }
            //handle after delete
            if (trigger.isAfter && trigger.isdelete )
            {  
                system.debug('AfterDeleteTrigggerCalled');
                ContactTriggerHandler.handleAfterDelete(trigger.oldMap);
            }
            //handle after insert
            if(trigger.isinsert && trigger.isAfter)
            { 
            ContactTriggerHandler.handleAfterInsert(Trigger.newMap);    
            }
        }
        else
        {        
            system.debug('optimization logic');
            system.debug('StopRecursiveTriggers.stopRecursiveContactBeforeInsertTrigger' + StopRecursiveTriggers.stopRecursiveContactBeforeInsertTrigger);      
            system.debug('StopRecursiveTriggers.stopRecursiveContactBeforeUpdateTrigger ' + StopRecursiveTriggers.stopRecursiveContactBeforeUpdateTrigger);          
            //handle before insert event
            if(trigger.isBefore && trigger.isInsert && StopRecursiveTriggers.stopRecursiveContactBeforeInsertTrigger == false)
            {
                System.debug('Inside Before Insert Trigger');
                StopRecursiveTriggers.stopRecursiveContactBeforeInsertTrigger = true;
                ContactTriggerHandler.handleBeforeInsert(trigger.new);
                System.debug('Before Insert trigger.newMap[0].Accountid:::: ' + trigger.new[0].Accountid);
            }
           //handle before update event
            if(StopRecursiveTriggers.stopRecursiveContactBeforeUpdateTrigger == false && trigger.isBefore && trigger.isUpdate) 
            {   
                System.debug('Before Update trigger.newMap.Values()[0].Accountid:::: ' + trigger.newMap.Values()[0].Accountid);
                StopRecursiveTriggers.stopRecursiveContactBeforeUpdateTrigger = true;
                ContactTriggerHandler.handleBeforeUpdate(trigger.new, trigger.old, trigger.newMap, trigger.oldMap);  
            }
            //handle before delete event
            if (StopRecursiveTriggers.stopRecursiveContactBeforeDeleteTrigger == false && trigger.isBefore && trigger.isdelete )
            {
                StopRecursiveTriggers.stopRecursiveContactBeforeDeleteTrigger = true;
                ContactTriggerHandler.handleBeforeDelete(trigger.old, trigger.oldMap);     
            }
            
            //handle undelete event
            if (StopRecursiveTriggers.stopRecursiveContactAfterUndeleteTrigger == false && trigger.isAfter && trigger.isUnDelete )
            {
                StopRecursiveTriggers.stopRecursiveContactAfterUndeleteTrigger = true;
                ContactTriggerHandler.handleAfterUndelete(trigger.new, trigger.newMap);
            }
            
           //handle after update event
            if(StopRecursiveTriggers.stopRecursiveContactAfterUpdateTrigger == false && trigger.isAfter && trigger.isUpdate) 
            {   
                System.debug('After Update trigger.newMap.Values()[0].Accountid:::: ' + trigger.newMap.Values()[0].Accountid);
                StopRecursiveTriggers.stopRecursiveContactAfterUpdateTrigger = true;
                ContactTriggerHandler.handleAfterUpdate(trigger.new, trigger.old, trigger.newMap, trigger.oldMap);  
                //ContactTriggerHandler.populateContactHistoryObject(trigger.new, trigger.oldMap);
            }
            //handle after delete
            if (StopRecursiveTriggers.stopRecursiveContactAfterDeleteTrigger == false && trigger.isAfter && trigger.isdelete )
            {  
                StopRecursiveTriggers.stopRecursiveContactAfterDeleteTrigger = true;
                system.debug('AfterDeleteTrigggerCalled');
                ContactTriggerHandler.handleAfterDelete(trigger.oldMap);
            }
                //handle after insert
            if(StopRecursiveTriggers.stopRecursiveContactAfterInsertTrigger == false && trigger.isinsert && trigger.isAfter)
            { 
                
                StopRecursiveTriggers.stopRecursiveContactAfterInsertTrigger = true;
                ContactTriggerHandler.handleAfterInsert(Trigger.newMap); 
                System.debug('After Insert trigger.newMap.Values()[0].Accountid:::: ' + trigger.newMap.Values()[0].Accountid);   
            }   
        }
        
    }
    
  
    
}