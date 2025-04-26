trigger TaskTrigger on Task (after update) {
    if(trigger.isAfter && trigger.isUpdate){
        TaskTriggerHandler.handleCheckBox(Trigger.new);
    }    
}