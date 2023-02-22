@isTest
private class ExternalAPICalloutTest {
    
    @isTest
    static void testBatch() {
        // Create test data
        List<Test_Object__c> records = new List<Test_Object__c>();
        for (Integer obj = 0; obj < 10; obj++) {
            Test_Object__c record = new Test_Object__c();
            record.Name = 'Record ' + obj;
            records.add(record);
        }
        insert records;
        
        // Set up mock callouts
        Test.setMock(HttpCalloutMock.class, new ChuckNorrisMock());
        
        // Start the batch job
        Test.startTest();
        Database.executeBatch(new ExternalAPICallout());
        Test.stopTest();
        
        // Verify that the Custom Object records were updated with a joke
        List<Test_Object__c> updatedRecords = [SELECT Id, description__c FROM Test_Object__c WHERE Id IN :records];
        for (Test_Object__c record : updatedRecords) {
            System.assertEquals('Chuck Norris uses pepper spray to season his meat.', record.Description__c);
        }
    }
    
    // Mock callout class
    private class ChuckNorrisMock implements HttpCalloutMock {
        public HTTPResponse respond(HTTPRequest request) {
            // Create a mock response with a joke
            HttpResponse response = new HttpResponse();
            response.setHeader('Content-Type', 'application/json');
            response.setBody('{"icon_url":"https://assets.chucknorris.host/img/avatar/chuck-norris.png","id":"R9T2I36vSM6j0B8Axgyw0w","url":"https://api.chucknorris.io/jokes/R9T2I36vSM6j0B8Axgyw0w","value":"Chuck Norris uses pepper spray to season his meat."}');
            response.setStatusCode(200);
            return response;
        }
    }
}