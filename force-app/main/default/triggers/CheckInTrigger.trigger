// 
// (c) 2014 Appirio, Inc.
//
// CheckIn Trigger 
//
// 26 June 2014     Arpita Bose      Original   T-289489
//
trigger CheckInTrigger on Check_In__c (after insert, before insert, before update,after delete) {

    //Check to see if the TriggerSetting for CheckInTrigger IsActive
    if(TriggerState.isActive('CheckInTrigger')) {   
    
	    // Handle after insert event
	    if (trigger.isAfter && trigger.isInsert) {
	        CheckInTriggerHandler.handleAfterInsert(trigger.new);
	    }
	    // Handle before insert event
	    else if (trigger.isBefore && trigger.isInsert) {
	        CheckInTriggerHandler.handleBeforeInsert(trigger.new);
	    }
	    // Handle before update event
	    else if (trigger.isBefore && trigger.isUpdate) {
	        CheckInTriggerHandler.handleBeforeUpdate(trigger.new, trigger.oldMap);
	    }
        // after delete
	    else if(trigger.isAfter && trigger.isDelete){
	         CheckInTriggerHandler.handleAfterDelete(trigger.old,trigger.oldMap);
	    }
    }

}