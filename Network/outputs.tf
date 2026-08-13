output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.main.id
}

output "public_subnet_id" {
  description = "Public Subnet ID"
  value       = aws_subnet.public.id
}

output "private_subnet_id" {
  description = "Private Subnet ID"
  value       = aws_subnet.private.id
}

output "internet_gateway_id" {
  description = "Internet Gateway ID"
  value       = aws_internet_gateway.igw.id
}

output "public_route_table_id" {
  description = "Public Route Table ID"
  value       = aws_route_table.public.id
}

output "private_route_table_id" {
  description = "Private Route Table ID"
  value       = aws_route_table.private.id
}

output "bastion_instance_id" {
  description = "Bastion EC2 Instance ID"
  value       = aws_instance.bastion.id
}

output "bastion_public_ip" {
  description = "Bastion Public IP"
  value       = aws_instance.bastion.public_ip
}

output "bastion_private_ip" {
  description = "Bastion Private IP"
  value       = aws_instance.bastion.private_ip
}

output "ssh_command" {
  description = "Command to SSH into Bastion"
  value       = "ssh -i ~/.ssh/aws-bastion ec2-user@${aws_instance.bastion.public_ip}"
}