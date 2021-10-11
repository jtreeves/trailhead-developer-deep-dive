@IsTest
private class AccountManagerTest {
    @IsTest static void testGetAccount() {
        Account account = new Account(
            Name='Test Account Name'
        );
        insert account;
        Id recordId = account.Id;
        Contact contact = new Contact(
            LastName = 'TestLastName',
            AccountId = recordId
        );
        insert contact;
        RestRequest request = new RestRequest();
        request.requestUri =
            'https://creative-moose-i5o31n-dev-ed.lightning.force.com/services/apexrest/Accounts/' +
            recordId +
            '/contacts'
        ;
        request.httpMethod = 'GET';
        RestContext.request = request;
        Account retrievedAccount = AccountManager.getAccount();
        System.assertEquals('Test Account Name', retrievedAccount.Name);
    }
}