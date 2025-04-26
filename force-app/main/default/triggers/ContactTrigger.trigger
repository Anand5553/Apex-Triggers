trigger ContactTrigger on Contact (after insert,after update,before insert) {
    Switch on Trigger.operationType{
        when AFTER_INSERT{
            ContactTriggerHandler.GroupSharing(Trigger.New);
            ContactTriggerHandler.CreateNLocation(Trigger.New,NULL);
        }
        when AFTER_UPDATE{
            ContactTriggerHandler.EmailShare(Trigger.new,Trigger.oldMap);
            ContactTriggerHandler.CreateNLocation(Trigger.New,Trigger.oldMap);

        }
        When BEFORE_INSERT{
            ContactTriggerHandler.BillingShare(Trigger.new);
        }
    }

}