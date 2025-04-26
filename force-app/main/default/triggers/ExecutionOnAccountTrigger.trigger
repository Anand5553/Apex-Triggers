trigger ExecutionOnAccountTrigger on Account (after update) {
    switch on Trigger.operationType{
        when AFTER_UPDATE{
            if(!AccountTriggerHandler.isFlag){
                AccountTriggerHandler.isFlag = true;
                new AccountTriggerHandler().ExecutionTrigger(Trigger.new);
            }
        }   
    }
    
}