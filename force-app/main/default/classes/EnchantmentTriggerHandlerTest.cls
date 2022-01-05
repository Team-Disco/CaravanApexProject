@isTest
public class EnchantmentTriggerHandlerTest {
    @TestSetup
    public static void testSetup() {
        //create a bunch of enchantments and products with relationships

        //10 products
        List<Product2> addProductList = new List<Product2>();
        for (Integer i = 1; i <= 10; i++) {
            Product2 newProduct = new Product2();
            newProduct.Name = 'Product ' + i;
            addProductList.add(newProduct);
        }

        //100 enchantments with relationship to products
        List<Enchantment__c> addEnchantmentList = new List<Enchantment__c>();
        for (Integer i = 1; i <= 100; i++) {
            Enchantment__c newEnchantment = new Enchantment__c();
            newEnchantment.Name = 'Enchantment ' + i;
            newEnchantment.Enchantment_Rating__c = (Math.random() * 199) + 1;
            newEnchantment.Product__c = addProductList.get(i/10).Id;
        }

        INSERT addProductList;
        INSERT addEnchantmentList;
    }

    @isTest
    static void testRollup(){
        Test.startTest();
        Double testValue = 15;
        Product2 testProduct = new Product2();
        testProduct.Name = 'testProduct';

        Enchantment__c testEnchantment = new Enchantment__c();
        testEnchantment.Name = 'testEnchantment';
        testEnchantment.Enchantment_Rating__c = testValue;
        testEnchantment.Product__c = testProduct.Id;

        Database.insert(testPRoduct);
        Database.insert(testEnchantment);

        Product2 queriedProduct = [SELECT Name, Enchantment_Rating__c FROM Product2 WHERE Name = 'testProduct' LIMIT 1];
        System.assertEquals(testValue, queriedProduct.Enchantment_Rating__c);
        Test.stopTest();

    }
    


}
