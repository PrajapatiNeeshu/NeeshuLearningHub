# Section 7: Cloud Skills and Knowledge

> **Difficulty:** Intermediate | **Prerequisite:** [Sections 1-6](06-tools-frameworks-incident-response.md)

Cloud is where much modern infrastructure runs. Secure cloud design requires understanding the platform, the provider's responsibilities, and the controls your organization must configure.

## 7.1 What Is Cloud Computing?

Cloud computing delivers computing services such as servers, storage, databases, networking, and software over a network instead of requiring an organization to own all physical hardware.

Traditional IT is like owning a car: you buy, maintain, fuel, and park it. Cloud is like using a transport service: you consume capacity when needed, pay for usage, and let the provider operate much of the underlying infrastructure.

## 7.2 Cloud Service Models

| Model | Full name | Provider manages | Customer manages | Examples |
|---|---|---|---|---|
| **IaaS** | Infrastructure as a Service | Hardware, networking, and virtualization | OS, middleware, applications, and data | AWS EC2, Azure VMs, GCP Compute Engine |
| **PaaS** | Platform as a Service | Hardware, OS, and runtime platform | Application code and data | Azure App Service, AWS Elastic Beanstalk, Heroku |
| **SaaS** | Software as a Service | Infrastructure and application platform | Data, identities, settings, and usage | Microsoft 365, Gmail, Salesforce, Dropbox |

IaaS is like renting an empty apartment, PaaS is a furnished apartment, and SaaS is a hotel. As you move from IaaS to SaaS, the provider manages more of the stack, but you still retain security responsibilities.

## 7.3 Cloud Deployment Models

| Model | Description | Example | Security consideration |
|---|---|---|---|
| Public cloud | Provider-owned infrastructure shared between customers through isolation | AWS, Azure, GCP | Provider secures the physical platform; customer secures configuration and data |
| Private cloud | Dedicated cloud environment for one organization | OpenStack or on-premises VMware | More control, but the organization owns more operations |
| Hybrid cloud | Connected public and private environments | Private database with public application compute | Flexible but requires careful identity and network design |
| Community cloud | Shared environment for organizations with similar requirements | Regulated or government-focused cloud | Shared compliance and governance requirements |

Choose based on data sensitivity, regulatory requirements, operational capability, resilience, latency, and cost rather than assuming one model is always safest.

## 7.4 Major Cloud Providers

| Provider | Common strengths |
|---|---|
| **AWS** | Broadest service ecosystem and mature global platform |
| **Azure** | Strong enterprise, Microsoft, and hybrid-cloud integration |
| **GCP** | Data, machine learning, Kubernetes, and analytics capabilities |

### Service Comparison

| Category | AWS | Azure | Google Cloud |
|---|---|---|---|
| Virtual machines | EC2 | Virtual Machines | Compute Engine |
| Serverless | Lambda | Functions | Cloud Run or Cloud Functions |
| Object storage | S3 | Blob Storage | Cloud Storage |
| Databases | RDS, DynamoDB | SQL Database, Cosmos DB | Cloud SQL, Firestore |
| Containers | ECS, EKS | AKS | GKE |
| Identity | IAM | Microsoft Entra ID and Azure RBAC | Cloud IAM |
| CDN | CloudFront | Azure Front Door/CDN | Cloud CDN |
| DNS | Route 53 | Azure DNS | Cloud DNS |

Service names differ, but the security concepts are similar: identity, network boundaries, encryption, logging, resilience, and policy.

## 7.5 Shared Responsibility Model

The provider secures the cloud; the customer secures what they put in the cloud. The exact boundary changes by service model.

### Provider Responsibilities

- Physical data-center security
- Hardware maintenance and disposal
- Core network infrastructure
- Hypervisor and virtualization layer
- Regions, availability zones, and foundational platform services

### Customer Responsibilities

- Data classification and encryption choices
- Identity and access management
- Application security and secure configuration
- OS patching for IaaS workloads
- Network settings, security groups, and firewall rules
- Secrets, keys, backups, and logging configuration

### Cloud and On-Premises

| Aspect | On-premises | Cloud |
|---|---|---|
| Cost | Higher upfront capital cost | Usage-based operational cost |
| Scalability | Limited by owned capacity | Rapidly adjustable capacity |
| Control | Organization controls the full stack | Control is shared with the provider |
| Maintenance | Organization maintains infrastructure | Provider maintains much of the platform |
| Deployment | Often weeks or months | Often minutes or hours |
| Physical security | Organization's responsibility | Provider's responsibility, subject to assurance |
| Compliance | Direct control of the environment | Requires understanding provider and customer controls |

## 7.6 Cloud Identity and Network Security

Identity is the primary security boundary in cloud environments.

- Use federated identity and MFA for people.
- Grant least privilege with roles and short-lived credentials.
- Separate production, test, and development accounts or subscriptions.
- Avoid long-lived access keys and remove unused identities.
- Restrict network paths with private endpoints, security groups, firewalls, and segmentation.
- Deny public access by default and allow only required sources and destinations.
- Monitor privilege changes, authentication, API calls, and unusual locations.

## 7.7 Infrastructure as Code

Infrastructure as Code (IaC) manages infrastructure through version-controlled configuration instead of manual console changes.

Benefits include repeatability, reviewable changes, automation, auditability, drift detection, and easier recovery.

| Tool | Common use |
|---|---|
| Terraform | Multi-cloud infrastructure provisioning |
| AWS CloudFormation | AWS-native infrastructure management |
| Ansible | Configuration management and automation |
| Pulumi | IaC using general-purpose programming languages |

```hcl
resource "aws_instance" "web" {
  ami           = "ami-example"
  instance_type = "t3.micro"
}
```

Secure IaC practices include scanning before deployment, keeping state protected, avoiding secrets in source, using approved modules, reviewing plans, applying policy-as-code, and detecting configuration drift.

## 7.8 Serverless Computing

Serverless lets teams run functions or managed application services without operating the underlying servers. The provider handles much of the capacity, patching, and scaling.

Examples include AWS Lambda, Azure Functions, Google Cloud Functions, and Cloud Run.

Security considerations:

- Assign each function only the permissions it needs.
- Validate input and protect dependencies.
- Secure event sources and function-to-function calls.
- Store secrets in a managed secret service.
- Log invocations and monitor unusual execution or cost.
- Account for cold starts, timeouts, concurrency, and data exposure.

Serverless reduces OS administration but does not remove application, identity, data, dependency, or configuration security responsibilities.

## 7.9 Cloud Storage

| Service | Provider | Type |
|---|---|---|
| S3 | AWS | Object storage |
| OneDrive | Microsoft | Personal and business file synchronization |
| Google Drive | Google | Personal and business file synchronization |
| Dropbox | Dropbox | File synchronization and sharing |
| Box | Box | Enterprise content management |
| iCloud | Apple | Apple ecosystem file synchronization |

### Object Storage Security

Public object storage is a common cloud misconfiguration. A bucket or container should be private unless a documented business requirement and compensating controls require public access.

```text
Unsafe:  storage -> public access -> anyone can read sensitive data
Safer:   storage -> public access blocked -> approved roles only
```

Storage checklist:

- [ ] Block public access unless explicitly approved.
- [ ] Enable server-side encryption with a managed key where appropriate.
- [ ] Restrict policies to specific roles, resources, and actions.
- [ ] Enable access logging and monitor unusual downloads.
- [ ] Enable versioning and retention controls for recovery.
- [ ] Classify data and apply lifecycle and deletion policies.
- [ ] Prevent credentials or personal data from being stored unnecessarily.

## 7.10 Cloud Monitoring and Resilience

Enable centralized audit logs for control-plane actions, identity events, network flows, storage access, and workload activity. Send logs to a protected account with appropriate retention and alerting.

Design for failure with multiple availability zones where appropriate, tested backups, recovery objectives, health checks, autoscaling limits, and documented incident procedures. Resilience must include cost controls so unexpected scaling does not become an availability or financial incident.

## 7.11 Cloud Security Checklist

- [ ] Define account, subscription, and project ownership.
- [ ] Require MFA and least-privilege roles.
- [ ] Remove unused keys, users, groups, and public endpoints.
- [ ] Separate production from non-production environments.
- [ ] Encrypt data at rest and in transit.
- [ ] Store secrets in a managed secret service.
- [ ] Block public storage access by default.
- [ ] Apply secure network segmentation and egress controls.
- [ ] Scan IaC, containers, dependencies, and images before deployment.
- [ ] Centralize audit logs and configure security alerts.
- [ ] Test backup restoration and disaster recovery.
- [ ] Review provider, service, and regulatory requirements.
- [ ] Monitor cost, capacity, and unusual usage.

## 7.12 Key Takeaways

- IaaS means managing more of the stack; SaaS means managing less, not nothing.
- Public, private, hybrid, and community models have different tradeoffs.
- The provider secures the cloud; the customer secures data, identities, code, and configuration.
- IAM, MFA, segmentation, encryption, logging, and backups are core cloud controls.
- IaC makes infrastructure repeatable and reviewable, but state and secrets require protection.
- Serverless removes server administration, not application or identity security.
- Public storage exposure is preventable with default-deny access and continuous monitoring.
- Cloud security is a continuous operating practice, not a one-time deployment task.

**Next:** Continue to [Security Roadmap](security-roadmap.md), then study programming, certifications, and CTFs.