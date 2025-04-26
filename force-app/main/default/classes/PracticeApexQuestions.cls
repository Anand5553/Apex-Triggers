public class PracticeApexQuestions {
    public static void p1(String firstName, String LastName, String emilId){
        List<Contact> conList = new List<Contact>();
        if(!String.isBlank(LastName)){
            Contact con = new Contact();
            con.firstName = firstName;
            con.LastName = LastName;
            con.Email = emilId;
            conList.add(con);
        }        
        if(conList.size() >0){
            Database.insert(conList,false);
        }
        
    }
    public static void sendEmail(String email){
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        
        List<String> Toaddresses = new List<String>{email};
        mail.setToAddresses(Toaddresses);
        
        String[] ccAddresses = new String[] {'Triyank.kumar786@gmail.com'};
        mail.setCcAddresses(ccAddresses);
        
        mail.setSubject('Take a look urgent');
        mail.setPlainTextBody('Hello i am a body');   
        mail.setHtmlBody('<h1>Hello,</h1><p>This is a <b>test email</b> sent from an Apex class.</p>');

        
        mail.setUseSignature(true);
		System.debug(mail.getUseSignature());
        
        mail.setReplyTo('ananddash555@gmail.com');
        
        
        Messaging.sendEmail(new Messaging.SingleEmailMessage[]{mail});
	}
    public static void p3(String accName) {
        List<String> emailIds = new List<String>();
   
            // Fetch contacts related to the Account
            List<Contact> conList = [SELECT Id, Email FROM Contact WHERE Account.Name = :accName];
    		
            for (Contact con : conList) {
                emailIds.add(con.Email);          
        	}
            
        	System.debug(emailIds);
}
    public static boolean accountContactConnectedOrNot(String accName,String conName){
       List<Contact> accNameOfCon = [SELECT Id from Contact where Name =: conName AND Account.Name = :accName];
        if(accNameOfCon.size() > 0){
            return true;
        }
        return false;
       
    } 
    public static boolean personCanVoteOrNot(Date dateOfBirth){
		Date current = System.today();
		System.debug(System.today());
        Integer age = (dateOfBirth.daysBetween(current))/365;
        System.debug(age);
        if(age > 18) {
            return true;
        }
        return false;
    }
    public static Decimal splitBills(Integer numbOfPeople, Decimal bill){
        Decimal rate;
        if(bill != null && numbOfPeople > 0){
            rate = bill/numbOfPeople;
        }
        return rate;
    }
    public static boolean divisibilityBy7And11(Integer num){
        if(num != null){       
            return ((Math.mod(num,7)) == 0 && (Math.mod(num,11)) == 0);
		}
        else{
            return false;
        }
    }
    public static String findGenzOrGenAlpha(Integer birthYear){
        String name = '';
        if(birthyear <= 1994 && birthYear >=1980){
            name ='millenier';
        }
        else if(birthyear <= 2009 && birthYear >1994){
            name = 'GEnZ';
        }
        else if(birthyear <= 2025 && birthYear >2009){
            name  = 'GEnZ';
        }
        return name;
	}
    public static String plantType(String plantName){
        String plantType = 'hello';
        List<plant__mdt> plantsFromCustomMetaData = [SELECT ID, MasterLabel,Plant_Type__c from plant__mdt WHERE MasterLabel =: plantName LIMIT 1];
        if(plantsFromCustomMetaData.size() == 1){
            return plantsFromCustomMetaData[0].Plant_Type__c;
        }
        return plantType;
    }
    public static String acronymToFullForm(String acronym){
        String ans = 'Not in the list';
        List<Acronym__mdt> lis = [SELECT ID, MasterLabel,Full_Form__c FROM Acronym__mdt WHERE MasterLabel = :acronym LIMIT 1 ];
        if(lis.size() == 1){
            return lis[0].Full_Form__c;
        }
        return ans;
    }
    public static List<Task> showFiveTaskCreatedToday(){
        return [SELECT Id,Subject from Task WHERE CreatedDate = Today ORDER BY CreatedDate DESC LIMIT 5 ];
	}
    public static String nameReturnFromEmail(String email){
        //I will be recieveing something like anand_dash@infosys.com. i need to return anand dash
        String name = '';
        String fullName = email.substringBefore('@');
        name = fullName.replace('_',' ');
        return name;
    }
    
    
    public static List<Integer> getFibonacci(Integer num) { 
    List<Integer> ansList = new List<Integer>();
    Integer m = 0, n = 1;
    ansList.add(m); // Add first Fibonacci number
    if (num > 0) {
        ansList.add(n); // Add second Fibonacci number only if num > 0
    }
    while (true) {
        Integer nextNum = m + n;
        if (nextNum > num) {
            break; // Stop when the next Fibonacci number exceeds num
        }
        ansList.add(nextNum);
        m = n;
        n = nextNum;
    }
    return ansList;
    }
    
    public static String reverseString(String sentence){
        return sentence.reverse();
        //return String.reverse(sentence);
    }
    
   
    public static String reverseWords(String input) {
        // Split the input string into a list of words
        List<String> words = input.split(' ');
        
        // Manually reverse the list using a new list
        List<String> reversedWords = new List<String>();
        
        // Loop through the original list in reverse order
        for (Integer i = words.size() - 1; i >= 0; i--) {
            reversedWords.add(words[i]);
        }
        
        // Join the words back into a single string with spaces in between
        String result = String.join(reversedWords, ' ');
        
        return result;
    
}
    public static List<Integer> getMinMax(List<Integer> nums){
        Integer minValue = nums[0];
        Integer maxValue = 0;
        for(Integer i = 0; i < nums.size();i++){
            if(nums[i] > maxValue){
                maxValue = nums[i];
            }
            if(nums[i] < minValue){
                minValue = nums[i];
            }
        }
        return new List<Integer>{minValue,MaxValue};
    }
	
    public static List<Object> showLastAccountContactCreated(){
        List<Object> obj = new List<Object>();
        List<Account> accList = [SELECT ID,Name from Account WHERE CreatedDate = Today ORDER BY CreatedDate DESC LIMIT 10];
        List<Contact> conList = [SELECT ID,Name from Contact WHERE CreatedDate = Today ORDER BY CreatedDate DESC LIMIT 10];
		
        if(accList.size() > 0){
            obj.add(accList);
        }
        if(conList.size() > 0){
            obj.add(conList);
        }
        return obj;
    }
    
    //Use caase 19 - find obj type based on recordId provided
    public static String objectTypeFindThroughRecordId(Id recId){
        String name = '';
        Map<String, Schema.SObjectType> sc = Schema.getGlobalDescribe();
        for(String sch : sc.keySet()){
            
            String keyPrefix = sc.get(sch).getDescribe().getKeyprefix();
            if(keyPrefix != null)
            {
                if(String.valueOf(recId).startsWith(keyPrefix)){
                    name = sch;
            }
        }

    }
    return name;

    }
    
  	//use case 20- Find the current user loggedin details and it should include timezone.locale,and lastlogin date
    public static void currentLoggedInUserDetails(){
        String userName = UserInfo.getName();
        System.debug(userName);
        String result = UserInfo.getLocale();
        System.debug(result);
        // Retrieve the Profile record using the Profile Id of the current user
        Profile userProfile = [SELECT Name FROM Profile WHERE Id = :UserInfo.getProfileId() LIMIT 1];
        System.debug(userProfile);
        // Get the Name of the Profile
        String profileName = userProfile.Name;
        
        // Output the profile name
        System.debug(profileName);
        
        TimeZone tz = UserInfo.getTimeZone();
    	System.debug('TimeZone is: ' + tz);
        
        String gettingUserName = UserInfo.getUserName();
        System.debug(gettingUserName);
        
    }
    public static boolean checkDupLead(Lead leadName){
        List<Lead> lls = [SELECT Id,Name,LeadSource,Email FROM Lead WHERE id != :leadName.Id AND Name = :leadName.Name AND Email = :leadName.Email AND LeadSource = :leadName.LeadSource];
        if(lls.size() > 0){
            return true;
        }
        else{
            return false;
        }
    }
    public static boolean checkTwoContactHaveSameParent(Contact con){
        List<Contact> conList = [SELECT Id, Name,AccountId FROM Contact WHERE AccountId =: con.AccountId];
        if(conList.size() > 1){
            return true;
        }
        return false;
    }
    public static boolean checkTwoContactHaveSameParent(Contact con1,Contact con2){
        if(con1 != null && con2 != null && con1.AccountId != null && con2.AccountId != null){
            if(con1.AccountId == con2.AccountId){
                return true;
            }
        }
        return false;
    }
    public static void caseAssignToSlaQueue(Case cs){  
        if(cs != null){
            if(cs.Origin == 'Web' && cs.Priority == 'High'){
               List<Group> que = [SELECT Id, Name, DeveloperName, Type FROM Group where Type = 'Queue' AND DeveloperName = 'SLA_queue'];
                if(que.size() == 1){
                    cs.OwnerId = que[0].Id;
                    update cs;
                }
            }
        }
    }
    public static void highestAnnualRevenueAccount(){
        Account acc = [SELECT Id, Name, AnnualRevenue FROM Account WHERE AnnualRevenue != null ORDER BY AnnualRevenue DESC NULLS LAST LIMIT 1];
        if(acc != null){
            System.debug('Highest annual revenue is '+ acc.AnnualRevenue +' Name is '+acc.Name);
        }
    }
    
    public static List<Case> mergedCase(String queue1, String queue2){
        List<Case> caseLists = new List<Case>();
      	List<Case> c1 = [SELECT Id FROM Case WHERE Owner.Name =:queue1];
        List<Case> c2 = [SELECT Id FROM Case WHERE Owner.Name =:queue2];
        
        caseLists.addAll(c1);
        caseLists.addAll(c2);
        return caseLists;
    }
    
    public static void customUseCase(Id caseId){
        List<Group> queueInfo = [Select Id from Group Where Type = 'Queue' AND DeveloperName = :System.Label.My_Primary_Queue LIMIT 1];
        List<Case> caseRec = [SELECT Id,OwnerId from Case where id = :caseId LIMIT 1];
        if(caseRec.size() == 1 && queueInfo.size() == 1){
            caseRec[0].OwnerId = queueInfo[0].Id;
            update caseRec[0];
        }
    }
    public static Set<Id> showAccountHavingOpportunityAndRevenue(){
        Set<Id> accountList = new Set<Id>();
        List<Opportunity> opps = [SELECT Id,Name,AccountId,Amount from Opportunity WHERE Amount > 8000];
        for(Opportunity oo : opps){
			accountList.add(oo.AccountId);            
        }
        return accountList;
    }    
    public static List<Case> caseList(){
        List<Case>mainList = new List<Case>();
        List<Case> c1 = [SELECT Id, Origin FROM Case where Origin = 'Web' ];
        List<Case> c2 = [SELECT Id, Origin FROM Case where Origin = 'Phone' ];
        mainList.addAll(c1);
        mainList.addAll(c2);
        return mainList;
    }
    
    public static Map<String,List<Case>> generateCase(){
		Map<String,List<Case>> caseMap = new Map<String,List<Case>>();
        List<Case> caseRec = [Select Id,Origin,CaseNumber FROM Case LIMIT 50000];
        for(Case cs : caseRec){
            System.debug('Origin is ' + cs.Origin+' Case number is '+ cs.CaseNumber);
            if(caseMap.containsKey(cs.Origin)){
                caseMap.get(cs.Origin).add(cs);
            }
            else{
                System.debug('Origin is ' + cs.Origin);
                List<Case> newCase = new List<Case>();
                newCase.add(cs);
                caseMap.put(cs.Origin,newCase);
            }
        }
        return caseMap;
    }
    public static List<String> useCase29(String sObjectName){
        List<String> nameList = new List<String>();
        List<RecordType> recordTypes = [SELECT Id, DeveloperName FROM RecordType WHERE SobjectType = :sObjectName];
        for(RecordType rt : recordTypes){
            nameList.add(rt.DeveloperName);
        }
        return nameList;     
    }
    
    //Now lets do the same 29case using schema class
    public static List<String> useCase29UsingSchema(String sObjectName){
        List<String> nameList = new List<String>();
		Map<String,Schema.RecordTypeInfo> records = Schema.getGlobalDescribe().get(sObjectName).getDescribe().getRecordTypeInfosByDeveloperName();
        for(String ss : records.keySet()){
            if(ss != 'master'){
                nameList.add(records.get(ss).getName());
            }
        }        
        return nameList;     
    }
}