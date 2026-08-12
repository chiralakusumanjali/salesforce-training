import { LightningElement, api } from 'lwc';

export default class JobDetails extends LightningElement {

    @api job;


    handleApply() {

        this.dispatchEvent(
            new CustomEvent(
                'applyclicked',
                {
                    detail: {
                        jobId: this.job.Id
                    }
                }
            )
        );
    }
}
