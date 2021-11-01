// 
// (c) 2018 Equinox , Inc
//
// RateScheduleTrigger Trigger 
//
// 29 Jan 2018     Vikrant Upneja     Original  
trigger RateSchedule on Rate_Schedule__c (after delete, after insert,  after update, before delete) {
    
    //Check to see if the TriggerSetting for CheckInTrigger IsActive
	if(TriggerState.isActive('RateSchedule')){
		
   
        //handle after insert
        if(trigger.isinsert && trigger.isAfter)
        { 
            RateScheduleTriggerHandler.handleAfterInsert(trigger.new, trigger.newMap);     
        }
        
       //handle after update event
        if(trigger.isAfter && trigger.isUpdate) 
        {   
            RateScheduleTriggerHandler.handleAfterUpdate(trigger.new, trigger.newMap);  
            
        }        
        
	    //handle before delete event
	    if ( trigger.isBefore && trigger.isdelete ){
	        RateScheduleTriggerHandler.handleBeforeDelete(trigger.old, trigger.oldMap);
	    }  

	    //handle before delete event
	    if ( trigger.isAfter && trigger.isdelete ){
	        RateScheduleTriggerHandler.handleAfterDelete(trigger.old, trigger.oldMap);
	    }   
	}    
    
}