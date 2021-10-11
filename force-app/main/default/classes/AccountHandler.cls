public class AccountHandler {
    public static Account insertNewAccount(String accountName) {
        Account newAccount = new Account(
            Name = accountName
        );
        try {
            insert newAccount;
            return newAccount;
        } catch (DmlException e) {
            System.debug('A DML exception has occured: ' + e.getMessage());
        	return null;
        }
    }
    
    public static void insertAccount(Integer value) {
        Integer counter = 1;
        List<Account> addAccounts = new List<Account>();
        while (counter <= value) {
            Account newAccount = new Account();
            newAccount.Name = 'Acme Inc ' + counter;
            newAccount.AccountNumber = 'A000' + counter;
            addAccounts.add(newAccount);
            counter++;
        }
        insert addAccounts;
    }
}