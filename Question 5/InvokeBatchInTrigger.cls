public class InvokeBatchInTrigger implements Database.Batchable<Sobject>{
    
    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('SELECT id ,Percent__c FROM Test_Object__c');
    }
    public void execute(Database.BatchableContext btx , List<Test_Object__c> objectList){
        for(Test_Object__c objectTest : objectList){
            objectTest.Percent__c = 13;
        }
        update objectList;
    }
    
    public void finish(Database.BatchableContext btx){
        SecondBatch description = new SecondBatch();
        Database.executeBatch(description);
    }
}