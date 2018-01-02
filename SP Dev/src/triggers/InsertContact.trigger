trigger InsertContact on Contact (after insert) {
    /*List<Contact> needAccounts = new List<Contact>();
    List<Account> AccountsInsertList = new List<Account>();
    for(Contact c: Trigger.new)
    {
        if(String.isBlank(c.AccountId))
        {
            needAccounts.add(c);
        }
    }
    
    if (needAccounts.size() > 0)
    {
        for(Contact c: needAccounts)
        {
            String accountName = c.FirstName+' '+c.LastName;
            Account a = new Account(Name = accountName);
            AccountsInsertList.add(a);
            //c.AccountId = a.Id;
        }
    }
    Database.insert(AccountsInsertList, false);*/
    
    Map<Id, Account> accounts = new Map<Id, Account>();
    List<Contact> contacts = new List<Contact>();
    for(Contact eachContact : Trigger.new){
        accounts.put(eachContact.Id, new Account(Name = eachContact.FirstName + ' ' + eachContact.LastName));
    }
    insert accounts.values();
    for(Contact eachContact : Trigger.new){
        contacts.add(new Contact(Id = eachContact.Id, AccountId = accounts.get(eachContact.Id).Id));
    }
    update contacts;
}