public class AccountUtility {
    public static void viewAnnualRevenue() {
        List<Account> accountsList = [
            SELECT Name, AnnualRevenue
            FROM Account
        ];
        for (Account singleAccount : accountsList) {
            String acctRev = singleAccount.Name + ' : ' + singleAccount.AnnualRevenue;
            System.debug(acctRev);
        }
    }
}