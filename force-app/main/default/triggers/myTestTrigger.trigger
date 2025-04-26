trigger myTestTrigger on lead (before update,after update,before insert) {
    /*
    if(Trigger.isUpdate){
        if(Trigger.isBefore){
            System.debug('hey before ');
        }
        if(Trigger.isAfter){
            System.debug('hey After ');
        }
    }    
    switch on Trigger.operationType{
        when BEFORE_UPDATE , BEFORE_INSERT{
            Lead leadObjSave = Trigger.new[0]; // returns List<Leads> or Trigger.get(0);
            for (Lead abc : Trigger.new) {
                if (!abc.Company.containsIgnoreCase('Inc')) {
                    abc.Company += ' Inc';
                }
            }
			
            if(leadObjSave.LeadSource == null){
                leadObjSave.addError('Lead Source cannot be null');
            }            
        }
        when AFTER_UPDATE{
            Lead leadObjSave = Trigger.new[0]; // returns List<Leads> or Trigger.get(0);
            if(leadObjSave.Rating == 'Hot'){
                Task task1 = new Task();
                task1.whoId = leadObjSave.Id;
                task1.Subject = 'Follow up in a new mode';
                task1.Priority = 'High';
                insert task1;
            } 
        }
    }
*/ 
	}