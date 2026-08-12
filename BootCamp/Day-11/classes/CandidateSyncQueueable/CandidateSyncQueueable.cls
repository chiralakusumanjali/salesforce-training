public class CandidateSyncQueueable implements Queueable, Database.AllowsCallouts {

    private Id applicationId;

    public CandidateSyncQueueable(Id applicationId) {
        this.applicationId = applicationId;
    }

    public void execute(QueueableContext context) {

        Application__c applicationRecord = [
            SELECT
                Id,
                Stauts__c,
                Student__c,
                Jobss__c,
                Application_Date__c,

                External_Candidate_Id__c,
                Integration_Error__c,
                Integration_Status__c,
                Last_Integration_Attempt__c,

                Student__r.Name,
                Student__r.Student_Id__c,
                Student__r.Student_Email__c,
                Student__r.Branch__c,
                Student__r.CGPA__c,

                Jobss__r.Name,
                Jobss__r.Company__c,
                Jobss__r.Job_Role__c

        FROM Application__c
        WHERE Id = :applicationId
        LIMIT 1
    ];

    /*
     * Only Selected applications should be synchronized.
     */
    if (applicationRecord.Stauts__c != 'Selected') {
        return;
    }

    /*
     * Prevent duplicate candidate registration.
     */
    if (String.isNotBlank(
        applicationRecord.External_Candidate_Id__c
    )) {
        return;
    }

    /*
     * Record the time of this integration attempt.
     */
    applicationRecord.Last_Integration_Attempt__c =
        System.now();

    try {

        /*
         * Build candidate request.
         */
        CandidateRequest candidate = new CandidateRequest();

        candidate.studentId =
            applicationRecord.Student__r.Student_Id__c;

        candidate.name =
            applicationRecord.Student__r.Name;

        candidate.email =
            applicationRecord.Student__r.Student_Email__c;

        candidate.branch =
            applicationRecord.Student__r.Branch__c;

        candidate.cgpa =
            applicationRecord.Student__r.CGPA__c;

        /*
         * Job information.
         */
        candidate.jobId =
            applicationRecord.Jobss__r.Name;

        candidate.company =
            applicationRecord.Jobss__r.Company__c;

        candidate.role =
            applicationRecord.Jobss__r.Job_Role__c;

        if (applicationRecord.Application_Date__c != null) {

            candidate.selectionDate =
                String.valueOf(
                    applicationRecord.Application_Date__c
                );
        }

        /*
         * Convert Apex object to JSON.
         */
        String requestBody =
            JSON.serialize(candidate);

        /*
         * Create HTTP request.
         */
        HttpRequest request = new HttpRequest();

        request.setEndpoint(
            'callout:Recruitment_API/candidates'
        );

        request.setMethod('POST');

        request.setHeader(
            'Content-Type',
            'application/json'
        );

        request.setBody(requestBody);

        request.setTimeout(120000);

        /*
         * Send request.
         */
        Http http = new Http();

        HttpResponse response =
            http.send(request);

        Integer statusCode =
            response.getStatusCode();

        String responseBody =
            response.getBody();

        /*
         * SUCCESS
         */
        if (statusCode == 200 ||
            statusCode == 201) {

            CandidateResponse candidateResponse =
                (CandidateResponse) JSON.deserialize(
                    responseBody,
                    CandidateResponse.class
                );

            applicationRecord.Integration_Status__c =
                'Sent';

            applicationRecord.Integration_Error__c =
                null;

            if (candidateResponse != null &&
                String.isNotBlank(
                    candidateResponse.externalCandidateId
                )) {

                applicationRecord.External_Candidate_Id__c =
                    candidateResponse.externalCandidateId;
            }
        }

        /*
 * 400 - BAD REQUEST
 */
else if (statusCode == 400) {

    applicationRecord.Integration_Status__c =
        'Failed';

    applicationRecord.Integration_Error__c =
        'HTTP 400 - Bad request sent to external recruitment API.';
}

/*
 * 401 - AUTHENTICATION FAILURE
 */
else if (statusCode == 401) {

    applicationRecord.Integration_Status__c =
        'Failed';

    applicationRecord.Integration_Error__c =
        'HTTP 401 - Authentication with external recruitment API failed.';
}

/*
 * 403 - FORBIDDEN
 */
else if (statusCode == 403) {

    applicationRecord.Integration_Status__c =
        'Failed';

    applicationRecord.Integration_Error__c =
        'HTTP 403 - Authenticated request is not authorised.';
}

/*
 * OTHER CLIENT ERRORS
 */
else if (statusCode >= 400 &&
         statusCode < 500) {

    applicationRecord.Integration_Status__c =
        'Failed';

    applicationRecord.Integration_Error__c =
        'HTTP ' +
        statusCode +
        ' - Client error returned by external recruitment API.';
}

/*
 * SERVER ERROR
 *
 * These errors can be retried.
 */
else if (statusCode >= 500) {

    applicationRecord.Integration_Status__c =
        'Retry Required';

    applicationRecord.Integration_Error__c =
        'HTTP ' +
        statusCode +
        ' - External recruitment service unavailable. Retry required.';
}

        /*
         * UNEXPECTED RESPONSE
         */
        else {

            applicationRecord.Integration_Status__c =
                'Failed';

            applicationRecord.Integration_Error__c =
                'HTTP ' +
                statusCode +
                ' - Unexpected response from external API.';
        }

    }
    catch (Exception ex) {

        /*
         * Callout/system exception.
         */
        applicationRecord.Integration_Status__c =
            'Retry Required';

        applicationRecord.Integration_Error__c =
            'HTTP Callout Error - External recruitment API could not be reached.';
    }

    /*
     * Save the integration result.
     */
    update applicationRecord;
}


/*
 * Request JSON wrapper.
 */
public class CandidateRequest {

    public String studentId;
    public String name;
    public String email;
    public String branch;
    public Decimal cgpa;
    public String jobId;
    public String company;
    public String role;
    public String selectionDate;
}


/*
 * Response JSON wrapper.
 */
public class CandidateResponse {

    public Boolean success;
    public String externalCandidateId;
    public String message;
}
}
