@isTest 
private class HelloWorldTestClass {
    static testMethod void validateHelloWorld() {
       Customer__c c = new Customer__c(Name='Subham', Billing_Amount__c=500.60);
       System.debug('Price before inserting new bill: ' + c.Billing_Amount__c);

       // Insert book
       insert c;
    
       // Retrieve the new book
       c = [SELECT Billing_Amount__c FROM Customer__c WHERE Id =:c.Id];
       System.debug('Price after trigger fired: ' + c.Billing_Amount__c);

       // Test that the trigger correctly updated the price
       System.assertEquals(450.54, c.Billing_Amount__c);
    }
}