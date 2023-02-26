public class ObjectIterable implements Iterable<Test_Object__c> {
   public Iterator<Test_Object__c> iterator(){
      List<Test_Object__c> objects = [SELECT Id,Description__c FROM Test_Object__c];
      return new ObjectIterator(objects);
   }
}
