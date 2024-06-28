# AWS ECR Action

This Action allows you to Pull Docker images and push into a ECR repository.

## Action Secrets
| Secret | Type | Default | Description |
|-----------|------|---------|-------------|
| `AWS_ACCESS_KEY_ID` | `string` | | Your AWS access key id |
| `AWS_SECRET_ACCESS_KEY` | `string` | | Your AWS secret access key |
| `AWS_ACCOUNT` | `string` | | Your AWS Account ID |
| `AWS_REGION` | `string` | | Your AWS region, Default "cn-northwest-1" |
| `AWS_HOST` | `string` | | Your AWS Host, Default "amazonaws.com.cn" |

## Action Permissions
![image](https://github.com/reimuLy/aws-proxy-ecr-action/blob/main/doc/action-permissions.png)

## Usage
Choose one of two methods  
  
1、Edit required-images.txt, clean up the existing images, add the images that need to be pulled to ECR, and save.  
2、Add a new issue, the content is the same as required-images.txt format, The issue will be closed after success. 
## Thanks
https://github.com/kciter/aws-ecr-action  
https://github.com/nwcdlabs/container-mirror

