# Document the deployment sequence:

1. Configure AWS credentials
2. Deploy Terraform backend
3. Run terraform init
4. Deploy AWS networking
5. Deploy Security Groups
6. Provision Bastion EC2
7. Validate SSH
8. Install Docker
9. Deploy Jenkins
10. Configure Jenkins credentials
11. Create ECR repository
12. Configure Jenkins pipeline
13. Configure GitHub webhook
14. Trigger pipeline
15. Validate image in ECR

# Include important commands:

terraform init
terraform validate
terraform plan
terraform apply

# SSH:
ssh -i "$HOME/.ssh/aws-bastion" ec2-user@<PUBLIC-IP>
# Docker 
docker --version
docker ps
# Jenkins
http://<BASTION-PUBLIC-IP>:8080


