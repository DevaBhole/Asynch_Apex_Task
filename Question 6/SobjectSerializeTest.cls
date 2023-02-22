@isTest
public class SobjectSerializeTest {
    @isTest
    public static void methodForTest() {
    
    List<Test_Object__c> objects = [SELECT id ,Description__c FROM Test_Object__c];

    // Serialize the list of Accounts
    String serializedObjects = JSON.serialize(objects);

    // Call a future method and pass in the serialized list of Accounts
    PassSobjectFuture.futureMethod(serializedObjects);
        for(Test_Object__c obj : objects){
                 System.assertEquals('Passed Sobject',obj.Description__c);
             }
  }
}
