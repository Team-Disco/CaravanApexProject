import { api, LightningElement, wire } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';

export default class ContainerComponent extends LightningElement {
    @api
    recordId;

    @wire(getRecord, {recordId: '$recordId', fields: ['Utility_Rating__c', 'Physical_Offense_Rating__c',
    'Physical_Defense_Rating__c', 'Magical_Defense_Rating__c', 'Magical_Offense_Rating__c']})
    record;

    fieldNames;
    fieldValues;

    get utilityRating() {
        return this.record.data.fields.Utility_Rating__c.value;
    }

    get physicalOffenseRating() {
        return this.record.data.fields.Physical_Offense_Rating__c.value;
    }

    get physicalDefenseRating() {
        return this.record.data.fields.Physical_Defense_Rating__c.value;
    }

    get magicalOffenseRating() {
        return this.record.data.fields.Magical_Offense_Rating__c.value;
    }

    get magicalDefenseRating() {
        return this.record.data.fields.Magical_Defense_Rating__c.value;
    }

    passStatGraphData() {
        this.fieldNames = ['Utility', 'Physical Offense', 'Physical Defense', 'Magical Defense', 'Magical Offense'];
        this.fieldValues = [this.utilityRating, this.physicalOffenseRating, this.physicalDefenseRating, this.magicalDefenseRating, this.magicalOffenseRating];
    }


}