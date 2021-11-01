trigger PriceScheduleTrigger on Price_Schedule__c (after insert, after update, before insert, before update) {

    //Check to see if the TriggerSetting for CheckInTrigger IsActive
	if(TriggerState.isActive('PriceSchedule')){
		
   
        //handle Before insert
        if(trigger.isinsert && trigger.isBefore)
        { 
        	system.debug('*** trigger.new ** ' + trigger.new);
        	PriceScheduleTriggerHandler.handleBeforeInsert(trigger.new, trigger.newMap);     
        }

        //handle Before update
        if(trigger.isupdate && trigger.isBefore)
        { 
        	system.debug('*** trigger.new ** ' + trigger.new);
        	PriceScheduleTriggerHandler.handleBeforeUpdate(trigger.new, trigger.newMap);     
        }          

	} 
    
}