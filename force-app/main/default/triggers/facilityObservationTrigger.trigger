trigger facilityObservationTrigger on Facility_Observations__c (before insert,before update) { 

//Check to see if the TriggerSetting for VoucherTrigger IsActive
    if(TriggerState.isActive('facilityObservationTrigger')) 
    {   

        if (trigger.isInsert && trigger.isBefore)
        {
            FacilityObservationTriggerHandler.handleBeforeInsert(trigger.new); //testing..
        }
    }

}