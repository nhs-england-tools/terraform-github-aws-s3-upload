module "github_action_s3_upload" {
  source            = "github.com/nhs-england-tools/terraform-github-action-s3-upload?ref=v0.0.1-dev"
  project_name      = "react-app-s3-upload"
  s3_bucket_name    = "react-app-frontend"
  s3_bucket_actions = ["s3:PutObject"]
  s3_bucket_resources = ["arn:aws:s3:::react-app-frontend/index.html",
    "arn:aws:s3:::react-app-frontend/assets/*.js",
  "arn:aws:s3:::react-app-frontend/*.css"]
  github_organisation = "NHS-Organisation"
  github_repo         = "react-app-frontend"
}
