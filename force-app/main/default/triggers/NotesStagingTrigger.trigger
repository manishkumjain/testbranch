////////////////////////
// Equinox
//
// For Interim Sync: To create a Note for Annotation. 
// Vikrant Upneja
// 24-Apr-2014
////////////////////////

trigger NotesStagingTrigger on Notes_Staging__c (before insert, after insert) {
   //Check to see if the TriggerSetting for populateNotes IsActive
    if(TriggerState.isActive('populateNotes')) {

        if(Trigger.isbefore){
            NoteStagingTriggerHandler.handleBeforeInsert(trigger.new);
        }

        if(Trigger.isAfter){
            
            NoteStagingTriggerHandler.handleAfterInsert(trigger.new);
        }
    }    
}