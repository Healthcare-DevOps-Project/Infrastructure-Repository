Developer
   │
   ▼
GitHub
   │
   ▼
Pull Request / Main
   │
   ▼
GitHub Webhook
   │
   ▼
Jenkins
   │
   ▼
Maven Build
   │
   ▼
Docker Build
   │
   ▼
Docker Tag
   │
   ▼
Amazon ECR


Terraform
   │
   ▼
AWS VPC
 ┌───────┴────────┐
 │                │
Public Subnet   Private Subnet
 │
 ▼
Bastion EC2
 │
 ├── Docker
 └── Jenkins


 # Create the visual diagram using draw.io/diagrams.net and export it as:
 # docs/diagrams/architecture.png


 # Project Architecture

![Project Architecture](diagrams/architecture.png)


# Add Terraform Structure

Terraform Infrastructure
│
├── Backend
│   ├── S3 Bucket
│   ├── Versioning
│   ├── Encryption
│   ├── Public Access Block
│   └── DynamoDB Locking
│
├── Network
│   ├── VPC
│   ├── Public Subnet
│   ├── Private Subnet
│   ├── Internet Gateway
│   └── Route Tables
│
├── Security
│   └── Security Groups
│
└── Compute
    ├── SSH Key Pair
    └── Bastion EC2




# repository structure:

    Infrastructure-Repository/
├── backend/
│   ├── main.tf
│   ├── outputs.tf
│   └── backend.tf
│
├── Network/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── security-groups.tf
│   └── terraform.tfvars
│
└── docs/


# Document CI Pipeline Flow:

Developer
   ↓
Feature Branch
   ↓
Pull Request
   ↓
Merge to Main
   ↓
GitHub Webhook
   ↓
Jenkins
   ↓
Checkout Code
   ↓
Maven Build
   ↓
Docker Build
   ↓
Docker Tag
   ↓
AWS ECR Login
   ↓
Docker Push
   ↓
Cleanup
   ↓
SUCCESS


