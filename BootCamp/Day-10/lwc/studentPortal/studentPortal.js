import { LightningElement, api, wire } from 'lwc';

import getStudent
from '@salesforce/apex/StudentPlacementController.getStudent';

import { refreshApex } from '@salesforce/apex';

import { ShowToastEvent }
from 'lightning/platformShowToastEvent';

export default class StudentPortal extends LightningElement {

    // Student ID from Lightning App Builder
    @api studentId;

    student;

    loading = true;

    errorMessage = '';

    wiredStudentResult;

    // =====================================================
    // LOAD STUDENT
    // =====================================================

    @wire(getStudent,{
        studentId:'$studentId'
    })
    wiredStudent(result){

        this.wiredStudentResult = result;

        const {data,error}=result;

        if(data){

            this.student=data;

            this.loading=false;

            this.errorMessage='';

        }

        else if(error){

            this.student=null;

            this.loading=false;

            this.errorMessage=this.getErrorMessage(error);

        }

    }

    // =====================================================
    // PROFILE SAVED
    // =====================================================

    async handleProfileSaved(){

        this.showToast(
            'Success',
            'Student profile updated successfully.',
            'success'
        );

        await refreshApex(this.wiredStudentResult);

        const jobs=this.template.querySelector(
            'c-eligible-jobs'
        );

        if(jobs){
            jobs.refreshJobs();
        }

        const applications=this.template.querySelector(
            'c-my-applications'
        );

        if(applications){
            applications.refreshApplications();
        }

    }

    // =====================================================
    // APPLICATION CREATED
    // =====================================================

    handleApplicationCreated(){

        const applications=this.template.querySelector(
            'c-my-applications'
        );

        if(applications){
            applications.refreshApplications();
        }

    }

    // =====================================================
    // ERROR
    // =====================================================

    getErrorMessage(error){

        if(
            error &&
            error.body &&
            error.body.message
        ){
            return error.body.message;
        }

        if(error && error.message){
            return error.message;
        }

        return 'Unable to load student information.';
    }

    // =====================================================
    // TOAST
    // =====================================================

    showToast(title,message,variant){

        this.dispatchEvent(
            new ShowToastEvent({
                title,
                message,
                variant
            })
        );
    }
}
