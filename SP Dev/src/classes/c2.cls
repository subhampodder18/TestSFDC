public class c2{
    List<Account> acctsLst;
     
     public List<Account> getaccLst(){
         return acctsLst;
     }   
     
     public PageReference showall(){
         acctsLst = [SELECT Name,Industry, Phone, Fax FROM Account LIMIT 100];
         return null;
     }
    
    public PageReference showtech(){
        acctsLst = [SELECT Name,Industry, Phone, Fax FROM Account where Industry = 'Technology' LIMIT 100];
        return null;
    }
}