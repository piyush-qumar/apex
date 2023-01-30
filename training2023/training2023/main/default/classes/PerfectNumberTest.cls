@IsTest
private with sharing class PerfectNumberTest {
   @isTest
   private static void testPerfect()
   {
    PerfectNumber obj=PerfectNumber.getInstance();
    System.assertEquals(true,obj.isPerfect(6));
    System.assertEquals(false,obj.isPerfect(34));
    System.assertEquals(true,obj.isPerfect(28));
   }
}