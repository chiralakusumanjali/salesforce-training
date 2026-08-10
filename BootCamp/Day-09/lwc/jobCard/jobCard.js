import { LightningElement, api } from 'lwc';

export default class JobCard extends LightningElement {

    // Parent passes the Job record
    @api job;

    // Used to prevent multiple clicks
    isProcessing = false;


    // =========================================
    // APPLY BUTTON LABEL
    // =========================================

    get applyButtonLabel() {

        return this.isProcessing
            ? 'Submitting...'
            : 'Apply';
    }


    // =========================================
    // APPLY
    // =========================================

    handleApply(event) {

        const jobId =
            event.currentTarget.dataset.jobId;

        console.log(
            'Apply clicked. Job Id:',
            jobId
        );


        // Disable button
        this.isProcessing = true;


        // Send event to parent
        this.dispatchEvent(
            new CustomEvent('apply', {

                detail: {
                    jobId: jobId
                }

            })
        );
    }


    // =========================================
    // VIEW DETAILS
    // =========================================

    handleViewDetails(event) {

        const jobId =
            event.currentTarget.dataset.jobId;

        console.log(
            'View Details clicked. Job Id:',
            jobId
        );


        this.dispatchEvent(
            new CustomEvent('viewdetails', {

                detail: {
                    jobId: jobId
                }

            })
        );
    }


    // =========================================
    // RESET PROCESSING
    // =========================================

    @api
    resetProcessing() {

        this.isProcessing = false;
    }
}
