/**
* @author LevDigital
* @date 2020
*
* @group Order
* @group-content ../../ApexDocContent/Order.htm
*
* @description Trigger on Order, it calls the OrderDispatcher
*/


trigger OrderTrigger on Order (after Insert,after update) {
    List<EQM_TriggerKillSwitch__mdt> triggerKillSwitch = [SELECT RunTrigger__c FROM EQM_TriggerKillSwitch__mdt WHERE ObjectAPIName__c = 'Order'];
    Boolean runTrigger = triggerKillSwitch.isEmpty() ? false : triggerKillSwitch[0].RunTrigger__c;
    System.debug('*runTrigger ' + runTrigger);
    if (runTrigger) {
        switch on Trigger.OperationType {
            when AFTER_INSERT {
                EQM_OrderDispatcher.afterInsert(Trigger.new, Trigger.newMap);
            }
            when AFTER_UPDATE {                
                EQM_OrderDispatcher.afterUpdate(Trigger.new, Trigger.old, Trigger.newMap, Trigger.oldMap);
            }
        }
    }
}