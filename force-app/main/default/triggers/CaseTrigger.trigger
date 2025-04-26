trigger CaseTrigger on Case (before delete) {
    switch on Trigger.operationType{
        When BEFORE_DELETE{
            CaseTriggerHandler.DeleteHandle(Trigger.OLD);

        }
    }
}