//Modified by: Sumitab Saxena for SFDC-3918,SFDC-3940 Line No:12-15
trigger AttachmentTrigger on Attachment (before insert, after insert, after delete) 
{
     if(TriggerState.isActive('UpdateCaseStatusFromAttachmentTrigger')) 
     {
          if(trigger.isBefore && trigger.isInsert)
          {
            AttachmentTriggerHandler.handleBeforeInsert(trigger.new);
          }
     }
     //Code added by: Sumitab Saxena for SFDC-3918,SFDC-3940
     if(trigger.isAfter && trigger.isInsert)
     {
        AttachmentTriggerHandler.handleAfterInsert(trigger.new, trigger.newMap);
     }
     
      //SFDC-7034
     if(Trigger.IsDelete && Trigger.IsAfter)
     {        
         AttachmentTriggerHandler.handleAfterDelete(Trigger.old);
     }
    
}