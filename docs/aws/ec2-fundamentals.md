# EC2 Fundamentals

## What is EC2?

Amazon Elastic Compute Cloud (EC2) is a web service that provides resizable compute capacity. It's designed to make web-scale cloud computing easier for developers.

## EC2 Instance Types

### General Purpose (t3, t3a, m5)
- Balance of compute, memory, and networking
- Web applications and small databases
- Best for: Web servers, development environments

### Compute Optimized (c5, c6i)
- High performance processors
- Batch processing, media transcoding
- Best for: HPC, batch processing

### Memory Optimized (r5, r6i, x1)
- High memory-to-CPU ratio
- In-memory databases, caches
- Best for: Large databases, in-memory caches

### Accelerated Computing (g3, p3)
- GPU instances for ML, graphics
- Machine learning, 3D rendering
- Best for: Deep learning, scientific computing

### Storage Optimized (i3, h1, d2)
- High sequential read/write to large datasets
- NoSQL databases, data warehousing
- Best for: Data warehouses, Cassandra

## Naming Convention

```
t3.medium
│ │ └─ Size (nano, micro, small, medium, large, xlarge, 2xlarge)
│ └─ Generation (Latest version)
└─ Instance Family
```

## EC2 Lifecycle

```
pending → running → stopping → stopped ↔ terminated
                      ↓
                   rebooting → running
```

## EC2 Pricing Options

| Option | Commitment | Savings | Best For |
|--------|-----------|---------|----------|
| On-Demand | Hourly | None | Variable workloads |
| Reserved | 1-3 years | Up to 72% | Stable workloads |
| Spot | Until capacity needed | Up to 90% | Fault-tolerant apps |
| Dedicated Hosts | 1-3 years | Up to 70% | Licensing requirements |

## Security: Security Groups & NACLs

### Security Groups (Allow rules)
- Stateful firewall
- Default: Deny all inbound, allow all outbound
- Associated with instances

### Network ACLs (Explicit rules)
- Stateless firewall
- Associated with subnets
- More granular control

## Elastic IP Addresses

- Static public IPv4 addresses
- Associated with AWS account
- Can be remapped to different instances
- Charged when not associated

## Storage Options

### Instance Store (Ephemeral)
- Directly attached SSD storage
- Data lost when instance stops/terminates
- Ideal for temporary data

### EBS (Persistent)
- Network-attached storage
- Survives instance stop/terminate
- Can be attached/detached
- Snapshots for backup

## Launching an EC2 Instance

!!! tip "Step-by-Step"
    1. Choose AMI (Amazon Machine Image)
    2. Select instance type
    3. Configure instance details
    4. Add storage
    5. Add tags (Name, Environment, etc.)
    6. Configure security group
    7. Review and launch
    8. Create/select key pair
    9. Launch

## Key Pairs

- Public/private key pair for SSH access
- Private key must be kept secure
- Only download once
- Can't recover lost private keys

## Monitoring EC2

```python
# Using CloudWatch metrics
- CPU Utilization
- Network In/Out
- Disk Read/Write
- Status Checks
```

## Auto Scaling

Automatically adjust the number of instances based on demand:

```
Load Balancer → Auto Scaling Group → Multiple EC2 Instances
```

## Best Practices

!!! note "EC2 Best Practices"
    - Use IAM roles instead of credentials
    - Enable detailed CloudWatch monitoring
    - Use security groups and NACLs
    - Use Elastic IPs where needed
    - Tag instances properly
    - Use VPCs for isolation
    - Enable EBS encryption
    - Create AMIs from configured instances
    - Use Systems Manager for patching
    - Implement auto-scaling

## Common Commands (AWS CLI)

```bash
# List instances
aws ec2 describe-instances

# Launch instance
aws ec2 run-instances --image-id ami-123 --instance-type t3.micro

# Stop instance
aws ec2 stop-instances --instance-ids i-123

# Terminate instance
aws ec2 terminate-instances --instance-ids i-123

# Create security group
aws ec2 create-security-group --group-name my-sg --description "My security group"

# Authorize security group
aws ec2 authorize-security-group-ingress --group-id sg-123 --protocol tcp --port 80 --cidr 0.0.0.0/0
```

## Troubleshooting Common Issues

### Can't connect to instance
- Security group doesn't allow port 22
- Key pair is incorrect
- Network ACL is blocking traffic

### High CPU utilization
- Application consuming resources
- Need to scale horizontally (more instances)
- Or scale vertically (larger instance)

### No internet connectivity
- Security group blocking traffic
- Network ACL blocking traffic
- No Internet Gateway or NAT Gateway

---

**Next**: Continue to [S3 Essentials](s3-essentials.md)
