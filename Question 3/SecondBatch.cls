public class SecondBatch implements Database.Batchable<Sobject>{
    
    public Database.QueryLocator start(Database.BatchableContext bc){
       return Database.getQueryLocator('SELECT id ,Description__c FROM Test_Object__c');
   }
    public void execute(Database.BatchableContext btx , List<Test_Object__c> objectList){
        for(Test_Object__c objectTest : objectList){
            objectTest.Description__c = 'For Batch Chaining';
           }
        update objectList;
    }
    
    public void finish(Database.BatchableContext btx){
       
    }

}