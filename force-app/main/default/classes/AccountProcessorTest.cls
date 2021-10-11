@isTest
public class AccountProcessorTest {
    @isTest
    public static void TestAccountProcessorTest() {
        Account singleAccount = new Account();
        singleAccount.Name = 'Test Account';
        insert singleAccount;
        
        Contact firstContact = new Contact();
        firstContact.FirstName = 'John';
        firstContact.LastName = 'Doe';
        firstContact.AccountId = singleAccount.Id;
        insert firstContact;
        
        Contact secondContact = new Contact();
        secondContact.FirstName = 'Jane';
        secondContact.LastName = 'Doe';
        secondContact.AccountId = singleAccount.Id;
        insert secondContact;
        
        List<Id> accounts = new List<Id>();
        accounts.add(singleAccount.Id);
        
        Test.startTest();
        AccountProcessor.countContacts(accounts);
        Test.stopTest();
        
        Account selectedAccount = [SELECT Number_of_Contacts__c FROM Account WHERE Id = :singleAccount.Id LIMIT 1];
        System.assertEquals(
            Integer.valueOf(selectedAccount.Number_of_Contacts__c), 
            2
        );
    }
}