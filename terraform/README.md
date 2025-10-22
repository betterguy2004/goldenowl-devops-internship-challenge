# Terraform Configuration for Golden Owl App

## Cấu trúc

- **VPC** với 2 public subnets trong 2 AZ khác nhau
- **Application Load Balancer (ALB)** để phân phối traffic
- **Auto Scaling Group** với 1-3 instances
- **EC2 instances** chạy Docker container

## Cách sử dụng

### 1. Cài đặt Terraform
```bash
# Download từ https://www.terraform.io/downloads
```

### 2. Cấu hình AWS credentials
```bash
aws configure
```

### 3. Cập nhật biến
Sửa file `variables.tf`:
- `aws_region`: Region muốn deploy
- `docker_image`: Docker image của bạn trên DockerHub

### 4. Deploy

```bash
# Khởi tạo Terraform
terraform init

# Xem plan
terraform plan

# Apply (tạo resources)
terraform apply

# Lấy URL của ứng dụng
terraform output alb_url
```

### 5. Test
```bash
curl <ALB_URL>
```

### 6. Xóa resources
```bash
terraform destroy
```

## Resources được tạo

- 1 VPC
- 2 Public Subnets
- 1 Internet Gateway
- 2 Security Groups (ALB và EC2)
- 1 Application Load Balancer
- 1 Target Group
- 1 Launch Template
- 1 Auto Scaling Group
- 2 Auto Scaling Policies

## Lưu ý

- Đảm bảo Docker image đã được push lên DockerHub
- AMI mặc định là Amazon Linux 2023
- Instance type mặc định là t2.micro (free tier)
- Auto Scaling: min=1, desired=2, max=3
