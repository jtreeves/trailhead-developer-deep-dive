@isTest
public class AnimalLocatorTest {
    @isTest static void testAnimalLocatorMock() {
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        String result = AnimalLocator.getAnimalNameById(1);
        String expected = 'chicken';
        System.assertEquals(expected, result);
    }
}