@isTest
public class LeadProcessorTest {
    @testSetup static void setup() {
        List<Lead> leads = new List<Lead>();
        for (Integer i = 0; i < 200; i++) {
            Lead newLead = new Lead(
                LastName = 'LastTest' + i,
                Company = 'CompanyTest' + i,
                Status = 'Open - Not Contacted'
            );
            leads.add(newLead);
        }
        insert leads;
    }
    
    @isTest static void test() {
        Test.startTest();
        LeadProcessor leads = new LeadProcessor();
        Id batchId = Database.executeBatch(leads);
        Test.stopTest();
        Integer numberOfLeads = [
            SELECT Count()
            FROM Lead
            WHERE LeadSource = 'Dreamforce'
        ];
        System.assertEquals(200, numberOfLeads);
    }
}