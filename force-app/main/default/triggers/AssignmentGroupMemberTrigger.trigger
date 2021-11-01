trigger AssignmentGroupMemberTrigger on Assignment_Groups__c (after update) {
    //handle after update event
    if (trigger.isAfter && trigger.isUpdate ){ 
        AssignmentGroupMemberTriggerHandler.handleAfterUpdate(trigger.new, trigger.old);
    }
    
    
}