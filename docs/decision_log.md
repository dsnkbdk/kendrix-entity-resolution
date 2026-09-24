# Decision Log

## D001 — Repository strategy

### Decision
Use a single repository for AWS, Snowflake, application code,
tests, documentation and GitHub Actions.

### Reason
The Datathon is short and the project components are tightly coupled.

---

## D002 — Branch strategy

### Decision
Use `main` plus short-lived feature branches.

### Reason
A separate `develop` branch adds unnecessary coordination overhead
for a two-day Datathon.

---

## D003 — Infrastructure as Code

### Decision
Use Terraform for repeatable AWS and basic Snowflake infrastructure.

### Reason
Infrastructure changes should be reproducible and auditable.