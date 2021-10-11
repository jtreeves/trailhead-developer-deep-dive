trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    List<Task> tasks = new List<Task>();
    for (Opportunity opp : Trigger.new) {
        if (opp.StageName == 'Closed Won') {
            Task newTask = new Task();
            newTask.Subject = 'Follow Up Test Task';
            newTask.WhatId = opp.Id;
            tasks.add(newTask);
        }
    }
    insert tasks;
}