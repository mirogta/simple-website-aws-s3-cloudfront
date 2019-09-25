# Development

## Setting up your environment

* Install AWS CLI

See [how to install AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html). On Windows, I'd recommend to [use Chocolatey](https://chocolatey.org/packages/awscli).

After the installation, you can run `aws configure` using AWS CLI to configure local shared credentials for the development and local testing.

Use secure AWS credentials for terraform in your CI/CD builds.

See [AWS Terraform Provider](https://www.terraform.io/docs/providers/aws/index.html).

* Install terraform

See [how to install terraform](https://learn.hashicorp.com/terraform/getting-started/install.html). On Windows, I'd recommend to [use Chocolatey](https://chocolatey.org/packages/terraform).

## Update your website

In this example, the website content is under the [assets](assets) directory and contains one HTML file and one image.

## Configure your deployment

* Copy `template.auto.tfvars-template` file to a new file, e.g. `test.auto.tfvars` and set the parameters in the new file accordingly.
* `*.auto.tfvars` file will be automatically used to set the terraform variables.

## Verify your infrastructure deployment

Run `terraform init` to initialise terraform configuration. This is only a once-off task on your dev environment.

Then you can run `terraform plan` to see what infrastructure will be built. You should see 6 resources to be deployed.

## Deploy your infrastructure and website

Run `terraform apply --auto-approve` to deploy the infrastructure to AWS along with the website. The website is deployed to a private AWS S3 bucket and public access is provided via AWS CloudFront.

... wait ~5min for the S3 bucket to be initialised and populated and the CloudFront Distribution to be kicked off.

NOTE: There is a `wait_for_deployment = false` flag set in the `cloudfront_s3.tf` which means that the terraform deployment will finish
as soon as the CloudFront Distribution has been initiated and is in progress. You can load the URL from the terraform output (`cf_domain_name`) in your web browser and should already see the live website. The CDN won't be fully populated however until the CloudFront Distribution has been completed. If you wish to modify this behaviour and see when everything has finished, change the property to `wait_for_deployment = true`.

... wait another ~30min for the CloudFront Distribution to complete.

## Terraform Outputs

| Name | Description | Example |
| cf_arn | CloudFront ARN | arn:aws:cloudfront::243766691407:distribution/E1SI4AS10B851E |
| cf_domain_name | CloudFront public hostname | <random_hostname>.cloudfront.net |
| cf_etag | CloudFront ETag | E25BUFTZ15L73B |
| cf_hosted_zone_id | CloudFront Hosted Zone ID | Z2FDTNDATAQYW2 |
| cf_id | CloudFront ID | E1SI4AS10B851E |
| cf_status | CloudFront Distribution Status | Deployed |
| s3_bucket | S3 Bucket Name | <namespace>-<environment>-<name>-origin |
| s3_bucket_domain_name | S3 Bucket Hostname | <namespace>-<environment>-<name>-origin.s3-<region>.amazonaws.com |

## Teardown

Run `terraform destroy`
