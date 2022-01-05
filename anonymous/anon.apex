/*
    List<String> prefix1 = new List<String> {
    'Hearty',
    'Mystic',
    'Ancient',
    'Rusted',
    'Sturdy',
    'Demented',
    'Greedy',
    'Envious',
    'Polished',
    'Malicious',
    'Cursed',
    'Malignant',
    'Transcendant',
    'Crystaline',
    'Dull',
    'Holy',
    'Combative',
    'Elegant',
    'Faithful',
    'Graceful',
    'Exuberant',
    'Fierce'
    };

    List<String> weapons2 = new List<String> {
    'Longbow',
    'Crossbow',
    'Slingshot',
    'Shortbow'
    };

    List<String> weapons3 = new List<String> {
    'Casting Wand',
    'Grand Staff',
    'Grimoire'
    };

    List<String> weapons1 = new List<String> {
    'Battle-axe',
    'Hand-axe',
    'Longsword',
    'Gladius',
    'Broadsword',
    'Trident',
    'Polearm',
    'Spear',
    'Mace',
    'Dagger',
    'Scimitar',
    'Scythe',
    'Bowstaff',
    'Morning Star',
    'Battle-hammer',
    'Iron Knuckles'
    };

    List<String> materials = new List<String> {
    'Chainmail',
    'Iron',
    'Steel',
    'Dragonskin',
    'Obsidian',
    'Leather'
    };

    List<String> armors = new List<String> {
    'Helmet',
    'Chestplate',
    'Leggings',
    'Boots',
    'Gloves'
    };

    List<String> sizes = new List<String> {
    'extra-small',
    'small',
    'medium',
    'large',
    'extra-large'
    };

    Set<Product2> weaponList1 = new Set<Product2>();
while (weaponList1.size() < 70) {
    Product2 newProduct = new Product2();
    newProduct.Name = prefix1[(Integer)(Math.random() * (prefix1.size() - 1))] + ' ' + weapons1[(Integer)(Math.random() * (weapons1.size() - 1))];
    newProduct.Utility_Rating__c = Decimal.valueOf((Math.random() * 100)).setScale(0);
    newProduct.Physical_Offense_Rating__c = Decimal.valueOf((Math.random() * 100)).setScale(0);
    newProduct.Physical_Defense_Rating__c = Decimal.valueOf((Math.random() * 100)).setScale(0);
    newProduct.Magical_Offense_Rating__c = Decimal.valueOf((Math.random() * 100)).setScale(0);
    newProduct.Magical_Defense_Rating__c = Decimal.valueOf((Math.random() * 100)).setScale(0);
    newProduct.Category__c = 'Melee Weaponry';
    weaponList1.add(newProduct);
}

Set<Product2> weaponList2 = new Set<Product2>();
while (weaponList2.size() < 10) {
    Product2 newProduct = new Product2();
    newProduct.Name = prefix1[(Integer)(Math.random() * (prefix1.size() - 1))] + ' ' + weapons2[(Integer)(Math.random() * (weapons2.size() - 1))];
    newProduct.Utility_Rating__c = Decimal.valueOf((Math.random() * 100)).setScale(0);
    newProduct.Physical_Offense_Rating__c = Decimal.valueOf((Math.random() * 100)).setScale(0);
    newProduct.Physical_Defense_Rating__c = Decimal.valueOf((Math.random() * 100)).setScale(0);
    newProduct.Magical_Offense_Rating__c = Decimal.valueOf((Math.random() * 100)).setScale(0);
    newProduct.Magical_Defense_Rating__c = Decimal.valueOf((Math.random() * 100)).setScale(0);
    newProduct.Category__c = 'Ranged Weaponry';
    weaponList2.add(newProduct);
}

Set<Product2> weaponList3 = new Set<Product2>();
while (weaponList3.size() < 10) {
    Product2 newProduct = new Product2();
    newProduct.Name = prefix1[(Integer)(Math.random() * (prefix1.size() - 1))] + ' ' + weapons3[(Integer)(Math.random() * (weapons3.size() - 1))];
    newProduct.Utility_Rating__c = Decimal.valueOf((Math.random() * 100)).setScale(0);
    newProduct.Physical_Offense_Rating__c = Decimal.valueOf((Math.random() * 100)).setScale(0);
    newProduct.Physical_Defense_Rating__c = Decimal.valueOf((Math.random() * 100)).setScale(0);
    newProduct.Magical_Offense_Rating__c = Decimal.valueOf((Math.random() * 100)).setScale(0);
    newProduct.Magical_Defense_Rating__c = Decimal.valueOf((Math.random() * 100)).setScale(0);
    newProduct.Category__c = 'Magical Weaponry';
    weaponList3.add(newProduct);
}

Set<Product2> armorList = new Set<Product2>();
while (armorList.size() < 60) {
    Product2 newProduct = new Product2();
    newProduct.Name = prefix1[(Integer)(Math.random() * (prefix1.size() - 1))] + ' ' + materials[(Integer)(Math.random() * 
        (materials.size() - 1))] + ' ' + armors[(Integer)(Math.random() * (armors.size() - 1))];
    newProduct.Utility_Rating__c = Decimal.valueOf((Math.random() * 100)).setScale(0);
    newProduct.Physical_Offense_Rating__c = Decimal.valueOf((Math.random() * 100)).setScale(0);
    newProduct.Physical_Defense_Rating__c = Decimal.valueOf((Math.random() * 100)).setScale(0);
    newProduct.Magical_Offense_Rating__c = Decimal.valueOf((Math.random() * 100)).setScale(0);
    newProduct.Magical_Defense_Rating__c = Decimal.valueOf((Math.random() * 100)).setScale(0);
    newProduct.Category__c = 'Armor';
    newProduct.Size__c = sizes[(Integer)(Math.random() * (sizes.size() - 1))];
    armorList.add(newProduct);
}

Product2 newProduct = new Product2();
newProduct.Name = 'Holy Hand Grenade of Antioch';
newProduct.Utility_Rating__c = 100;
newProduct.Physical_Offense_Rating__c = 100;
newProduct.Physical_Defense_Rating__c = 100;
newProduct.Magical_Offense_Rating__c = 100;
newProduct.Magical_Defense_Rating__c = 100;
newProduct.Category__c = 'Magical Weaponry';
weaponList1.add(newProduct);

List<Product2> wList1 = new List<Product2>(weaponList1);
List<Product2> wList2 = new List<Product2>(weaponList2);
List<Product2> wList3 = new List<Product2>(weaponList3);
List<Product2> aList = new List<Product2>(armorList);

INSERT wList1;
INSERT wList2;
INSERT wList3;
INSERT aList;

*/

/*
Create 70 melee weapons
Create 10 ranged weapons
Create 10 magical weapons
Create 60 Armors
*/


//create holy hand grenade of antioch