trigger P6 on Opportunity (before update) {
    switch on Trigger.operationType{
        when BEFORE_UPDATE{
            OpportunityHandler.UpdateCheck(Trigger.new,Trigger.oldMap);
        }
    }
}