trigger ContentDocumentLinkTrigger on ContentDocumentLink (before insert, after insert) 
{
    //Commented by Lalit - SFDC-8100 - RecordCount on Case was not populating + SendEmail was also not working. 18-10-2019
    /*system.debug('@@@ContentDocumentLinkTrigger');
Set<Id> contentDocumentIdSet = new Set<Id>();
Set<Id> linkedEntityIdSet = new Set<Id>();
for (ContentDocumentLink obj: trigger.new)
{
contentDocumentIdSet.add(obj.ContentDocumentId);
linkedEntityIdSet.add(obj.LinkedEntityId);
} 

List<ContentDocumentLink> lstContentDocumentlink = [SELECT ContentDocumentId, LINKEDENTITYID 
FROM ContentDocumentLink WHERE ContentDocumentId IN:contentDocumentIdSet];


system.debug('@@@lstContentDocumentlink'+lstContentDocumentlink);*/
    //if(lstContentDocumentlink.size()==0)
    //{
    
    //[SFDC-8659] Email to case is not working when there are multiple attachments due to SOQL 101 error. 
    if(Limits.getQueries() <80)
    {
        if(trigger.isBefore && trigger.isInsert)
            ContentDocumentLinkTriggerHandler.handleBeforeInsert(trigger.new);
        
        if(trigger.isAfter && trigger.isInsert)
            ContentDocumentLinkTriggerHandler.handleAfterInsert(trigger.new, trigger.newMap);
    }
    //}
    
}