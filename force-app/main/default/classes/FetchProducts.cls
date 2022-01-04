global with sharing class FetchProducts {

    @AuraEnabled(cacheable=true)
    global static List<Product2> queryProducts(Integer offset) {
        try {
            return [SELECT Name FROM Product2 LIMIT 50 OFFSET :offset];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}
