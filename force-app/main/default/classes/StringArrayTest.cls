public class StringArrayTest {
    public static List<String> generateStringArray(Integer numberOfStrings) {
        List<String> testArray = new List<String>();
        for (Integer i = 0; i < numberOfStrings; i++) 
        {
            testArray.add('Test ' + i);
        }
        return testArray;
    }
}