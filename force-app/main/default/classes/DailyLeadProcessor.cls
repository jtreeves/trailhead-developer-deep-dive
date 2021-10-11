global class DailyLeadProcessor implements Schedulable {
    global void execute(SchedulableContext context) {
        List<Lead> leads = [
            SELECT Id, LeadSource
            FROM Lead
            WHERE LeadSource = null
        ];
        for (Lead lead : leads) {
            lead.LeadSource = 'Dreamforce';
        }
        update leads;
    }
}