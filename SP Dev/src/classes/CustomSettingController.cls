public with sharing class CustomSettingController {

public Custome_Settings__c custSetting {get;set;}
public Boolean isEdit {get;set;}
public Decimal number_Of_Days{get;set;}
public String strName{get;set;}


    public CustomSettingController()
    {
        custSetting = [select id , Number_Of_Days__c,User_name__c from Custome_Settings__c limit 1];

        number_Of_Days= custSetting.Number_Of_Days__c;
        strName = custSetting.User_name__c ;
    
        isEdit = false;
    }
    
    public void Cancel()
    {
        isEdit = false;
    }

    public void Edit()
    {
        isEdit = true;
    }
    
    public void Save()
    {
       try
       { 
        custSetting.Number_Of_Days__c =number_Of_Days;
        custSetting.User_name__c =strName;

        update custSetting;
        isEdit = false;
        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO, 'Data Saved Successfuly !!!' ) );
       }Catch(Exception ee){
           ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, ee.getMessage()) );
       } 
    }
    

}