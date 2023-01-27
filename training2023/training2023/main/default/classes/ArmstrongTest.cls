@IsTest
private with sharing class ArmstrongTest {
   @isTest
   private static void testArmstrong()
   {
    Armstrong obj=Armstrong.getInstance();
    System.assertEquals(true,obj.isArmstrong(153));
    System.assertEquals(false,obj.isArmstrong(34));
    System.assertEquals(true,obj.isArmstrong(370));
   }
}