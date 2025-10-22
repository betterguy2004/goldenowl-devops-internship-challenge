# GitHub Actions Workflows

## 📋 Tổng quan

Project có 2 workflows chính:
- **CI**: Chạy tests tự động khi push code lên feature branch
- **CD**: Deploy ứng dụng lên AWS khi merge vào master

## 🔄 CI Workflow

**Trigger:** 
- Push lên branch `feature/**` hoặc `develop`
- Pull request vào branch `master`

**Steps:**
1. Checkout code
2. Setup Node.js 18
3. Install dependencies
4. Run tests (`npm test`)
5. Lint check (`npm run lint:check`)

## 🚀 CD Workflow

**Trigger:**
- Push vào branch `master`

**Steps:**
1. Build Docker image
2. Push image lên Docker Hub (asdads6495/golden-owl-app)
3. Update Launch Template với image mới
4. Trigger Auto Scaling Group instance refresh

## ⚙️ Setup Requirements

### 1. Configure GitHub Secrets

Vào Settings → Secrets and variables → Actions, thêm:

- `DOCKER_USERNAME`: Docker Hub username (asdads6495)
- `DOCKER_PASSWORD`: Docker Hub password hoặc access token
- `AWS_ACCESS_KEY_ID`: AWS access key
- `AWS_SECRET_ACCESS_KEY`: AWS secret key

### 2. Update Environment Variables

Trong file `cd.yml`, cập nhật các biến nếu cần:
- `AWS_REGION`: Region của bạn (mặc định: us-east-1)
- `DOCKER_IMAGE`: Docker Hub image (mặc định: asdads6495/golden-owl-app)
- `ASG_NAME`: Tên Auto Scaling Group (mặc định: golden-owl-asg)

## 📝 Cách sử dụng

### Development Flow:
```bash
# 1. Tạo feature branch
git checkout -b feature/new-feature

# 2. Commit changes
git add .
git commit -m "Add new feature"

# 3. Push lên GitHub (CI sẽ tự động chạy)
git push origin feature/new-feature

# 4. Tạo Pull Request vào master
# 5. Sau khi merge, CD sẽ tự động deploy
```

### Instance Refresh Strategy:
- Rolling update với minimum 50% healthy instances
- Zero-downtime deployment
- Automatic rollback nếu health check fail

## 🔍 Monitoring

Xem logs của workflows tại:
- GitHub → Actions tab
- Chọn workflow run để xem chi tiết

Check deployment status:
```bash
aws autoscaling describe-instance-refreshes \
  --auto-scaling-group-name golden-owl-asg
```
