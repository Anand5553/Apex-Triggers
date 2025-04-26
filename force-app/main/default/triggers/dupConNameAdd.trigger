trigger dupConNameAdd on Contact (before insert) {
	
    //imagine i have already  stored all the names 
    Set<String> names = new Set<String>();
    for(Contact c : Trigger.new){
        names.add(c.LastName);
    }
    
    Map<String,Contact> mp = new Map<String,Contact>([SELECT Id, LastName FROM Contact WHERE LastName IN: names]);
    
    for(Contact con : Trigger.new){
        if(mp.containsKey(con.LastName) && !con.LastName.startsWith('Duplicate')){
            con.LastName = 'Duplicate '+ con.LastName;
        }
	}

}