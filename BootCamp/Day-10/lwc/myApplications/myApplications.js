
import {
    LightningElement,
    api,
    wire
} from 'lwc';

import {
    refreshApex
} from '@salesforce/apex';

import getMyApplications
    from '@salesforce/apex/ApplicationController.getMyApplications';

export default class MyApplications extends LightningElement {

    @api studentId;

    applications = [];

    errorMessage = '';

    isLoading = true;

    wiredApplicationsResult;


    @wire(
        getMyApplications,
        {
            studentId: '$studentId'
        }
    )
    wiredApplications(result) {

        this.wiredApplicationsResult = result;

        const {
            data,
            error
        } = result;

        if (data) {

            this.applications = data;

            this.errorMessage = '';

        } else if (error) {

            this.applications = [];

            this.errorMessage =
                this.getErrorMessage(error);
        }

        this.isLoading = false;
    }


    get hasApplications() {

        return this.applications.length > 0;
    }


    @api
    async refreshApplications() {

        if (!this.wiredApplicationsResult) {
            return;
        }

        await refreshApex(
            this.wiredApplicationsResult
        );
    }


    getErrorMessage(error) {

        if (
            error &&
            error.body &&
            error.body.message
        ) {
            return error.body.message;
        }

        return 'We could not load your applications.';
    }
}
