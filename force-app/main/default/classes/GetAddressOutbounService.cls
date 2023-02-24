/**
 * @author: mvelame - Salesforce
 */

public with sharing class GetAddressOutbounService {
   
    public ViaCepAddressResponse findAddress ( String zipCode ) {

        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://viacep.com.br/ws/' + zipCode + '/json');
        request.setMethod('GET');
        
        Http http = new Http();
        HttpResponse response = http.send(request);

        String payload = response.getBody();
        System.debug('Status -----' + response.getStatus());
        System.debug('Status Code -----' + response.getStatusCode());
        System.debug(payload);



        return ( ViaCepAddressResponse ) JSON.deserialize(payload, ViaCepAddressResponse.class);
        
    }
}