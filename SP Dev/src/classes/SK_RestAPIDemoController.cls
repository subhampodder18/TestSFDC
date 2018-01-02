@RestResource(urlMapping='/RestAPIDemo/*')
global  class SK_RestAPIDemoController {
    @HttpGet
    global static List<Account> searchAccounts() {
        String cName = RestContext.request.params.get('searchString');
        string searchName = '%' + cName + '%';
        List<Account> accList = new List<Account>();
        accList = [ Select ID, Name, Type,Industry, BillingCountry from Account where Name Like : searchName];
        return accList;
    }
    
    @HttpPost   
    global static String createNewAccount() {
        string returnString='';
        try{
            string requestBody = RestContext.request.requestBody.toString();
            system.debug('****accDetails sent by JSON:'+requestBody);
            accountWrapper accDetails = (accountWrapper) System.JSON.deserialize(requestBody, accountWrapper.class);
            Account acc=new Account();
            acc.Name= accDetails.accName;
            acc.Type = accDetails.aType;
            acc.Industry =accDetails.aIndustry;
            insert acc;
            returnString = 'Account created successfully with record Id:'+acc.id; 
        }catch(exception ex){
            returnString = 'Request got failed: Error details-'+ex.getmessage();
        }
        
        return returnString;
    }
    
    global class accountWrapper{
        global string accName;
        global string aType;
        global string aIndustry;
    }
}