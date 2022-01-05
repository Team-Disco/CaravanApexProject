import { LightningElement, track, wire } from 'lwc';
import getProductIds from '@salesforce/apex/FetchProducts.queryProducts';
import { getRecord } from 'lightning/uiRecordApi';

import NAME from '@salesforce/schema/Product2.Name';
import ISACTIVE from '@salesforce/schema/Product2.IsActive';
import CATEGORY from '@salesforce/schema/Product2.Category__c';
import ENCHANTMENTRATING from '@salesforce/schema/Product2.Enchantment_Rating__c';
import SIZE from '@salesforce/schema/Product2.Size__c';

import UTILITY_RATING_FIELD from '@salesforce/schema/Product2.Utility_Rating__c';
import PHYSICAL_OFFENSE_RATING_FIELD from '@salesforce/schema/Product2.Physical_Offense_Rating__c';
import PHYSICAL_DEFENSE_RATING_FIELD from '@salesforce/schema/Product2.Physical_Defense_Rating__c';
import MAGICAL_OFFENSE_RATING_FIELD from '@salesforce/schema/Product2.Magical_Offense_Rating__c';
import MAGICAL_DEFENSE_RATING_FIELD from '@salesforce/schema/Product2.Magical_Defense_Rating__c';

export default class CataloguePage extends LightningElement {
    fieldNames = ['Utility2', 'Physical Offense', 'Physical Defense', 'Magical Defense', 'Magical Offense'];

    record;
    currentOffset = 0;
    childStatGraph = this.template.querySelector('.statGraph');
    currentPage = 1;
    perPage = 30;
    search = '';

    @track
    recordId;

    @wire(getProductIds, {offset: '$currentOffset', perpage: '$perPage', search: '$search'})
    productIdList;

    @wire(getRecord, {recordId: '$recordId', fields: [NAME, ISACTIVE, CATEGORY, ENCHANTMENTRATING, SIZE, UTILITY_RATING_FIELD, PHYSICAL_OFFENSE_RATING_FIELD,
        PHYSICAL_DEFENSE_RATING_FIELD, MAGICAL_DEFENSE_RATING_FIELD, MAGICAL_OFFENSE_RATING_FIELD]})
    getRecord({data, error}) {
        if (data) {
            this.record = data;
            this.childStatGraph = this.template.querySelector('.statGraph');
            this.childStatGraph.statList = this.fieldValues;
            this.childStatGraph.drawStatGraph();
        } else if (error) {
            console.log('wire error');
        }
    }

    get fieldValues() {
        if (this.record) {
            return [this.record.fields.Utility_Rating__c.value, this.record.fields.Physical_Offense_Rating__c.value, this.record.fields.Physical_Defense_Rating__c.value,
                this.record.fields.Magical_Defense_Rating__c.value, this.record.fields.Magical_Offense_Rating__c.value];
        }
        return [0, 0, 0, 0, 0];
    }

    get recordName() {
        if (this.record) {
            return this.record.fields.Name.value;
        }
        return 'None Selected';
    }

    get isAvailable() {
        if (!this.record || this.record.fields.IsActive.value) {
            return true;
        }
        return false;
    }

    get recordCategory() {
        if (this.record) {
            return this.record.fields.Category__c.value;
        }
        return '';
    }

    get recordSize() {
        if (this.record) {
            return this.record.fields.Size__c.value;
        }
        return '';
    }

    get recordEnchantmentRating() {
        if (this.record) {
            return Math.max(this.record.fields.Enchantment_Rating__c.value, 0);
        }
        return 0;
    }

    updateStatGraph(event) {
        this.recordId = event.detail;
    }

    updateProductsPerPage() {
        this.perPage = this.template.querySelector('.select').value;
    }

    updateNextPage() {
        this.currentOffset = this.currentPage * this.perPage;
        this.currentPage += 1;
    }

    updatePrevPage() {
        if (this.currentPage > 1) {
            this.currentPage -= 1;
            this.currentOffset = (this.currentPage - 1) * this.perPage;
        }
    }

    updateSearchProducts() {
        this.search = this.template.querySelector('.inputBox').value;
    }
}