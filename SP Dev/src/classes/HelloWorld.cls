public class HelloWorld
{
    public static void applyDiscount(Customer__c[] customers)
    {
        for(Customer__c c:customers)
        {
            c.Billing_Amount__c *= 0.9;
        }
    }
}