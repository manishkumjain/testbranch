// 
// (c) 2014 Appirio, Inc.
//
// Contact trigger for different database events
//
// 5 Mar 2014     Shyam Sundar       Original
//

trigger ContactTrigger1 on Contact (before insert) {
    
    // before insert
    if(trigger.isBefore && trigger.isInsert){
        ContactTriggerHandler.handleBeforeInsert(trigger.new);
    }
}