trigger UpdateContactNameinAccount on Contact (after insert, after update , after delete) {
    
    List<Id> con = new List<Id>();
    for (Contact c : Trigger.isDelete ? Trigger.old : Trigger.new){
        con.add(c.Accountid);
        if(Trigger.isUpdate && Trigger.oldMap.get(c.Id).Accountid != Trigger.newMap.get(c.Id).Accountid){
            con.add(Trigger.oldMap.get(c.Id).Accountid);
        }
    }
    
    
    
   List<Account> contacts = [Select id,Name,Tradestyle, (Select id,FirstName,LastName from Contacts)  from Account WHERE Id in: con ];
   List<Account> accToUpdate = new List<Account>();
    
    for(Account a : contacts){
        List<Contact> conList = a.Contacts;
        a.Number_of_Contacts__c = conList.size();
        a.Tradestyle = '';
        
        for(Contact c : conList){            
           if(c.FirstName != null && c.FirstName != ''){
               a.Tradestyle += c.FirstName+' ';
           }
            a.Tradestyle += c.LastName+',';
        }
        
        if(a.Tradestyle.length() > 0){
            a.Tradestyle = a.Tradestyle.removeEnd(',');
        }
        
        accToUpdate.add(a);
    }
    
    
    update accToUpdate;
    
    
}