trigger P1 on Task (before insert) {
    switch on Trigger.operationType{
        when BEFORE_INSERT{
            for(Task t1 : Trigger.new){
                t1.Priority = 'High';
            }
        }
    }
}