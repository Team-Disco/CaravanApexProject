import { LightningElement } from 'lwc';
import CARAVAN_LOGO from '@salesforce/resourceUrl/caravanlogo';

export default class Footer extends LightningElement {
    logoUrl = CARAVAN_LOGO;

    backToTop() {
        document.body.scrollTop = 0;
        document.documentElement.scrollTop = 0;
    }
}