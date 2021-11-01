trigger CaseExceptionTrigger on Case_Exception_Staging__c (after insert) 
{
    set<string> caseNumberSet = new set<string>();
    List<case> caseToUpdateList = new List<case>();
    
    if(Trigger.isAfter)
    {
        if(Trigger.isInsert)
        {
            for(Case_Exception_Staging__c ce : Trigger.new)
            {
                caseNumberSet.add(ce.name);
            }
            
            for(Case cse : [select id from case where casenumber in :caseNumberSet ])
            {
                cse.Mark_as_Exception__c = 'Yes';
                
                caseToUpdateList.add(cse);
            }
            
            if(caseToUpdateList.size()>0)
            update caseToUpdateList;
            
        }
    }
    

}