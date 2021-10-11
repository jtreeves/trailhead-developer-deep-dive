public class ParkLocator {
    public static String[] country(String countryName) {
        ParkService.ParksImplPort parks = new ParkService.ParksImplPort();
        String[] availableParkNames = parks.byCountry(countryName);
        return availableParkNames;
    }
}