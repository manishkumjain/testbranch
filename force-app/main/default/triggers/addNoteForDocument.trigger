////////////////////////
// Equinox
//
// For Document Upload: To Create Note on Contact for a document uploaded
// Sumit Mathur
// 12-July-2014
////////////////////////

trigger addNoteForDocument on Document_Log__c (after insert) {
   
    List<Document_Log__c> noteDocumentList = new List<Document_Log__c>();
    
    noteDocumentList = trigger.new;
    
    List<Note>  noteList = new List<Note>();
    
    for( Document_Log__c n : noteDocumentList ) {

        // get ClubInfo details for ContactId
        Contact_ClubInfo__c clubInfo = [select id,Contact__c from Contact_ClubInfo__c 
                                            where id= :n.Contact_ClubInfo__c];
        
        User user = [select id, name from User where Id= :n.OwnerId];
    
        // Add note to contact 
        note note =  new note(); 
        note.Title = String.format('{0} uploaded by {1} on {2}', new string[]{n.Document_Type__c, user.Name, System.now().format('MM/dd/yyyy')});
        note.Body = String.format('AutoScan: {0} uploaded by {1}', new string[]{n.Document_Type__c, user.Name});
        note.ParentId = clubinfo.Contact__c;
        note.OwnerId = user.Id;
        noteList.add(note);
        
        // Add note to opportunity 
        
        List<Opportunity> oppList = [select id from opportunity  where Contact__c= :clubinfo.Contact__c and IsWon=true and 
                           RecordType.name in ('Membership', 'Renewal') order by closedate desc];
        Opportunity opportunity = (oppList != null && oppList.size()>1) ? oppList[0] : null;
                     
        if (opportunity != null)
        {
            note =  new note(); 
            note.Title = String.format('{0} uploaded by {1} on {2}', new string[]{n.Document_Type__c, user.Name, System.now().format('MM/dd/yyyy')});
            note.Body = String.format('AutoScan: {0} uploaded by {1}', new string[]{n.Document_Type__c, user.Name});
            note.ParentId = opportunity.id;
            note.OwnerId = user.Id;
            noteList.add(note);
        }
    }
        
    if(noteList.size()>0){
        
        insert noteList;
        
    }
 

}