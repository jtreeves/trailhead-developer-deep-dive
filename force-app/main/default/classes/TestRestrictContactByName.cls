@isTest
public class TestRestrictContactByName {
    @isTest static void testTrigger() {
        Contact newContact = new Contact();
        newContact.LastName = 'INVALIDNAME';
        
        Test.startTest();
        try {
            insert newContact;
        } catch (DmlException e) {
        	System.assertEquals('The Last Name INVALIDNAME is not allowed for DML', e.getDmlMessage(0));    
        }
        Test.stopTest();
    }
}