trigger OpportunityTrigger on Opportunity (before insert,after insert, before update, after update) {

    switch on Trigger.operationType{
        when BEFORE_INSERT, BEFORE_UPDATE{

            for(Opportunity opp : Trigger.new){
                if(opp.StageName == 'Closed Won'){
                    opp.NextStep = 'Onboard a Contract';
                }
            }
        }
        when AFTER_INSERT, AFTER_UPDATE{
            //imp
            if(Trigger.isAfter && Trigger.isUpdate){  
                OpportunityHandler.notifyClosedWon(Trigger.New,Trigger.oldMap);
                OpportunityHandler.notifyReminderBasedOnStage(Trigger.NEW,Trigger.oldMap);
            }
            
            OpportunityHandler.CreateTeam(Trigger.New,Trigger.oldMap);
            /*
            List<Task> tasks = new List<Task>();
            for(Opportunity opp : Trigger.new){
                if(opp.StageName == 'Closed Won'){
                Task task1 = new Task();
                task1.whatId = opp.id;
                task1.Subject = 'Sales team to engage';
                tasks.add(task1);

                Task task2 = new Task();
                task2.whatId = opp.id;
                task2.Subject = 'Schedule a welcome call';
                tasks.add(task2);

                Task task3 = new Task();
                task3.whatId = opp.id;
                task3.Subject = 'thankyou email';
                tasks.add(task3); 
             }
            }
            if(tasks.size() > 0 ){
                insert tasks;
            }  
				*/
        }
    }
}
//Not optimized wala
// switch on Trigger.operationType{
//     when BEFORE_INSERT, BEFORE_UPDATE{
//         //Opportunity oops = Trigger.new[0];
//         List<Opportunity> opp = Trigger.new;
//         Opportunity opps = opp[0];
//         if(opps.StageName == 'Closed Won'){
//             opps.NextStep = 'Onboard a Contract';
//         }


//     }
//     when AFTER_INSERT, AFTER_UPDATE{
//         List<Opportunity> opp = Trigger.new;
//         Opportunity opps = opp[0];

//         if(opps.StageName == 'Closed Won'){
//             Task task1 = new Task();
//             task1.whatId = opps.id;
//             task1.Subject = 'Sales team to engage';
//             insert task1;

//             Task task2 = new Task();
//             task2.whatId = opps.id;
//             task2.Subject = 'Schedule a welcome call';
//             insert task2;

//             Task task3 = new Task();
//             task3.whatId = opps.id;
//             task3.Subject = 'thankyou email';
//             insert task3;
//         }
//     }
// }