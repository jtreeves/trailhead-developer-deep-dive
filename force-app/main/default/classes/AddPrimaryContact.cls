public class AddPrimaryContact implements Queueable {
    private Contact contact;
    private String state;
    
    public AddPrimaryContact(Contact contact, String state) {
        this.contact = contact;
        this.state = state;
    }
    
    public void execute(QueueableContext context) {
        List<Account> accounts = [
            SELECT Id, Name, (
                SELECT Id, FirstName, LastName
                FROM Contacts
            )
            FROM Account
            WHERE BillingState = :state
            LIMIT 200
        ];
        List<Contact> contacts = new List<Contact>();
        for (Account account : accounts) {
            Contact singleContact = contact.clone(
                false, false, false, false
      		);
            singleContact.AccountId = account.Id;
            contacts.add(singleContact);
        }
        if (contacts.size() > 0) {
            insert contacts;
        }
    }
}