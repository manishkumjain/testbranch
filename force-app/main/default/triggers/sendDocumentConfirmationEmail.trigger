// Send a business proposal to each new Contact
trigger sendDocumentConfirmationEmail on Document_Log__c (after insert) {

   //Check to see if the TriggerSetting for sendDocumentConfirmationEmail IsActive
    if(TriggerState.isActive('sendDocumentConfirmationEmail')) {   

   
  // Create a master list to hold the emails we'll send
  List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
  
  for (Document_Log__c document : Trigger.new) {

    Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
    
    // Get User email
    User user = [select id, email from User where Id= :document.OwnerId];
    
    // Get Member Info
    Contact_ClubInfo__c clubInfo = [select id,Contact__c, contact__r.name, MemberId__c from Contact_ClubInfo__c 
                                            where id= :document.Contact_ClubInfo__c];
    
    // set recipient
    mail.setTargetObjectId(user.Id);
    mail.setSenderDisplayName('Email Service');
    
    mail.setSaveAsActivity(false);
          
    // Set email subject and contents
    mail.setSubject(string.Format('AutoScan - {0} uploaded successfully.',new string[]{ document.Document_Type__c}));
    mail.setHtmlBody(String.Format('Thank you for submitting your document for member {0} (#{1}). Member Services will review it shortly.', new string[]{clubInfo.contact__r.name, clubInfo.MemberId__c} ));
    
    // Add your email to the master list
    mails.add(mail);
    
  }
  // Send all emails in the master list
  Messaging.sendEmail(mails);
  }
}