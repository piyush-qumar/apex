@IsTest
private with sharing class DateTimeconvTest {

    @IsTest
    private static void testDate() {
        //DateTimeconv obj=new DateTimeconv();
        Datetime referenceDate = Datetime.newInstance(2019, 1, 1, 0, 0, 0);
        Datetime dt1 = referenceDate.addSeconds(1296300800);
        Datetime dt2 = referenceDate.addSeconds(1546300800);
        Datetime dt3 = referenceDate.addSeconds(1549000800);
        System.assertEquals(referenceDate, dt1);
        System.assertEquals(referenceDate, dt2);
        System.assertEquals(referenceDate, dt3);
    }
}
