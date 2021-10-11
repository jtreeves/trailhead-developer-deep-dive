public class AccountProcessor {
	@future
    public static void countContacts(List<Id> accountIds) {
        List<Account> accounts = [
            SELECT Id, Number_of_Contacts__c, (
            	SELECT Id
                FROM Contacts
            ) 
            FROM Account
            WHERE Id
            IN :accountIds
        ];
        for (Account singleAccount : accounts) {
            List<Contact> contacts = singleAccount.contacts;
            singleAccount.Number_of_Contacts__c = contacts.size();
		}
        update accounts;
    }
}