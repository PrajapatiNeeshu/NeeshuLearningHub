# AWS Basics

## What is AWS?

Amazon Web Services (AWS) is a comprehensive cloud computing platform that offers a wide range of services to help businesses, organizations, and individuals build, deploy, and manage applications and infrastructure on the internet.

## Why Cloud Computing?

- **Cost Efficiency**: Pay only for what you use
- **Scalability**: Scale up or down as needed
- **Reliability**: Multiple redundancy and backup options
- **Security**: Industry-leading security features
- **Performance**: Global infrastructure for low latency

## AWS Global Infrastructure

```
┌─────────────────────────────────────┐
│      AWS Global Infrastructure      │
├─────────────────────────────────────┤
│  Regions (Geographic Locations)     │
│    └─ Availability Zones (AZs)     │
│        └─ Data Centers             │
│            └─ Edge Locations       │
└─────────────────────────────────────┘
```

### Regions
- Geographic areas with multiple Availability Zones
- Isolated from other regions
- Compliance and data sovereignty benefits

### Availability Zones (AZs)
- Physically separate data centers within a region
- Connected by high-speed, low-latency networking
- Enable high availability and disaster recovery

## Core AWS Services

### Compute
- **EC2** (Elastic Compute Cloud): Virtual machines
- **Lambda**: Serverless computing
- **ECS**: Container orchestration
- **Elastic Beanstalk**: Platform as a Service

### Storage
- **S3** (Simple Storage Service): Object storage
- **EBS** (Elastic Block Store): Block storage for EC2
- **EFS** (Elastic File System): Managed NFS
- **Glacier**: Long-term archive storage

### Database
- **RDS** (Relational Database Service): Managed relational databases
- **DynamoDB**: NoSQL database
- **Elasticache**: In-memory caching
- **Redshift**: Data warehouse

### Networking
- **VPC** (Virtual Private Cloud): Isolated network
- **Route 53**: DNS service
- **CloudFront**: CDN service
- **ELB** (Elastic Load Balancer): Load balancing

### Management & Monitoring
- **CloudWatch**: Monitoring and logging
- **CloudTrail**: API audit logging
- **CloudFormation**: Infrastructure as Code
- **Systems Manager**: Resource management

## AWS Pricing Model

```
Total Cost = Compute + Storage + Data Transfer + Additional Services
```

### Key Principles

- **On-Demand**: Pay-as-you-go pricing
- **Reserved Instances**: Commit for 1-3 years, get discounts
- **Spot Instances**: Bid on unused capacity, up to 90% discount
- **Savings Plans**: Flexible pricing for compute usage

## Getting Started with AWS

1. **Create AWS Account**: Go to [aws.amazon.com](https://aws.amazon.com)
2. **Set up IAM Users**: Don't use root account for daily tasks
3. **Enable MFA**: Multi-Factor Authentication for security
4. **Create VPC**: Isolate your resources
5. **Launch First Instance**: Start with EC2

## Best Practices

!!! note "AWS Best Practices"
    - Use IAM roles instead of access keys
    - Enable CloudTrail for audit logging
    - Use VPCs for network isolation
    - Apply security groups and NACLs
    - Enable versioning on S3 buckets
    - Use CloudWatch for monitoring
    - Implement auto-scaling
    - Use CloudFormation for IaC

## Learning Path

1. **Foundations**: Regions, AZs, VPC, Security Groups
2. **Compute**: EC2, Lambda, Task definitions
3. **Storage**: S3, EBS, Data lifecycle policies
4. **Database**: RDS, DynamoDB, backup strategies
5. **Networking**: Route 53, CloudFront, VPC Peering
6. **Advanced**: Multi-region setup, disaster recovery

## Resources

- [AWS Documentation](https://docs.aws.amazon.com/)
- [AWS Training](https://aws.amazon.com/training/)
- [AWS Whitepapers](https://aws.amazon.com/whitepapers/)
- [AWS Well-Architected Framework](https://aws.amazon.com/architecture/well-architected/)

---

**Next**: Continue to [EC2 Fundamentals](ec2-fundamentals.md)
