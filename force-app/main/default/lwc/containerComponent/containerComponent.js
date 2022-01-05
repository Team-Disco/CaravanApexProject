import { api, LightningElement, wire } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';

import UTILITY_RATING_FIELD from '@salesforce/schema/Product2.Utility_Rating__c';
import PHYSICAL_OFFENSE_RATING_FIELD from '@salesforce/schema/Product2.Physical_Offense_Rating__c';
import PHYSICAL_DEFENSE_RATING_FIELD from '@salesforce/schema/Product2.Physical_Defense_Rating__c';
import MAGICAL_OFFENSE_RATING_FIELD from '@salesforce/schema/Product2.Magical_Offense_Rating__c';
import MAGICAL_DEFENSE_RATING_FIELD from '@salesforce/schema/Product2.Magical_Defense_Rating__c';

export default class ContainerComponent extends LightningElement {
    @api
    recordId;

    fieldNames = ['Utility', 'Physical Offense', 'Physical Defense', 'Magical Defense', 'Magical Offense'];

    @wire(getRecord, {recordId: '$recordId', fields: [UTILITY_RATING_FIELD, PHYSICAL_OFFENSE_RATING_FIELD,
        PHYSICAL_DEFENSE_RATING_FIELD, MAGICAL_DEFENSE_RATING_FIELD, MAGICAL_OFFENSE_RATING_FIELD]})
    record;

    get fieldValues() {
        return [this.record.data.fields.Utility_Rating__c.value, this.record.data.fields.Physical_Offense_Rating__c.value, this.record.data.fields.Physical_Defense_Rating__c.value,
        this.record.data.fields.Magical_Defense_Rating__c.value, this.record.data.fields.Magical_Offense_Rating__c.value];
    }

}