@isTest
public class AddPrimaryContactTest {
    @testSetup static void setup() {
        List<Account> accounts = new List<Account>();
        for (Integer i = 0; i < 50; i++) {
            Account newAccount = new Account(
                Name = 'CATest' + i,
                BillingState = 'CA'
            );
            accounts.add(newAccount);
        }
        for (Integer i = 0; i < 50; i++) {
            Account newAccount = new Account(
                Name = 'NYTest' + i,
                BillingState = 'NY'
            );
            accounts.add(newAccount);
        }
        insert accounts;
    }
    
    @isTest static void testQueueable() {
        Contact newContact = new Contact(
            FirstName = 'TestFirst',
            LastName = 'TestLast'
        );
        String state = 'CA';
        insert newContact;
        AddPrimaryContact job = new AddPrimaryContact(
            newContact,
            state
        );
        Test.startTest();
        System.enqueueJob(job);
        Test.stopTest();
        Integer numberOfContacts = [
            SELECT Count()
            FROM Contact
            WHERE AccountId
            IN (
                SELECT Id
                FROM Account
                WHERE BillingState = :state
            )
        ];
        System.assertEquals(50, numberOfContacts);
    }
}