import { api, LightningElement, wire } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';
import NAME from '@salesforce/schema/Product2.Name';
//import ARMOREDGLOVES from '@salesforce/resourceUrl/armoredGloves';


export default class ProductNode extends LightningElement {
    @api
    productId;

    imagePath = '';//ARMOREDGLOVES;

    @wire(getRecord, {recordId: '$productId', fields: [NAME]})
    record;

    get productName() {
        return this.record.data.fields.Name.value;
    }

    fireEvent() {
        let myEvent = new CustomEvent('productnodeclicked', {detail: this.productId, bubbles: true, composed: true});
        this.dispatchEvent(myEvent);
    }
}