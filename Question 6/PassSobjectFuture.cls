public class PassSobjectFuture {
    @future
    public static void futureMethod(String serializedObjects){
        List<Test_Object__c> objects = (List<Test_Object__c>) JSON.deserialize(serializedObjects, List<Test_Object__c>.class);
        
        for (Test_Object__c obj : objects) {
            
            obj.Description__c = 'Passed Sobject';
        }
        update objects;
    }
}