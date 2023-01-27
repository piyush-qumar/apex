@IsTest
private with sharing class PallindromeTest {
    @isTest
    private static void testPallindrome()
     {
        Pallindrome obj=Pallindrome.getInstance();
        System.assertEquals(true,obj.isPallindrome('madam'));
        System.assertEquals(false,obj.isPallindrome('madam1'));
        System.assertEquals(true,obj.isPallindrome('malayalam'));
    }
}