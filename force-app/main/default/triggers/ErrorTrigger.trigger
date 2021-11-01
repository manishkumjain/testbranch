trigger ErrorTrigger on Error__c (after insert) 
{
    ErrorTriggerHandler.handleAfterInsert(Trigger.New);
}