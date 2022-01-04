import { api, LightningElement, wire } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';
import NAME from '@salesforce/schema/Product2.Name';
//import ARMOREDGLOVES from '@salesforce/resourceUrl/armoredGloves';


export default class ProductNode extends LightningElement {
    @api
    productId;

    imagePath = '';//ARMOREDGLOVES;
    productName = 'Default Product Name';

    @wire(getRecord, {recordId: '$productId', fields: [NAME]})
    record;
}