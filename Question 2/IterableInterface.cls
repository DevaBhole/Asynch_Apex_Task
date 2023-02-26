public class IterableInterface implements Database.Batchable<Test_Object__c>{
    
   public Iterable<Test_Object__c> start(Database.BatchableContext bc){
       return new ObjectIterable();
   }
   public void execute(Database.BatchableContext bc, List<Test_Object__c> lstObj){
       List<Test_Object__c> objectsToUpdate = new List<Test_Object__c>();
       for(Test_Object__c obj : lstObj){
          obj.Description__c = 'Iterable Interface';
           objectsToUpdate.add(obj);
       }
       update objectsToUpdate;
   }
   public void finish(Database.BatchableContext bc){
   }
}
