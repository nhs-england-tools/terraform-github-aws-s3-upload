variable "project_name" {
  description = "A name for the project."
  type        = string
}

variable "github_organisation" {
  description = "The GitHub organisation that the GitHub Action resides in."
  type        = string
}

variable "github_repository" {
  description = "The GitHub repository that the GitHub Action resides in."
  type        = string
}

variable "github_branch" {
  description = "The GitHub branch that will be allowed to upload the files to S3 bucket. This will default to 'main'."
  type        = string
  default     = "main"
}

variable "bucket_name" {
  description = "The name of the S3 bucket that the GitHub Action will upload to."
  type        = string
}

variable "bucket_resources" {
  description = "The list of resources that the GitHub Action will have access to. This will default to none."
  default     = []
}

variable "tags" {
  description = "Tags to apply to the resources created by Terraform."
  type        = map(string)
  default     = {}
}
