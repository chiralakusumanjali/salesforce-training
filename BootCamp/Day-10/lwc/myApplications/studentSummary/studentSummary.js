import {
    LightningElement,
    api
} from 'lwc';

export default class StudentSummary extends LightningElement {

    @api student;


    get hasStudent() {

        return this.student != null;
    }
}
