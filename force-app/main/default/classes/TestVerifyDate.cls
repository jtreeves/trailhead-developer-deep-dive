@isTest
public class TestVerifyDate {
    @isTest static void testCheckInsideDate() {
        Date nowDate = System.today();
        Date laterDate = nowDate.addDays(10);
        Date confirmedDate = VerifyDate.CheckDates(nowDate, laterDate);
    	System.assertEquals(laterDate, confirmedDate);
    }
    
    @isTest static void testCheckOutsideDate() {
        Date nowDate = System.today();
        Date laterDate = nowDate.addDays(60);
        Integer totalDays = Date.daysInMonth(nowDate.year(), nowDate.month());
		Date lastDay = Date.newInstance(nowDate.year(), nowDate.month(), totalDays);
        Date confirmedDate = VerifyDate.CheckDates(nowDate, laterDate);
    	System.assertEquals(lastDay, confirmedDate);
    }
}