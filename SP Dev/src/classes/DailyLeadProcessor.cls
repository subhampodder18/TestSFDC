global class DailyLeadProcessor implements Schedulable{
	 global void execute(SchedulableContext ctx) {
         List<Lead> leads = [SELECT Id,LeadSource from Lead WHERE LeadSource = null LIMIT 200];
         if (leads.size() > 0){
             for (Lead l : leads ){
                 l.LeadSource = 'Dreamforce';
             }
         }
         
         if(leads.size() > 0){
         	Database.update(leads);    
         }
         
     }
}