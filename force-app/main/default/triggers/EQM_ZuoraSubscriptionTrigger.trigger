/* @author LevDigital
* @date 2020
*
* @group Zuora__Subscription__c
* @group-content ../../ApexDocContent/Zuora__Subscription__c.htm
*
* @description Trigger on Zuora__Subscription__c, it calls the ZuoraSubscriptionDispatcher
*/
trigger EQM_ZuoraSubscriptionTrigger on Zuora__Subscription__c (after update) {
    List<EQM_TriggerKillSwitch__mdt> triggerKillSwitch = [SELECT RunTrigger__c FROM EQM_TriggerKillSwitch__mdt WHERE ObjectAPIName__c = 'ZuoraSubscription'];
    Boolean runTrigger = triggerKillSwitch.isEmpty() ? false : triggerKillSwitch[0].RunTrigger__c;
    if (runTrigger) {
        switch on Trigger.OperationType {
            when AFTER_UPDATE {                
                EQM_ZuoraSubscriptionDispatcher.afterUpdate(Trigger.new, Trigger.old, Trigger.newMap, Trigger.oldMap);
            }
        }
    }
}