trigger ContentDocumentTrigger on ContentDocument (before delete, after delete) 
{
    
    if(Trigger.IsDelete && Trigger.IsBefore)
    {
        ContentDocumentTriggerHandler.handleBeforeDelete(Trigger.old);
        
        
        
    }  
    
    if(Trigger.IsDelete && Trigger.IsAfter)
    {
        
         ContentDocumentTriggerHandler.handleAfterDelete(Trigger.old);
    }
}