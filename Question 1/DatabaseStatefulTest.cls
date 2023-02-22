@isTest
public class DatabaseStatefulTest {
 @testSetup
    public static void createRecords(){
         List<Contact> contactList = new List<Contact>{new Contact(LastName = 'Test Contact for Job')};
            insert contactList;
        
        List<Job__c> jobList = new List<Job__c>();
        for(Integer job=0; job<20; job++) {
            Job__c jobObj = new Job__c();
            jobObj.Name = 'InActive Job'+ job;
            jobObj.name__c = 'InActive Job' + job;
            jobObj.Manager__c = contactList[0].Id;
            jobObj.Total_positions__c = 20;
            jobObj.Expires_ON__c = Date.today().addDays(-1);
            jobObj.Active__c = True;
            jobList.add(jobObj);
           }
         insert jobList;
        List<Candidate__c> listOfCandidate = new List<Candidate__c>();
        for(Integer candidate = 0; candidate<199 ;candidate++){
            Candidate__c candObj = new Candidate__c();
            candObj.Name = 'Test Candidate' + candidate;
            candObj.Job__c = jobList[0].id;
            candObj.First_Name__c = 'Test' + candidate;
            candObj.Last_Name__c ='Last' + candidate;
            candObj.Application_Date__c = Date.parse('03/03/2023');
            candObj.Expected_Salary__c = 7889;
            candObj.Activity__c = 'Activity'+ candidate;
            listOfCandidate.add(candObj);
        }
        insert listOfCandidate;
    }
    
     @isTest
    public static void candStatus(){
       List<Candidate__c> lstOfLead = [SELECT name,Id,Activity__c FROM candidate__c];
        Test.startTest();
        DatabaseStateful candprocess = new DatabaseStateful();
        Id batchId  = Database.executeBatch(candprocess);
        Test.stopTest();
        
        System.assertEquals(199, [SELECT count() FROM candidate__c WHERE name LIKE 'Test Candidate']);
    }
}