public class ExceptionLearning {
    public static void nullPointExample(){
        try{
            Account acc;
            System.debug(acc.Name);       
            
            Map<Id,Account> accMap = new Map<Id,Account>();
            Account acc1 = accMap.get('001dL00000Yt6CTQAZ');
            System.debug(acc1.Rating);
            
            classWrapperExample wrapper = new classWrapperExample();
            Contact con = wrapper.conInfo;
            //System.debug(con.Name);
        }
        catch(Exception e){
            System.debug(e.getMessage() + '----' + e.getCause() + '----' + e.getLineNumber());
        }
        finally{
            System.debug('Hi finally i got executed');
        }
        
    }
    public class classWrapperExample{
        public Contact conInfo;
	}
    
     public static void queryExceptionLearn(){
        try{
            Account acc = [Select id from Account where name = 'xxxx' LIMIT 1];
            //correct one -- Account acc = [Select id , Rating from Account where name = 'xxxx' LIMIT 1];
            system.debug(acc.Rating);
            if(acc.Rating == 'Hot'){
                system.debug('Ehdn');
            }
        }
        catch(Exception e){
            System.debug(e.getMessage() + '----' + e.getCause() + '----' + e.getLineNumber());
        }
         
        finally{
            System.debug('Hi finally i got executed');
        }
        
    }
    public static void DmlOperations(){
        Account acc = new Account(Name = 'efvdsc');
        acc.AnnualRevenue = 100;
        update acc;
    }
    public static void GovLimitExce(){
        Account acc = new Account();
        acc.Name = '';
        acc.
    }
}   