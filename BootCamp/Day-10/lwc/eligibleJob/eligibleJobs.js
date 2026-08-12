import {
    LightningElement,
    api,
    wire
} from 'lwc';

import {
    refreshApex
} from '@salesforce/apex';

import getEligibleJobs
from '@salesforce/apex/JobController.getEligibleJobs';

import submitApplication
from '@salesforce/apex/ApplicationController.submitApplication';

import {
    ShowToastEvent
} from 'lightning/platformShowToastEvent';


export default class EligibleJobs extends LightningElement {
    @api studentId;

    jobs = [];

    errorMessage = '';

    isLoading = true;

    selectedJob = null;

    showDetails = false;

    submittingJobId = null;

    wiredJobsResult;


    // =====================================================
    // GET ELIGIBLE JOBS
    // =====================================================

    @wire(getEligibleJobs)
    wiredJobs(result) {

        this.wiredJobsResult = result;

        const {
            data,
            error
        } = result;

        if (data) {

            this.jobs = data;

            this.errorMessage = '';

        } else if (error) {

            this.jobs = [];

            this.errorMessage =
                this.getErrorMessage(error);
        }

        this.isLoading = false;
    }


    // =====================================================
    // GETTERS
    // =====================================================

    get hasJobs() {

        return this.jobs.length > 0;
    }


    get showNoJobs() {

        return (
            !this.isLoading &&
            !this.errorMessage &&
            this.jobs.length === 0
        );
    }


    // =====================================================
    // REFRESH JOBS
    // =====================================================

    @api
    async refreshJobs() {

        if (!this.wiredJobsResult) {
            return;
        }

        this.isLoading = true;

        try {

            await refreshApex(
                this.wiredJobsResult
            );

        } catch (error) {

            this.errorMessage =
                this.getErrorMessage(error);

        } finally {

            this.isLoading = false;
        }
    }


    // =====================================================
    // VIEW DETAILS
    // =====================================================

    handleViewDetails(event) {

        const jobId =
            event.currentTarget.dataset.id;

        this.selectedJob =
            this.jobs.find(
                job => job.Id === jobId
            );

        if (this.selectedJob) {

            this.showDetails = true;
        }
    }


    // =====================================================
    // CLOSE DETAILS
    // =====================================================

    closeDetails() {

        this.showDetails = false;

        this.selectedJob = null;
    }


    // =====================================================
    // APPLY
    // =====================================================

    async handleApply(event) {

        const jobId =
            event.currentTarget.dataset.id;

        await this.applyForJob(jobId);
    }


    // =====================================================
    // APPLY FROM MODAL
    // =====================================================

    async handleModalApply() {

        if (!this.selectedJob) {
            return;
        }

        await this.applyForJob(
            this.selectedJob.Id
        );
    }


    // =====================================================
    // APPLY FOR JOB
    // =====================================================

    async applyForJob(jobId) {

        if (!jobId) {

            this.showToast(
                'Application Failed',
                'Job Id is missing.',
                'error'
            );

            return;
        }

        this.submittingJobId = jobId;

        try {

            await submitApplication({
                jobId: jobId
            });

            this.showToast(
                'Application Submitted',
                'Application submitted successfully.',
                'success'
            );

            this.dispatchEvent(
                new CustomEvent(
                    'applicationcreated'
                )
            );

            this.closeDetails();

            await this.refreshJobs();

        } catch (error) {

            this.showToast(
                'Application Failed',
                this.getErrorMessage(error),
                'error'
            );

        } finally {

            this.submittingJobId = null;
        }
    }


    // =====================================================
    // ERROR MESSAGE
    // =====================================================

    getErrorMessage(error) {

        if (
            error &&
            error.body &&
            error.body.message
        ) {

            return error.body.message;
        }

        if (
            error &&
            error.message
        ) {

            return error.message;
        }

        return 'Unable to complete the request.';
    }


    // =====================================================
    // TOAST
    // =====================================================

    showToast(
        title,
        message,
        variant
    ) {

        this.dispatchEvent(
            new ShowToastEvent({
                title: title,
                message: message,
                variant: variant
            })
        );
    }
}
