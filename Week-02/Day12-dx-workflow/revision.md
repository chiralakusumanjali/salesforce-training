Day 12 – Revision Questions (Detailed Answers)

---

1. Why do enterprise teams use version control?

Enterprise teams use version control systems such as Git and GitHub to manage source code changes efficiently.

In large projects, multiple developers work on the same codebase simultaneously. Without version control, tracking changes and coordinating development becomes extremely difficult.

Benefits of Version Control

Change Tracking

Every modification is recorded with details about:

* Who made the change
* When it was made
* What was changed

Collaboration

Multiple developers can work on different features without overwriting each other’s work.

Backup and Recovery

Repositories act as secure backups for project source code.

Rollback Capability

Teams can quickly restore previous stable versions if problems occur.

Audit Trail

Complete project history remains available for reviews and debugging.

Example

If a developer accidentally deletes important Apex logic, Git can restore the deleted code from earlier commits within minutes.

---

2. Why is deployment workflow important?

Deployment workflow is the structured process of moving software safely from development to production environments.

Without proper workflows, unstable or untested code may reach users.

Benefits of Deployment Workflow

Quality Control

Code is tested before production deployment.

Reduced Risk

Issues are identified in testing environments before affecting customers.

Consistency

The same reliable deployment process is followed every release.

Better Team Coordination

Teams understand release schedules and deployment responsibilities.

Faster Issue Resolution

Deployment stages help identify where failures occurred.

Example Workflow

```text id="g7pm2r"
Developer Org
      ↓
Sandbox Testing
      ↓
User Acceptance Testing
      ↓
Production
```

Importance

Structured deployment workflows improve software reliability and release safety.

---

3. What problems happen without collaboration tools?

Collaboration tools such as GitHub, Atlassian, Slack, and Salesforce DX help enterprise teams coordinate development activities efficiently.

Without collaboration tools:

Code Conflicts

Developers may overwrite each other’s changes.

Poor Communication

Teams may not know current project status.

Lost Changes

Important updates may disappear accidentally.

Difficult Bug Tracking

Identifying the source of bugs becomes difficult.

Delayed Releases

Lack of coordination slows deployment cycles.

Reduced Productivity

Teams spend more time resolving confusion than developing features.

Example

A large development team without version control may accidentally deploy conflicting updates that break production systems.

---

4. Why is Salesforce DX important?

Salesforce DX (Developer Experience) is a modern development framework provided by Salesforce.

It supports source-driven development and modern engineering workflows.

Benefits of Salesforce DX

Source-Driven Development

Metadata is stored as source files instead of existing only inside orgs.

Better Collaboration

Teams can manage code using Git repositories.

Scratch Orgs

Temporary development environments improve testing and experimentation.

Automation Support

Deployment and testing processes can be automated.

Faster Development

Developers spend less time on repetitive manual operations.

Improved Deployment Quality

Changes can be validated before release.

Example

Developers can create Lightning Web Components locally and deploy them using Salesforce DX instead of configuring everything manually in the browser.

---

5. Why do developers prefer CLI tools?

CLI (Command Line Interface) tools allow developers to perform operations using terminal commands.

Examples include:

* Salesforce CLI
* Git CLI
* Docker CLI

Advantages

Speed

Commands execute faster than navigating graphical interfaces.

Automation

Commands can be included in scripts and CI/CD pipelines.

Repeatability

The same command can execute consistently across environments.

Efficiency

Developers can complete tasks directly from the terminal.

Integration

CLI tools integrate easily with automation systems.

Example Command

```bash id="n4o7xy"
sf project deploy start
```

Importance

CLI workflows improve developer productivity and enterprise automation.

---

6. Why do enterprise systems require rollback capability?

Rollback means restoring a previous stable version when deployments fail.

Importance of Rollback

Quick Recovery

Teams can recover rapidly from failed deployments.

Reduced Downtime

Users experience fewer service interruptions.

Business Continuity

Critical operations continue despite deployment failures.

Risk Reduction

Teams can deploy more confidently knowing recovery is possible.

Example

If a deployment breaks user login functionality, rollback restores the previous working version immediately.

Importance

Rollback capability is critical for enterprise reliability and operational stability.

---

7. Why should teams separate development and production?

Development and production environments serve completely different purposes.

Development Environment

Used for:

* Coding
* Testing
* Experimentation

Production Environment

Used by:

* Real customers
* Business users
* Live operations

Reasons for Separation

Protect Real Data

Testing should never affect customer information.

Prevent Downtime

Incomplete features should not reach production users.

Improve Quality

Features can be validated safely before release.

Reduce Risk

Development failures remain isolated.

Example

Testing unfinished automation directly in production may corrupt live records or interrupt workflows.

Importance

Environment separation protects reliability, security, and user experience.

---

8. Why is source-driven development useful?

Source-driven development treats source code as the primary representation of the application.

All metadata is stored in files and tracked using version control systems.

Benefits

Full History Tracking

Every change is recorded permanently.

Collaboration Support

Multiple developers can work safely together.

Consistent Deployments

Code can move reliably across environments.

Better Testing

Changes can be reviewed before deployment.

Rollback Support

Previous versions remain recoverable.

Documentation

Repositories become historical records of application evolution.

Example Metadata

* Apex Classes
* Triggers
* Lightning Web Components
* Flows
* Validation Rules

Importance

Source-driven development is essential for scalable enterprise engineering workflows.

---

9. Why is collaboration difficult in large projects?

Large projects involve many developers, teams, and business requirements.

As project size increases, complexity grows significantly.

Challenges

Communication Overhead

More developers require more coordination.

Dependency Management

Features often depend on work from other teams.

Merge Conflicts

Multiple developers may modify the same files.

Different Priorities

Teams may focus on competing business goals.

Testing Complexity

Integrated features must work together correctly.

Deployment Coordination

Releases require careful planning and scheduling.

Example

A project with 100 developers working on dozens of modules requires structured workflows, code reviews, and version control systems.

Importance

Without collaboration systems, large enterprise projects become difficult to manage and maintain.

---

10. Why is engineering workflow important?

Engineering workflow is the structured process used to design, build, test, deploy, monitor, and maintain software.

It ensures enterprise software development remains reliable and scalable.

Components of Engineering Workflow

Planning

Define requirements and objectives.

Development

Build features and business logic.

Version Control

Track changes safely.

Testing

Verify functionality and quality.

Deployment

Release software to users.

Monitoring

Track performance and failures.

Maintenance

Fix bugs and improve features.

Benefits

Higher Quality

Structured processes reduce defects.

Better Reliability

Systems remain stable and predictable.

Improved Collaboration

Teams coordinate more effectively.

Faster Delivery

Automation improves productivity.

Scalability

Projects grow without becoming unmanageable.

Example

Companies like Salesforce, Google, and Microsoft use structured engineering workflows to manage software used by millions of users.

---

Conclusion

Day 12 concepts introduced the foundation of professional enterprise software development.

Key Learnings

* Importance of version control
* GitHub-based collaboration
* Salesforce DX workflows
* CLI productivity benefits
* Deployment workflows
* Rollback strategies
* Source-driven development
* Environment separation
* Large-team collaboration
* Engineering workflow design

These concepts form the foundation of modern Salesforce and enterprise software engineering practices.
