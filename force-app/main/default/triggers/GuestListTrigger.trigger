// 
// (c) 2014 Appirio, Inc.
//
// GuestList Trigger
//
// 13 May 2014     Parul Gupta      Original
// 5 June 2014     Shyam Sundar     Modified
//
trigger GuestListTrigger on Guest_List__c (before insert, after update, after insert) {
	
    //Check to see if the TriggerSetting for GuestListTriggerIsActive
    if(TriggerState.isActive('GuestListTrigger')) {   
    	
    	TriggerFactory.executeHandler(Guest_List__c.sObjectType);
    }
}