public class c3{
    Account acct = new Account();
     
     public Account getaccnt(){
         return acct;
     }   
        
    public PageReference save(){
        if(acct!=null){
            insert acct;
        }
       
        return null;
    }
}