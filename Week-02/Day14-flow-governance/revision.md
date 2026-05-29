Day 14 – Revision Questions and Detailed Answers

---

1. Why are approval workflows important?

Approval workflows are structured processes that ensure important business actions are reviewed and authorized before being completed. In large organizations, many decisions involve financial, operational, or strategic impact. Allowing employees to perform such actions without review can lead to mistakes, fraud, or policy violations.

An approval workflow defines:

* Who submits a request
* Who reviews it
* Who approves it
* What happens after approval or rejection

Example:

In a college management system, a faculty member may request leave. Instead of automatically approving the request, it passes through:

Faculty → HOD → HR → Principal

Each approver verifies specific information before the leave is granted.

Benefits:

* Prevents unauthorized actions
* Improves accountability
* Reduces mistakes
* Ensures compliance with policies
* Creates audit trails

Without approval workflows, organizations would struggle to maintain control over important business processes.

---

2. Why do businesses require governance?

Governance refers to the rules, controls, policies, and procedures used to manage business operations. It ensures that employees and systems operate according to organizational standards.

Without governance:

* Employees may misuse systems
* Important decisions may lack oversight
* Compliance requirements may be violated
* Business risks may increase

Example:

A finance employee should not be able to approve their own budget request. Governance ensures that approvals come from authorized individuals.

Governance provides:

* Security
* Accountability
* Transparency
* Risk management
* Regulatory compliance

Strong governance helps organizations operate efficiently and responsibly.

---

3. What are branching workflows?

Branching workflows are automated processes that follow different paths based on specific conditions or decisions.

In Salesforce Flow Builder, branching is typically implemented using Decision Elements.

Example:

Attendance Monitoring System

If Attendance ≥ 75%

→ No action required

If Attendance < 75%

→ Warning Email

If Attendance < 60%

→ Parent Notification

If Attendance < 50%

→ Administrative Escalation

The workflow follows different branches depending on attendance percentage.

Benefits:

* Personalized automation
* Faster decision-making
* Reduced manual work
* Improved process flexibility

Branching workflows allow systems to react intelligently to different business situations.

---

4. Why should automation follow business rules?

Automation is powerful, but it must operate according to business requirements and organizational policies.

Business rules define:

* When automation should run
* What actions should occur
* What conditions must be satisfied

Without business rules, automation may:

* Process incorrect data
* Approve invalid requests
* Trigger unnecessary actions
* Create operational problems

Example:

A scholarship approval process should only proceed if:

* Student meets academic requirements
* Required documents are submitted
* Funds are available

The automation must verify these conditions before granting approval.

Benefits:

* Accuracy
* Consistency
* Compliance
* Reduced risk

Automation should support business objectives rather than operate without control.

---

5. Why are decision nodes important in flows?

Decision nodes are one of the most important components of Salesforce Flow Builder. They allow the system to evaluate conditions and determine the appropriate path.

A decision node acts like a question.

Example:

Is attendance below 75%?

YES → Send Warning Email

NO → Continue Normal Process

Functions of Decision Nodes:

* Evaluate conditions
* Create workflow branches
* Control automation behavior
* Improve process intelligence

Real-World Example:

Scholarship Approval Flow

Decision Node:

Is GPA ≥ 8.0?

YES → Continue Review

NO → Reject Application

Without decision nodes, every process would follow the same path regardless of business requirements.

---

6. Why should enterprises restrict sensitive operations?

Sensitive operations involve actions that can significantly impact the organization.

Examples:

* Budget approvals
* Salary changes
* Student record modifications
* Financial transactions
* User access permissions

If these actions are unrestricted:

* Data may be altered incorrectly
* Fraud may occur
* Security breaches may happen
* Financial losses may result

Example:

If every employee could approve budget requests:

* Overspending could occur
* Fraudulent purchases could be approved
* Financial controls would fail

Benefits of Restrictions:

* Improved security
* Better accountability
* Reduced business risk
* Data protection

Sensitive operations should only be accessible to authorized personnel.

---

7. Why are approvals important in large organizations?

Large organizations often have:

* Thousands of employees
* Multiple departments
* Complex business processes
* Significant financial responsibilities

Approvals ensure that decisions are reviewed before implementation.

Example:

Course Creation Process

Faculty creates proposal

↓

Department Head Review

↓

Academic Committee Review

↓

Principal Approval

This process ensures:

* Quality control
* Resource planning
* Strategic alignment

Benefits:

* Better decision-making
* Reduced errors
* Increased accountability
* Improved transparency

Approvals create structured and controlled business operations.

---

8. Why should workflows be auditable?

An auditable workflow records every action performed during a business process.

Audit information includes:

* Who performed the action
* When the action occurred
* What changes were made
* Why the action was approved or rejected

Example:

Scholarship Approval Process

Audit Trail:

Student submitted request

↓

Scholarship Officer reviewed documents

↓

Finance approved funds

↓

Principal granted final approval

If a dispute occurs, the organization can review the audit history.

Benefits:

Accountability

Employees know their actions are recorded.

Compliance

Organizations can demonstrate adherence to regulations.

Transparency

Management can track decisions.

Error Investigation

Problems can be traced to their source.

Auditable workflows are essential for enterprise governance and risk management.

---

Day 14 Complete Revision Summary

After completing Day 14, you should clearly understand:

Flow Builder Logic

* Decision Elements
* Variables
* Formula Logic
* Multi-Step Flows
* Automation Design

Approval Workflows

* Multi-Level Approvals
* Controlled Business Processes
* Enterprise Authorization Systems

Branching Automation

* Decision-Based Processing
* Conditional Actions
* Dynamic Workflow Paths

Governance

* Security Controls
* Business Rules
* Compliance Requirements
* Risk Management

Enterprise Thinking

* Structured Processes
* Accountability
* Audit Trails
* Operational Control
* Scalable Business Systems

Key Takeaway:

Enterprise systems cannot rely on unrestricted actions. They require approval workflows, branching logic, governance controls, and auditable processes to ensure security, consistency, compliance, and efficient business operations.
