import { LightningElement, api, wire } from 'lwc';

import getJobs from '@salesforce/apex/JobController.getJobs';
import submitApplication from '@salesforce/apex/ApplicationController.submitApplication';

import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class EligibleJobs extends LightningElement {

    // ==========================================
    // STUDENT
    // ==========================================

    @api studentId;


    // ==========================================
    // JOB DATA
    // ==========================================

    jobs;

    error;


    // ==========================================
    // VIEW DETAILS
    // ==========================================

    selectedJob;

    showDetails = false;


    // ==========================================
    // APPLICATION
    // ==========================================

    isProcessing = false;

    applyButtonLabel = 'Apply';


    // ==========================================
    // GET JOBS
    // ==========================================

    @wire(getJobs)
    wiredJobs({ data, error }) {

        if (data) {

            this.jobs = data;

            this.error = undefined;

            console.log(
                'Jobs loaded:',
                JSON.stringify(data)
            );

        }

        else if (error) {

            this.error = error;

            this.jobs = undefined;

            console.error(
                'Error loading jobs:',
                error
            );
        }
    }


    // ==========================================
    // VIEW DETAILS
    // ==========================================

    handleViewDetails(event) {

        // Get the Job Id from the button
        const jobId =
            event.currentTarget.dataset.id;


        console.log(
            'VIEW CLICKED'
        );

        console.log(
            'Job Id:',
            jobId
        );


        // Find the selected job
        this.selectedJob =
            this.jobs.find(
                job => job.Id === jobId
            );


        console.log(
            'Selected Job:',
            JSON.stringify(this.selectedJob)
        );


        // If job is found, show details
        if (this.selectedJob) {

            this.showDetails = true;

        }

        else {

            console.error(
                'Job not found:',
                jobId
            );

        }
    }


    // ==========================================
    // CLOSE DETAILS
    // ==========================================

    closeDetails() {

        this.showDetails = false;

        this.selectedJob = undefined;
    }


    // ==========================================
    // APPLY
    // ==========================================

    handleApply(event) {

        // Get Job Id
        const jobId =
            event.currentTarget.dataset.jobId;


        console.log(
            'APPLY CLICKED'
        );

        console.log(
            'Job Id:',
            jobId
        );


        // Check student Id
        if (!this.studentId) {

            this.dispatchEvent(

                new ShowToastEvent({

                    title: 'Error',

                    message:
                        'Student Id is missing.',

                    variant: 'error'

                })

            );

            return;
        }


        // Start processing
        this.isProcessing = true;

        this.applyButtonLabel = 'Applying...';


        // Call Apex
        submitApplication({

            studentId: this.studentId,

            jobId: jobId

        })

        .then(result => {

            console.log(
                'Application Id:',
                result
            );


            // Success message
            this.dispatchEvent(

                new ShowToastEvent({

                    title:
                        'Application Successful',

                    message:
                        'Application submitted successfully.',

                    variant:
                        'success'

                })

            );

        })

        .catch(error => {

            console.error(
                'Application error:',
                error
            );


            let message =
                'Application failed.';


            // Get Apex error message
            if (
                error &&
                error.body &&
                error.body.message
            ) {

                message =
                    error.body.message;

            }


            // Error toast
            this.dispatchEvent(

                new ShowToastEvent({

                    title:
                        'Application Failed',

                    message:
                        message,

                    variant:
                        'error'

                })

            );

        })

        .finally(() => {

            // Stop processing
            this.isProcessing = false;

            this.applyButtonLabel = 'Apply';

        });
    }

}
