trigger UpdateCaseStatusFromAttachmentTrigger on Attachment (before insert) 
{
    for(integer i = 0; i<10;i++)
    {
        System.debug(i);
    }
}