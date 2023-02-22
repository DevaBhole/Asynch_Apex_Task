@isTest
public class BatchChainingTest {
@testSetup
    public static void createObjects(){
        List<Test_Object__c> listOfObj = new List<Test_Object__c>();
        for(Integer obj = 0; obj<199 ;obj++){
            Test_Object__c testObj = new Test_Object__c();
            testObj.name = 'Test Object' + obj;
            testObj.Profession__c = 'Actor';
            listOfObj.add(testObj);
        }
        insert listOfObj;
    }
    
    @isTest
    public static void testDescription(){
        
        Test.startTest();
        FirstBatch objprocess = new FirstBatch();
        Id batchId  = Database.executeBatch(objprocess);
        Test.stopTest();
        List<Test_Object__c> lstOfObj = [SELECT name,Description__c FROM Test_Object__c WHERE name LIKE 'Test Object%'];
        for(Test_Object__c obj : lstOfObj){
            System.assertEquals('For Batch Chaining', obj.Description__c);
        }
    }
}