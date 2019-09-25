module "cloudfront_s3_cdn" {
  source                   = "git::https://github.com/cloudposse/terraform-aws-cloudfront-s3-cdn.git?ref=tags/0.10.0"
  namespace                = var.namespace
  stage                    = var.environment
  name                     = var.name
  parent_zone_name         = var.parent_zone_name
  use_regional_s3_endpoint = true
  origin_force_destroy     = true
  cors_allowed_headers     = ["*"]
  cors_allowed_methods     = ["GET", "HEAD", "PUT"]
  cors_allowed_origins     = ["*.website.com"]
  cors_expose_headers      = ["ETag"]
  wait_for_deployment      = false
}

resource "aws_s3_bucket_object" "index" {
  bucket       = module.cloudfront_s3_cdn.s3_bucket
  key          = "index.html"
  source       = "${path.module}/assets/index.html"
  content_type = "text/html"
  etag         = md5(file("${path.module}/assets/index.html"))
}

resource "aws_s3_bucket_object" "image" {
  bucket       = module.cloudfront_s3_cdn.s3_bucket
  key          = "images/welcome.jpg"
  source       = "${path.module}/assets/images/welcome.jpg"
  content_type = "image/jpeg"
  etag         = filemd5("${path.module}/assets/images/welcome.jpg")
}