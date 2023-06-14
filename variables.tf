variable "project_name" {
  description = "A name for the project."
  type        = string
}

variable "s3_bucket_name" {
  description = "The name of the S3 bucket that the GitHub Action will upload to."
  type        = string
}

variable "s3_bucket_actions" {
  description = "The actions that the Github Action will have access to. This will default to none."
  type        = list(string)
  default     = []
}

variable "s3_bucket_resources" {
  description = "The resources that the GitHub Action will have access to. This will default to none."
  default     = []
}

variable "github_organisation" {
  description = "The GitHub organisation that the GitHub Action resides in."
  type        = string
}

variable "github_repo" {
  description = "The GitHub repo that the GitHub Action resides in."
  type        = string
}

variable "github_branch" {
  description = "The GitHub branch that will be allowed to upload the files to S3. This will default to 'main'."
  type        = string
  default     = "main"
}
