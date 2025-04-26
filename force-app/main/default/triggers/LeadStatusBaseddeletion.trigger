trigger LeadStatusBaseddeletion on Lead (before delete) {
    switch on Trigger.operationType{
        when BEFORE_DELETE{

        }
    }

}