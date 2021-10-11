public class LeadProcessor implements Database.Batchable<sObject> {
    public Database.QueryLocator start(Database.BatchableContext bc) {
        String query = 'SELECT Id, LeadSource FROM Lead';
        return Database.getQueryLocator(query);
    }
    
    public void execute(Database.BatchableContext bc, List<Lead> leads) {
        for (Lead singleLead : leads) {
            singleLead.LeadSource = 'Dreamforce';
        }
        update leads;
    }
    
    public void finish(Database.BatchableContext bc) {
        Id job = bc.getJobId();
        System.debug(job);
    }
}