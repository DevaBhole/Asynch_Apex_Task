public class ObjectIterator implements Iterator<Test_Object__c> {
    
    List<Test_Object__c> objectProcessed;
    Integer recordIndex = 0;
    public ObjectIterator(String profession){
        objectProcessed = [SELECT id,profession__c FROM Test_Object__c WHERE profession__c =: profession];
    }
    public Test_Object__c next(){
        recordIndex++;
        return objectProcessed[recordIndex];
        
    }
    public Boolean hasNext(){
        return objectProcessed.size() -1 > recordIndex;
    }
}