public class LeadProcessor implements Database.Batchable<sObject> {
    public Database.QueryLocator start(Database.BatchableContext jobId) {
        return Database.getQueryLocator('SELECT LeadSource FROM Lead');
    }
    
    public Void execute(Database.BatchableContext jobId, List<Lead> recordList){
        for (Lead l : recordList){
            l.LeadSource = 'Dreamforce';
        }
        Database.update(recordList);
    }
    
    public Void finish(Database.BatchableContext jobId){
        
    }
}