import { LightningElement, wire } from 'lwc';
import getStudents from '@salesforce/apex/StudentController.getStudents';

export default class PlacementHome extends LightningElement {

    student;
    error;

    @wire(getStudents)
    wiredStudents({ data, error }) {

        if (data) {
            this.student = data[0];
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.student = undefined;
        }

    }
}
