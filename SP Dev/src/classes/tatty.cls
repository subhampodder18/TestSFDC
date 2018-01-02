public with sharing class tatty {
    public String SessionID { get; set; }
    
    public tatty() {
    SessionID = UserInfo.getSessionID();
    
    String Username,Password;
    Username = 'subham@tcs.com';
    Password = '4rfv$RFV';
    
    HttpRequest request = new HttpRequest();    
    Blob headerValue = Blob.valueOf(Username + ':' + Password);
    //String authorizationHeader = 'Basic ' + EncodingUtil.base64Encode(headerValue);
    String authorizationHeader = 'OAuth ' + UserInfo.getSessionId();
    
    request.setHeader('Authorization', authorizationHeader);
    
    request.setEndpoint('https://subham17-dev-ed.my.salesforce.com/services/async/40.0/job/7502800000Bb3zA');
    request.setMethod('GET');
    HttpResponse response = new Http().send(request);
    String strResp = '';
    system.debug('******response '+response.getStatusCode());
    system.debug('******response '+response);
    }
}