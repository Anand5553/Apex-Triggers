trigger AccountTrigger on Account (before insert,after undelete) {
    switch on Trigger.operationType{
        when BEFORE_INSERT{
            AccountTriggerHandler.salesRepNameCopyFromOwnerName(Trigger.NEW);
			}
        
        when AFTER_UNDELETE{
            AccountTriggerHandler.AddingSuffixBeforeUndelete(Trigger.NEW);
}
    }
}