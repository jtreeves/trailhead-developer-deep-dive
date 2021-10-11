@isTest
public class ParkLocatorTest {
    @isTest static void testCallout() {
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        String countryName = 'Germany';
        String[] actualParkNames = ParkLocator.country(countryName);
        String[] expectedParkNames = new String[]{'Hamburg Wadden Sea National Park', 'Hainich National Park', 'Bavarian Forest National Park'};
        System.assertEquals(expectedParkNames, actualParkNames);
    }
}