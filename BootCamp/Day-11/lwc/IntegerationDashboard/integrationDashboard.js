import { LightningElement, wire } from 'lwc';

import getApplicationsForIntegration
    from '@salesforce/apex/ApplicationController.getApplicationsForIntegration';

import retryCandidateSync
    from '@salesforce/apex/ApplicationController.retryCandidateSync';

import { ShowToastEvent }
    from 'lightning/platformShowToastEvent';

import { refreshApex }
    from '@salesforce/apex';

export default class IntegrationDashboard extends LightningElement {

    applications = [];

    wiredApplicationsResult;

    @wire(getApplicationsForIntegration)
    wiredApplications(result) {

        this.wiredApplicationsResult = result;

        const { data, error } = result;

        if (data) {

            this.applications = data.map(application => {

                return {
                    ...application,

                    studentName:
                        application.Student__r
                            ? application.Student__r.Name
                            : '',

                    jobName:
                        application.Jobss__r
                            ? application.Jobss__r.Name
                            : ''
                };
            });

        } else if (error) {

            console.error(
                'Error loading applications:',
                error
            );
        }
    }


    handleRetrySync(event) {

        const applicationId =
            event.target.dataset.id;

        retryCandidateSync({
            applicationId: applicationId
        })

        .then(result => {

            this.showToast(
                'Success',
                result,
                'success'
            );

            return refreshApex(
                this.wiredApplicationsResult
            );
        })

        .catch(error => {

            let message =
                'Unable to retry candidate synchronization.';

            if (
                error.body &&
                error.body.message
            ) {
                message = error.body.message;
            }

            this.showToast(
                'Error',
                message,
                'error'
            );
        });
    }


    showToast(title, message, variant) {

        this.dispatchEvent(
            new ShowToastEvent({
                title: title,
                message: message,
                variant: variant
            })
        );
    }
}
