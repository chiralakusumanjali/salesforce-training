import { LightningElement } from 'lwc';

export default class ApplicationStatus extends LightningElement {

    status = 'Not Applied';

    applyJob() {

        this.status = 'Applied Successfully';

    }

}
