/* 
# Created by............: Nathan Shilling
# Created Date..........: 01/10/2013
# Last Modified by......: 
# Last Modified Date....: 

 Trigger handler for setting QueueID__c value on Assignment_Group_Queues__c object.
    
*/

trigger ValidateQueueName on Assignment_Group_Queues__c (before insert, before update) {
    //Determine if the value of the Queue Name has been updated.  If so Break.
    
    if (trigger.isBefore && trigger.isUpdate){ 
        AssignmentGroupQueuesTriggerHandler.handleBeforeUpdate(trigger.new, trigger.old, trigger.newMap, trigger.oldMap);
    }
    
    if(trigger.isBefore && trigger.isInsert) {
        AssignmentGroupQueuesTriggerHandler.handleBeforeInsert(trigger.new);
    }
}