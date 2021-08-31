@isTest
class NewStudentTest {
    
    @isTest static void easyTest(){
        Group__c groupa = new Group__c();
        //group.Name = 'Ababa';
        //insert groupa;
        System.assert(Palindrome.Check('121'));
        System.assertEquals(Palindrome.Check('1212'), False);
        System.assert(Palindrome.Check(121));
        System.assertEquals(Palindrome.Check(1212), False);
    }
    

}