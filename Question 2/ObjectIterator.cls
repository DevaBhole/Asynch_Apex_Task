public class ObjectIterator implements Iterator<Test_Object__c>{ 
    
    private List<Test_Object__c> objects;
    private Integer currentIndex;
    
    public ObjectIterator(List<Test_Object__c> objects){
        this.objects = objects;
        this.currentIndex = 0;
    }
    
    public Boolean hasNext(){ 
        return currentIndex < objects.size();
    }    
    
    public Test_Object__c next(){
        if(hasNext()) {
            return objects[currentIndex++];
        } else {
            throw new NoSuchElementException('Iterator has no more elements.');
        }
    } 
}
