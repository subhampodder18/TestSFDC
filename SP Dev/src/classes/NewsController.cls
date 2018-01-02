public class NewsController {

    
    public String JSONresponse{get;set;}
    public Data UserData{get;set;}
    
    Public pageReference RefreshUserData(){
        //creating new http req
    Http httpProtocol = new Http();
    HttpRequest request = new HttpRequest();
    
    //set endpoint and method
    String id = '6006c3321c2e493c90944d5e352481d0';
    String endpoint = 'https://newsapi.org/v1/articles?source=fox-sports&sortBy=latest&apiKey='+id;
    request.setEndpoint(endpoint);
    request.setMethod('GET');
    
    //get response
    HttpResponse response = httpProtocol.send(request);
    JSONresponse = response.getBody();
        system.debug(JSONresponse);    
    
    JSONParser parser = JSON.createParser(JSONresponse);
    while (parser.nextToken() != null) {
                   
                    if (parser.getCurrentToken() == JSONToken.START_OBJECT) {
                        // Read entire JSON object, including its array of items.
                     
                      UserData = (data)parser.readValueAs(data.class);  
                       system.debug( UserData);  
                 }
          }
        return null;
    }

        //wrapper classes start
        public class data{
        
        public list<article> articles{get;set;}
        public string status{get;set;}
        public string source{get;set;}
        public string sortBy{get;set;}
    }
    
        public class article{
                public string author{get;set;}
                public string title{get;set;}
                public string description{get;set;}
                public string url{get;set;}
                public string urlToImage{get;set;}
                public Datetime publishedAt{get;set;}
        }
    //wrapper class end    
}