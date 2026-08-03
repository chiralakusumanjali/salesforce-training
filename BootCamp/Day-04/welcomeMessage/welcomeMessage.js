import { LightningElement } from 'lwc';

export default class WelcomeMessage extends LightningElement {

    message = '';

    showMessage() {

        this.message =
            'Welcome to Vishnu Placement Cell Portal! Check the available jobs and apply before the last date.';

    }

}
