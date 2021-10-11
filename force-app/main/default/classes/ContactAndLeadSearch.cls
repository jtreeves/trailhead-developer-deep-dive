public class ContactAndLeadSearch {
    public static List<List< SObject>> searchContactsAndLeads(String namePart) {
        List<List< SObject>> results = [
            FIND :namePart
            IN ALL FIELDS
            RETURNING Lead(FirstName, LastName), Contact(FirstName, LastName)
        ];
        return results;
    }
}