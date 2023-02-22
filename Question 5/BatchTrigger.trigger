trigger BatchTrigger on Test_Object__c (before insert,after insert) {

    if(Trigger.isInsert){
    if(Trigger.isAfter){
         InvokeBatchInTrigger batchTrigger = new InvokeBatchInTrigger();
        Database.executeBatch(batchTrigger);
    }
}
}