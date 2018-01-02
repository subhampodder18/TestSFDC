public class DailyLeadProcessorTestFactory {
    public static List<Lead> createLeads(Integer numOfLeads){
        
        List<Lead> leads = new List<Lead>();
        for(Integer i = 0 ; i < numOfLeads; i++){
            String LastNamegen = 'testLast'+i;
            Lead l = new Lead(LastName = LastNamegen, Company = 'testComp', Status = 'Open - Not Contacted');
            leads.add(l);
        }
        
        return leads;
    }
}