Doubts and Discussion Questions – Salesforce Day 03

1. Why are Master-Detail Relationships considered stronger than Lookup Relationships?

Answer:
Master-Detail Relationships create a strict dependency between parent and child records. The child record cannot exist without the parent. In contrast, Lookup Relationships provide a flexible connection where child records can remain even if the parent record is removed.

---

2. Is it possible to use related object data inside Formula Fields?

Answer:
Yes. Formula Fields can access values from related objects through relationship references. This allows Salesforce to automatically calculate values using connected object data without manual input.

---

3. What does Salesforce do when more than one Validation Rule is violated?

Answer:
When multiple validation conditions fail, Salesforce displays the corresponding error messages and blocks the record from being saved until all validation issues are corrected.

---

4. Why are object relationships important in enterprise applications?

Answer:
Relationships help businesses organize connected information efficiently. They improve reporting accuracy, reduce repeated data, support automation, and simplify large-scale data management.

---

5. What are the advantages of using Formula Fields instead of manual calculations?

Answer:
Formula Fields automatically calculate values in real time, which improves consistency and minimizes human errors. They also reduce repetitive work and ensure accurate reporting.

---

6. Why is data validation important in Salesforce systems?

Answer:
Data validation ensures that only correct and meaningful information enters the system. Maintaining high-quality data improves business decisions, reporting accuracy, and automation reliability.

---

7. Why does Salesforce use Junction Objects for Many-to-Many relationships?

Answer:
Salesforce does not directly support Many-to-Many relationships between two objects. Junction Objects act as intermediate connectors that allow multiple records from both objects to be linked efficiently.

---

8. How does Schema Builder help Salesforce Administrators and Developers?

Answer:
Schema Builder provides a visual representation of objects and relationships, making it easier to understand data structures, design applications, and manage complex systems.

---

9. What is the role of structured data in Salesforce?

Answer:
Structured data helps organizations maintain consistency, improve scalability, enable automation, and generate accurate reports. Properly organized data is essential for enterprise-level applications.

---

10. Why is Salesforce called a metadata-driven platform?

Answer:
Salesforce is called metadata-driven because most customizations are done through configuration rather than modifying the core application code. This approach makes development faster, flexible, and easier to maintain.
