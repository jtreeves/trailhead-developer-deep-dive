public class RandomContactFactory {
    public static List<Contact> generateRandomContacts(Integer numberOfContacts, String newLastName) {
    	List<Contact> contacts = new List<Contact>();
        for (Integer i = 0; i < numberOfContacts; i++) {
            Contact newContact = new Contact(FirstName = 'Test ' + i, LastName = newLastName);
            contacts.add(newContact);
        }
        return contacts;
    }
}