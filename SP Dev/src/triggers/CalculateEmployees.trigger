trigger CalculateEmployees on Employee__c (after insert, after update) {
    
    List<id> empIDs = new List<id>();
    for(Employee__c emp : Trigger.new){
        empIDs.add(emp.id);
    }
    
    List<Company__c> comp= [SELECT Id,Number_of_Employees__c from Company__c where Id in: empIDs];
    
	
    

}