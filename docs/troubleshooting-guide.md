# Document problems you actually encountered:

| Issue                      | Check / Fix                                         |
| -------------------------- | --------------------------------------------------- |
| SSH timeout                | Check port 22, Security Group and current public IP |
| Docker permission denied   | Add user to Docker group                            |
| Jenkins not opening        | Check container and port 8080                       |
| Jenkins container stopped  | `docker ps -a` and `docker logs jenkins`            |
| Disk full                  | `df -h` and `docker system df`                      |
| GitHub 403                 | Check PAT and repository permissions                |
| AWS credentials fail       | `aws sts get-caller-identity`                       |
| Terraform provider timeout | Re-run `terraform init` and verify provider         |
| Maven build fails          | Check Jenkins console output                        |
| Docker build fails         | Verify Dockerfile and JAR                           |
| ECR push fails             | Check AWS/ECR permissions and image tag             |
| Webhook not triggering     | Check GitHub delivery and Jenkins webhook trigger   |

