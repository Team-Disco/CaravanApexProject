global with sharing class FetchProducts {

    @AuraEnabled(cacheable=true)
    global static List<Product2> queryProducts(Integer offset, Integer perpage, String search) {
        try {
            if (search != '') {
                return Database.query('SELECT Name FROM Product2 WHERE Name LIKE \'%' + search + '%\' LIMIT :perpage OFFSET :offset');
            }
            return [SELECT Name FROM Product2 LIMIT :perpage OFFSET :offset];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}
