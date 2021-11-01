// 
// (c) 2014 Appirio, Inc.
//
// Case trigger for different database events
//
// 18 Mar 2014     Shyam Sundar       Original/Merged
//

trigger CaseTrigger on Case (before insert, after insert, before update, after undelete, before delete, after update) {
    
    //Check to see if the TriggerSetting for CaseTrigger IsActive
    if(TriggerState.isActive('CaseTrigger')) { 
        
        List<Case> equinoxCases = new List<Case>();
        List<Case> equinoxMediaCases = new List<Case>();
        
        for(Case c : (trigger.isInsert || trigger.isUpdate || trigger.isUndelete)?trigger.new:trigger.old){
                if(Schema.SObjectType.Case.getRecordTypeInfosById().get(c.recordtypeId).getDeveloperName().contains('EQM')){
                    equinoxMediaCases.add(c);
                }else{
                    equinoxCases.add(c);
                }
        }
        
        system.debug('equinoxMediaCases-- '+equinoxMediaCases);
        system.debug('equinoxCases-- '+equinoxCases);
    
        // after insert
        if(trigger.isAfter && trigger.isInsert){
            if(equinoxCases != null && equinoxCases.size()>0){
                CaseTriggerHandler.afterInsert(equinoxCases, trigger.oldMap);
            }
        }
        // before update
        if(trigger.isBefore && trigger.isUpdate){
            if(equinoxCases != null && equinoxCases.size()>0){
                list<case> lstCase = new list<case>();
                for(case caseRec : equinoxCases){
                    case OldVal = trigger.oldMap.get(caseRec.id);
                    if(caseRec.Club__c  != OldVal.Club__c || caseRec.ContactId != OldVal.ContactId){
                        lstCase.add(caseRec);
                    }
                }
                if(lstCase.size()>0){
                    CaseTriggerHandler.beforeInsert(equinoxCases);    
                }
                
                CaseTriggerHandler.beforeUpdate(equinoxCases, trigger.oldMap);
            }
            
            if(equinoxMediaCases != null && equinoxMediaCases.size()>0){
                EQM_CaseTriggerHelper.onBeforeUpdate(equinoxMediaCases, Trigger.old, Trigger.newMap, Trigger.oldMap);
            }
        }
        // after update
        else if(trigger.isAfter && trigger.isUpdate){
            if(equinoxCases != null && equinoxCases.size()>0){
                CaseTriggerHandler.afterUpdate(equinoxCases, trigger.oldMap);
            }
            if(equinoxMediaCases != null && equinoxMediaCases.size()>0){
                EQM_CaseTriggerHelper.onAfterUpdate(equinoxMediaCases, trigger.oldMap);
            }
        }
        // before insert
        else if(trigger.isBefore && trigger.isDelete){
            if(equinoxCases != null && equinoxCases.size()>0){
                CaseTriggerHandler.beforeDelete(equinoxCases);
            }
        }
        // before insert
        else if(trigger.isAfter && trigger.isUnDelete){
            if(equinoxCases != null && equinoxCases.size()>0){
                CaseTriggerHandler.afterUnDelete(equinoxCases);
            }
        }
        // before insert
        else if(trigger.isBefore && trigger.isInsert){
            if(equinoxCases != null && equinoxCases.size()>0){
                CaseTriggerHandler.beforeInsert(trigger.new);
            }
             
            if(equinoxMediaCases != null && equinoxMediaCases.size()>0){
                EQM_CaseTriggerHelper.onBeforeInsert(equinoxMediaCases);
            }
        }
    }
}