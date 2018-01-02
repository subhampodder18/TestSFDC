public class class1 {
    String s1 = 'Hi Welcome to Visualforce';
    Account a = new Account(Name ='Dell', Industry = 'Technology');
    List<Account> actList = [SELECT Name, Industry from Account LIMIT 10];
    
    public String getstr1(){
        return s1;
    }
    
    public Account getacct(){
        return a;
    }
    
    public List<Account> getaccLst(){
        return actList;
    }
    
}