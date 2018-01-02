public class LeadProcessorTestFactory {
    public static List<Lead> createLeads(Integer count) {
        List<Lead> leads = new List<Lead>();
        for(Integer i = 0; i < count; i++) {
            leads.add(new Lead(LastName = 'testLead', Company = 'testCompany', Status = 'Open - Not Contacted'));
        }
        return leads;
    }
}