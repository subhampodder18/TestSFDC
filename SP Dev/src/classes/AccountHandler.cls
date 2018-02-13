public class AccountHandler {
    public static Account insertNewAccount(String name) {
        Account Acct = new Account();
        Acct.Name = name;
        System.debug('test');
        try{
            insert Acct;
        }
        catch (Exception e) {
            return null;
        }
        return Acct;
    }
}