import {
    LightningElement,
    api
} from 'lwc';

import updateStudent
    from '@salesforce/apex/StudentPlacementController.updateStudent';

import {
    ShowToastEvent
} from 'lightning/platformShowToastEvent';

export default class StudentProfile extends LightningElement {

    @api student;

    phone = '';
    email = '';
    branch = '';
    cgpa = '';
    backlogs = '';

    saving = false;


    @api
    refreshForm() {
        this.loadStudent();
    }


    connectedCallback() {
        this.loadStudent();
    }


    loadStudent() {

        if (!this.student) {
            return;
        }

        this.phone =
            this.student.Phone__c || '';

        this.email =
            this.student.Student_Email__c || '';

        this.branch =
            this.student.Branch__c || '';

        this.cgpa =
            this.student.CGPA__c ?? '';

        this.backlogs =
            this.student.Backlogs__c ?? 0;
    }


    handleChange(event) {

        const field =
            event.target.dataset.field;

        this[field] =
            event.target.value;
    }


    async handleSave() {

        if (!this.student) {
            return;
        }

        this.saving = true;

        try {

            await updateStudent({

                studentId:
                    this.student.Id,

                phone:
                    this.phone,

                email:
                    this.email,

                branch:
                    this.branch,

                cgpa:
                    Number(this.cgpa),

                backlogs:
                    Number(this.backlogs)
            });


            this.showToast(
                'Success',
                'Profile saved successfully.',
                'success'
            );


            this.dispatchEvent(
                new CustomEvent(
                    'savedsuccess'
                )
            );

        } catch (error) {

            this.showToast(
                'Error',
                this.getErrorMessage(error),
                'error'
            );

        } finally {

            this.saving = false;
        }
    }


    showToast(title, message, variant) {

        this.dispatchEvent(
            new ShowToastEvent({
                title,
                message,
                variant
            })
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

        return 'Unable to save profile.';
    }
}
