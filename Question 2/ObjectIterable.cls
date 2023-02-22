public class ObjectIterable implements Iterable<Test_Object__c> {

    public Iterator<Test_Object__c> Iterator(){
        return new ObjectIterator('Actor');
    }
}