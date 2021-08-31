@isTest
class PalindromeTest {
    
    @isTest static void easyTest(){
        System.assert(Palindrome.Check('121'));
        System.assertEquals(Palindrome.Check('1212'), False);
        System.assert(Palindrome.Check(121));
        System.assertEquals(Palindrome.Check(1212), False);
    }
    

}