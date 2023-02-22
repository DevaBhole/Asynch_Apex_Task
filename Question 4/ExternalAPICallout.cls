global class ExternalAPICallout implements Database.Batchable<SObject>, Database.AllowsCallouts {
    
    global Database.QueryLocator start(Database.BatchableContext BC) {
        // Get the records to process
        return Database.getQueryLocator([SELECT Id,Description__c FROM Test_Object__c]);
    }

    global void execute(Database.BatchableContext BC, List<Test_Object__c> records) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.chucknorris.io/jokes/random');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        
        // Parse the response to get the joke text
        if (response.getStatusCode() == 200) {
            Map<String, Object> jsonResponse = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            String joke = (String) jsonResponse.get('value');
            
            // Update the Custom Object record with the joke text
            for (Test_Object__c record : records) {
                record.Description__c = joke;
            }
            update records;
        } else {
            // Log an error if the API call was not successful
            System.debug('Error calling Chuck Norris API: ' + response.getBody());
        }
    }

    global void finish(Database.BatchableContext BC) {
        // Do any cleanup here
    }
}