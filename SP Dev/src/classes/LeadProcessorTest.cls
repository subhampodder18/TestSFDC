@isTest
public class LeadProcessorTest {
    static testmethod void testLead200() {
        List<Lead> leads = LeadProcessorTestFactory.createLeads(200);
        insert leads;
        
        Test.startTest();
        Database.executeBatch(new LeadProcessor());
        Test.stopTest();
        
        System.assert([SELECT count() FROM Lead WHERE LeadSource = 'Dreamforce'] == 200);
    }
}