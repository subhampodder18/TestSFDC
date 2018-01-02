trigger AccountAddressTrigger on Account (before insert, before update) {

	for (Account acc : Trigger.new) {
		if(acc.BillingPostalCode != null && acc.Match_Billing_Address__c == true){
			system.debug('inside trigger.new');
			acc.ShippingPostalCode = acc.BillingPostalCode;
		}
	}
}