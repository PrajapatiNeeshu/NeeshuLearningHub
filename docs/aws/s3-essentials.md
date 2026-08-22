# S3 Essentials

## What is Amazon S3?

Simple Storage Service (S3) is an object storage service that offers industry-leading scalability, availability, performance, security, and cost-effectiveness.

## Key Concepts

### Buckets
- Container for objects
- Unique name globally across all AWS accounts
- Region-specific (though name is global)
- Can store unlimited objects

### Objects
- Files stored in S3
- Combination of key (path) and value (data)
- Can be up to 5TB in size
- Immutable (can't modify, must replace)

### Keys (Paths)
- Unique identifier within bucket
- Example: `documents/resume.pdf`
- Can use "/" to organize hierarchically (not true directories)

## Bucket Naming Rules

```
✅ Allowed:
- Must be 3-63 characters
- Can contain lowercase letters, numbers, hyphens
- Must start with letter or number
- No uppercase letters
- No underscores

❌ Examples:
- my-bucket-123 ✅
- MyBucket ❌ (uppercase)
- my_bucket ❌ (underscore)
- mb ❌ (too short)
```

## Storage Classes

```
┌─────────────────────────────────────────┐
│         S3 Storage Classes              │
├─────────────────────────────────────────┤
│ S3 Standard         → Frequent access   │
│ S3 Intelligent      → Variable access   │
│ S3 Standard-IA      → Infrequent access │
│ S3 One Zone-IA      → Infrequent access │
│ S3 Glacier Instant  → Archive, days     │
│ S3 Glacier Flexible → Archive, hours    │
│ S3 Deep Archive     → Long-term backup  │
└─────────────────────────────────────────┘
```

### Cost Trade-off
```
Cost per GB ↑
Storage:   High ← → Low
Retrieval: Low  ← → High
```

## Access Control

### Public Access
```yaml
Block Public Access: OFF
Bucket Policy: Allow GetObject
Provides: HTTP access to anyone
```

### Private Access
```yaml
Block Public Access: ON (recommended)
Access via: AWS credentials or presigned URLs
```

### Presigned URLs
- Temporary access to private objects
- Expires after specified time
- Useful for sharing files securely

## Versioning

```
Version 1 → Version 2 → Version 3
   ↓          ↓           ↓
  v1          v2          v3
```

Benefits:
- Recover deleted objects
- Revert to previous versions
- Audit trail

## Lifecycle Policies

```
Day 0: S3 Standard
    ↓ (30 days)
Day 30: S3 Standard-IA
    ↓ (60 days)
Day 90: S3 Glacier
    ↓ (180 days)
Day 270: S3 Deep Archive
```

## Server-Side Encryption

### SSE-S3
- AWS manages encryption keys
- Automatic
- No additional cost

### SSE-KMS
- Use AWS Key Management Service
- More control over keys
- Additional cost

### SSE-C
- Customer manages encryption keys
- Must provide keys with each request

## AWS CLI Commands

```bash
# Create bucket
aws s3 mb s3://my-bucket-name

# List buckets
aws s3 ls

# List objects in bucket
aws s3 ls s3://my-bucket-name

# Upload file
aws s3 cp myfile.txt s3://my-bucket-name/

# Download file
aws s3 cp s3://my-bucket-name/myfile.txt ./

# Sync directory
aws s3 sync ./local-folder s3://my-bucket-name/

# Delete object
aws s3 rm s3://my-bucket-name/myfile.txt

# Delete bucket (must be empty)
aws s3 rb s3://my-bucket-name
```

## Best Practices

!!! note "S3 Best Practices"
    - Enable versioning for critical data
    - Use lifecycle policies to optimize costs
    - Enable MFA Delete for protection
    - Block Public Access by default
    - Use IAM roles for access
    - Enable encryption by default
    - Monitor with CloudTrail
    - Use CloudFront for distribution
    - Implement bucket policies
    - Use tags for organization

## Common Use Cases

1. **Static Website Hosting** - Host HTML/CSS/JS files
2. **Data Backup** - Durable backup storage
3. **Archive** - Long-term storage with Glacier
4. **Data Lake** - Central repository for analytics
5. **Application Assets** - Store images, media, files
6. **Log Storage** - Application and AWS logs

## S3 Pricing

```
Storage Cost:    $0.023 per GB (Standard)
Transfer Cost:   Data out costs money, in is free
Request Cost:    Per 1,000 requests ($0.0004)
Retrieval Cost:  Depends on storage class
```

---

**Next**: Back to [AWS Basics](aws-basics.md)
