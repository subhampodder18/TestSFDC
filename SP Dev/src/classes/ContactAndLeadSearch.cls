public class ContactAndLeadSearch {
	 public static List<List< SObject>> searchContactsAndLeads(String contactName)
     {
         List<List< 
             SObject>> searchList = [FIND :contactName IN ALL FIELDS 
                                           RETURNING Contact(FirstName,LastName) ,
                                           Lead(FirstName,Lastname)];
         return searchList;
     }
}