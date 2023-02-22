public class IterableInterface implements Database.Batchable<Test_Object__c>{
    
    public Iterable<Test_Object__c> start(Database.BatchableContext bc){
        return new ObjectIterable();
    }
    public void execute(Database.BatchableContext btx , List<Test_Object__c> objectList){
        System.debug('Total Number of Rcords Retrived' + objectList.size());
        
        for(Test_Object__c objectTest : objectList){
            objectTest.Description__c = 'Iterable Interface';
        }
        update objectList;
    }
    
    public void finish(Database.BatchableContext btx){
        
    }
}