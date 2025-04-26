trigger P5 on Lead (after insert) {
    switch on Trigger.operationType{
        when AFTER_INSERT{
            List<Task> t1 = new List<Task>();
            for(Lead ll : Trigger.new){
                Task t11 = new Task();
                t11.whoId = ll.Id;
                t11.Subject = 'Follow up with the customer';
                t1.add(t11);
            }
            if(t1.size() > 0 ){
                insert t1;
            }
        }
    }
}