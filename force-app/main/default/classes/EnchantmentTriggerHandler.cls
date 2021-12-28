public with sharing class EnchantmentTriggerHandler {

    public static void updateParentEnchantmentScore(List<Enchantment__c> changeList) {
        //create idSet of ids of products that are related to our changelist enchantments
        Set<Id> idSet = new Set<Id>();
        for (Enchantment__c curEnchantment : changeList) {
            idSet.add(curEnchantment.Product__c);
        }

        //select all products in our idSet and return their list of enchantments too.
        List<Product2> parentProductList = [SELECT name, (SELECT name, enchantment_rating__c FROM Enchantments__r) FROM Product2 WHERE Id IN :idSet];

        //using normal for loop in order to modify parentProductList during iteration
        //modify enchantment rating of products to be sum of enchantment ratings of their enchantments
        for (Integer i = 0; i < parentProductList.size(); i++) {
            Double rollingSum = 0;
            Product2 curProduct = parentProductList.get(i);

            //add up enchantment ratings of enchantments on curProduct
            for (Enchantment__c curEnchantment : curProduct.Enchantments__r) {
                rollingSum += curEnchantment.Enchantment_Rating__c;
            }

            curProduct.Enchantment_Rating__c = rollingSum;
        }

        //commit changes to products
        UPDATE parentProductList;
    }
}
