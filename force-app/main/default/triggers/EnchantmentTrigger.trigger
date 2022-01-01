trigger EnchantmentTrigger on Enchantment__c (before insert, before update, before delete, after insert, after update, after delete, after undelete) {

    switch on trigger.operationType {
        when BEFORE_INSERT { 
            
        }
        when BEFORE_UPDATE { 
            // Fires on Upsert and Merge
            
        }
        when BEFORE_DELETE { 
            // Fires on Merge
            // Must use trigger.old here
        }
        when AFTER_INSERT { 
            // Fires on Upsert
            EnchantmentTriggerHandler.updateParentEnchantmentScore(trigger.new);
        }
        when AFTER_UPDATE { 
            // Fires on Upsert and Merge
            // Can use trigger.old here
            EnchantmentTriggerHandler.updateParentEnchantmentScore(trigger.new);
        }
        when AFTER_DELETE { 
            // Fires on Merge
            // Must use trigger.old here
            EnchantmentTriggerHandler.updateParentEnchantmentScore(trigger.old);
        }
        when AFTER_UNDELETE {
            EnchantmentTriggerHandler.updateParentEnchantmentScore(trigger.new);
        }
    }
}