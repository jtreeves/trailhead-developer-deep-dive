trigger OrderEventTrigger on Order_Event__e (after insert) {
    List<Task> tasks = new List<Task>();
    for (Order_Event__e event : Trigger.New) {
        if (event.Has_Shipped__c == true) {
            Task newTask = new Task();
            newTask.Priority = 'Medium';
            newTask.Subject = 'Follow up on shipped order ' + event.Order_Number__c;
            newTask.OwnerId = event.CreatedById;
            tasks.add(newTask);
        }
   }
    insert tasks;
}