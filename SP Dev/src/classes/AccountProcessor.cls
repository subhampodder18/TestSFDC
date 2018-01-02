public class AccountProcessor{

    @future
    public static void countContacts(Set<Id> setId){
        List<Account> lstAccount = [select id, Number_of_Contacts__c , (select id from contacts ) from account where id in :setId];
            for(Account acc: lstAccount ){
                List<Contact> con = acc.contacts;
                acc.Number_of_Contacts__c = con.size();
            }
        Database.update(lstAccount);    
    }
}