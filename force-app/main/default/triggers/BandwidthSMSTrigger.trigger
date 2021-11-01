trigger BandwidthSMSTrigger on SMS__c (before insert, after insert) 
{
    if(TriggerState.isActive('BandwidthSMSTrigger')) 
    {
        if (trigger.isBefore && trigger.isinsert && SendSMSUtilityClass.stopBandwidthSMSTrigger != true)
        {
            BandwidthSMSTriggerHandler.handleBeforeInsert(trigger.new);
        }
        if (trigger.isAfter && trigger.isinsert && SendSMSUtilityClass.stopBandwidthSMSTrigger != true)
        {
            BandwidthSMSTriggerHandler.handleAfterInsert(trigger.new);
        }
    }

}