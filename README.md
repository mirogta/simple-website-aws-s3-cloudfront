# simple-website-aws-s3-cloudfront

## What

This is a simple code which deploys a sample infrastructure and a website to AWS.

The website is just one page with a text and an image.

## Why

It is a demonstration of using terraform and AWS to deploy and host a website.

## Pre-Requisites

* Basic knowledge of AWS and Terraform
* Existing AWS Account
* Existing AWS Access Key ID and Access Secret Key
* Terraform version 0.12 or greater installed
* Latest AWS CLI installed
* Access to internet to pull down terraform, AWS CLI and [terraform-aws-cloudfront-s3-cdn](https://github.com/cloudposse/terraform-aws-cloudfront-s3-cdn) terraform module

## Development and Deployment

See [docs/development](docs/development.md)

## Requirements

See [docs/requirements](docs/requirements.md)

## Reasoning about the chosen technology

See [docs/reasoning](docs/reasoning.md)

## Testing

See [docs/testing](docs/testing.md)

## AWS Resources Used

* [S3 - Free Tier](https://aws.amazon.com/s3/pricing/)
* [CloudFront - Free Tier](https://aws.amazon.com/cloudfront/pricing/)

## Useful Links

* <https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/Introduction.html>
* <https://aws.amazon.com/getting-started/tutorials/deliver-content-faster/>
* <https://aws.amazon.com/blogs/networking-and-content-delivery/amazon-s3-amazon-cloudfront-a-match-made-in-the-cloud/>
* <https://aws.amazon.com/premiumsupport/knowledge-center/cloudfront-serving-outdated-content-s3/>
* <https://aws.amazon.com/blogs/startups/what-startups-should-know-before-choosing-a-cdn/>
* <https://aws.amazon.com/blogs/security/how-to-use-bucket-policies-and-apply-defense-in-depth-to-help-secure-your-amazon-s3-data/>

## Next Steps

Where to go from here:

* Assuming the website and infrastructure code would get updated, it would also need to be versioned. This would be a task for CI/CD pipeline which isn't included here for simplicity so I haven't also included any versioning of this code.
* Tag all resources according to your company's tagging policy.
* Configure S3 versions or CouldFront Distribution - Invalidations, so that content gets updated in CDN accordingly after it's updated in S3.
* Use AWS Lambda to provide dynamic content for the SPA.
* Use OAuth for authenticating to secure services.
* Could use AWS CodeBuild and CodePipeline to configure GitHub webhook to publish a website from GitHub to S3 (paid). See [link](https://aws.amazon.com/about-aws/whats-new/2017/09/connect-your-git-repository-to-amazon-s3-and-aws-services-using-webhooks-and-new-quick-start/)

More details explained in the [docs/reasoning](docs/reasoning.md).

## Technology Used

For the infrastructure:

* S3
* AWS
* CDN
* AWS CLI
* Markdown
* Terraform
* CloudFront

And for the website:

* CSS
* JPG
* HTML
