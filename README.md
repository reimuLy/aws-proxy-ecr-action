# AWS ECR Action

This Action allows you to Pull Docker images and push into a ECR repository.

## Secrets
| Secret | Type | Default | Description |
|-----------|------|---------|-------------|
| `AWS_ACCESS_KEY_ID` | `string` | | Your AWS access key id |
| `AWS_SECRET_ACCESS_KEY` | `string` | | Your AWS secret access key |
| `AWS_ACCOUNT` | `string` | | Your AWS Account ID |
| `AWS_REGION` | `string` | | Your AWS region |
| `AWS_HOST` | `string` | | Your AWS Host, Default amazonaws.com.cn|

## Usage
Choose one of two methods  
  
1、Edit required-images.txt, clean up the existing images, add the images that need to be pulled to ECR, and save.  
2、Add a new issue, the content is the same as required-images.txt format, The issue will be closed after success.  
## License
The MIT License (MIT)
