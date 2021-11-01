trigger PriceBandTrigger on Price_Bands__c (after insert, after update, before insert, before update) {
 
    //Check to see if the TriggerSetting for CheckInTrigger IsActive
	if(TriggerState.isActive('PriceBand')){
		
   
        //handle Before insert
        if(trigger.isinsert && trigger.isBefore)
        { 
        	system.debug('*** trigger.new isinsert ** ' + trigger.new);
        	PriceBandTriggerHandler.handleBeforeInsert(trigger.new, trigger.newMap);     
        }
        //handle after insert
        if(trigger.isinsert && trigger.isAfter)
        { 
        	//system.debug('*** trigger.new ** ' + trigger.new);
        	//PriceBandTriggerHandler.handleAfterInsert(trigger.new, trigger.newMap);     
        }      
        //handle Before update
        if(trigger.isupdate && trigger.isBefore)
        { 
        	system.debug('*** trigger.new isupdate** ' + trigger.new);
        	PriceBandTriggerHandler.handleBeforeUpdate(trigger.new, trigger.newMap);     
        }          

	} 
    
}