trigger contactTrigger on Contact (before insert) {
    //since we're only catching one event the switch statement is kind of pointless but is good to have in case extra functionality needed.
    switch on trigger.operationType {
        
        when BEFORE_INSERT {

            //best practice to use helper classes to contain handling code but only catching one event so putting code here is fine
            List<Contact> orgContacts = [SELECT email FROM Contact];

            //implementation 1 (naive solution with O(n^2) time complexity)
            boolean success = true;

            for (Contact c : trigger.new) {
                success = true;
                for (Contact orgC : orgContacts) {
                    if (c.Email == orgC.Email) {
                        c.addError('Contact with same email already exists in the org.');
                        success = false;
                        break;
                    }
                }
                if (success) orgContacts.add(c);
            }

            //implementation 2 (O(n) time complexity)
            //this will still allow email that use the same characters with different cases so to remedy this you can call .toLowerCase() on all strings.

            Integer prevSize = 0;
            Set<String> emailList = new Set<String>();
            for (Contact c : orgContacts) {
                emailList.add(c.Email);
            }
            for (Contact c : trigger.new) {
                prevSize = emailList.size();
                emailList.add(c.Email);
                if (prevSize == emailList.size()) {
                    c.addError('Contact with same email already exists in the org.');
                }
            }
        }
    }
}
