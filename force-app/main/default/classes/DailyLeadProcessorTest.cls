@isTest
private class DailyLeadProcessorTest {
    public static String CRON_EXP = '0 0 1 * * ?';
    @isTest static void testScheduledJob() {
        List<Lead> leads = new List<Lead>();
        for (Integer i = 0; i < 200; i++) {
            Lead lead = new Lead(
                LastName = 'LeadTestLast' + i,
                Company = 'LeadTestCompany' + i,
                LeadSource = ''
            );
            leads.add(lead);
        }
        insert leads;
        Test.startTest();
        String jobId = System.schedule('DailyLeadProcessor', CRON_EXP, new DailyLeadProcessor());
        Test.stopTest();
        List<Lead> updatedLeads = [
            SELECT Id
            FROM Lead
            WHERE LeadSource = 'Dreamforce' 
            AND Company LIKE 'LeadTestCompany%'
        ];
        System.assertEquals(200, updatedLeads.size());
    }
}