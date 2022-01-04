import { LightningElement, wire } from 'lwc';
import getProductIds from '@salesforce/apex/FetchProducts.queryProducts';

export default class CataloguePage extends LightningElement {
    currentOffset = 0;
    @wire(getProductIds, {offset: '$currentOffset'})
    productIdList;
}