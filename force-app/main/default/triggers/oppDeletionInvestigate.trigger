trigger oppDeletionInvestigate on Opportunity (after delete) {
    switch on Trigger.operationType{
        when AFTER_DELETE{
            Investigate.TaskCreate(Trigger.old);
        }
    }
}