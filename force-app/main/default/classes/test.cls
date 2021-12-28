public with sharing class test implements myInterface {
    
    public static void addUniqueAccounts(Integer numAccToMake) {
        List<Account> insertList = new List<Account>();
        Set<String> listOfAccNames = new Set<String>();

        //implement some random name generator
        for (int x = 1; x <= numAccToMake; x++) {
            listOfAccNames.add('Account' + x);
        }

        //create accounts from generated names
        for (String s : listOfAccNames) {
            Account newAcc = new Account();
            newAcc.Name = s;
            insertList.add(newAcc);
        }
        
        INSERT insertList;

        //challenge 16 query for accounts you added then remove them
        List<Account> removeList = [SELECT Id FROM Account WHERE Name LIKE 'Account_%'];
        DELETE removeList;

        //challenge 17
        List<Contact> noEmailList = [SELECT Email FROM Contact WHERE Email = null];
        List<Contact> noPhoneNumList = [SELECT Phone FROM Contact WHERE Phone = null];
        
        for (Contact c : noEmailList) {
            c.Email = 'default@email.com';
        }

        for (Contact c : noPhoneNumList) {
            c.Phone = '123-456-7890';
        }

        UPDATE noEmailList;
        UPDATE noPhoneNumList;

        //challenge 19
        //create 200 new contacts + update existing contacts email to default.

        //list to hold contacts to add
        List<Contact> existingContacts = [SELECT Email FROM Contact];

        //create 200 contacts with names 'Contact1' through 'Contact200' and add to existingContacts
        for (int x = 1; x <= 200; x++) {
            Contact newContact = new Contact();
            newContact.Name = 'Contact' + x;
            existingContacts.add(newContact);
        }
        
        //set the emails of all contacts in our existingContacts list to default@email.com
        for (Contact c : existingContacts) {
            c.Email = 'default@email.com';
        }

        //upsert our list to update all records that already exist or insert records that do not
        UPSERT existingContacts;

        /*
        NOTE: This will set the emails of our newly created contacts to default@email.com as well so if we want to prevent this we can
        switch the order of ourtwo for loops.
        */
    }

    public static void calcTotalMoney(List<Order> changeList) {

        //create and populate set of ids of accounts being modified
        Set<Id> idList = new Set<Id>();
        for (Order curOrder : changeList) {
            idList.add(curOrder.AccountId);
        }

        //get list of orders related to accounts in idlist
        List<Account> relatedAccountList = [SELECT name, (SELECT name, TotalAmount FROM Orders) FROM Account WHERE Account.Id IN :idList];

        for (Integer i = 0; i < relatedAccountList.size(); i++) {
            Double rollingSum = 0;
            Account curAccount = relatedAccountList.get(i);

            //add up TotalAmounts from orders
            for (Order curOrder : curAccount.Orders) {
                rollingSum += curOrder.TotalAmount;
            }

            //need to create some custom field to hold this
            curAccount.OrderSum = rollingSum;
        }

        UPDATE relatedAccountList;
    }
}
