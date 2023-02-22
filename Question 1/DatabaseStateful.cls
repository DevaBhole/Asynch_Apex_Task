public class DatabaseStateful implements Database.Batchable<SObject>, Database.Stateful {
    private Integer count = 0;
    
    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator([SELECT Id, First_Name__c FROM Candidate__c]);
    }
    
    public void execute(Database.BatchableContext bc, List<Candidate__c> lstCandidate) {
        //It Will Maintained the previous batch state
        System.debug('Previous Record Processed' + count);
        for (Candidate__c candidateObj : lstCandidate) {
            candidateObj.Activity__c = 'Processed by Batch ' + count;
            count++;
        }
        update lstCandidate;
    }
    public void finish(Database.BatchableContext bc) {
        System.debug('Total number of records processed: ' + count);
    }
}