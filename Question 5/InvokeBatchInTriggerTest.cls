@isTest
public class InvokeBatchInTriggerTest {
    @isTest
    public static void testPercent(){
        List<Test_Object__c> listOfObj = new List<Test_Object__c>();
        for(Integer obj = 0; obj<199 ;obj++){
            Test_Object__c testObj = new Test_Object__c();
            testObj.name = 'Test Object' + obj;
             
            listOfObj.add(testObj);
        }
       
        Test.startTest();
       insert listOfObj;
        Test.stopTest();
        List<Test_Object__c> lstOfObj = [SELECT name,Percent__c FROM Test_Object__c WHERE name LIKE 'Test Object%'];
        for(Test_Object__c obj : lstOfObj){
            System.assertEquals(13, obj.Percent__c);
        }
    }
}