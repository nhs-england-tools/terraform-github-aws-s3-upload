module "github_aws_s3_upload" {
  source = "../"
  # The project name must be 40 characters long or less
  project_name        = "gh-nhset-tf-github-aws-s3-upload-example"
  github_organisation = "nhs-england-tools"
  github_repository   = "terraform-github-aws-s3-upload"
  github_branch       = "*"
  bucket_name         = local.bucket_name
  bucket_resources = [
    "arn:aws:s3:::${local.bucket_name}/index.html",
    "arn:aws:s3:::${local.bucket_name}/assets/*.js",
    "arn:aws:s3:::${local.bucket_name}/assets/*.css",
    "arn:aws:s3:::${local.bucket_name}/assets/*.svg",
    "arn:aws:s3:::${local.bucket_name}/*.svg",
  ]
  tags = local.tags
}
