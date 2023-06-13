module "github_action_s3_upload" {
  source            = "github.com/nhs-england-tools/terraform-github-action-s3-upload?ref=v0.0.6-dev"
  project_name      = "terraform-github-action-s3-upload"
  s3_bucket_name    = local.s3_bucket_name
  s3_bucket_actions = ["s3:PutObject"]
  s3_bucket_resources = ["arn:aws:s3:::${local.s3_bucket_name}/index.html",
    "arn:aws:s3:::${local.s3_bucket_name}/assets/*.js",
    "arn:aws:s3:::${local.s3_bucket_name}/assets/*.css",
    "arn:aws:s3:::${local.s3_bucket_name}/assets/*.svg",
    "arn:aws:s3:::${local.s3_bucket_name}/*.svg",
  ]
  github_organisation = "nhs-england-tools"
  github_repo         = "terraform-github-action-s3-upload"
  github_branch = "ENG-XXX-create_github_action_module"
}
