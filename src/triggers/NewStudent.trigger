trigger NewStudent on Student__c (after insert) {
    if(Trigger.isAfter && Trigger.isInsert){
        Set<Id> setGroupIds = new Set<Id>();
        for(Student__c student:Trigger.New){
            setGroupIds.add(student.Group__c);
        }
        List<Student__c> listStudents = [SELECT Id, Email__c FROM Student__c WHERE Group__c IN :setGroupIds];
        
        List<String> listStudentEmails = new List<String>();
        
        for(Student__c student : listStudents) {
            listStudentEmails.add(student.Email__c);
        }
        EmailTemplate et=[Select id from EmailTemplate where name = 'EmailTemplatename' limit 1];
        
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setToAddresses(listStudentEmails);
        mail.setSenderDisplayName('System Admin');
        mail.setTemplateId(et.id);
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    }
}