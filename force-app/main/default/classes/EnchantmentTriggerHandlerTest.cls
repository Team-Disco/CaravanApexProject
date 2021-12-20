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
            newEnchantment.Product__c = addProductList.get(i/10);
        }

        INSERT addProductList;
        INSERT addEnchantmentList;
    }

    


}
