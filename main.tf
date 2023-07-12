data "aws_caller_identity" "current" {}

resource "aws_iam_role" "github_aws_s3_upload_role" {
  name = "${var.project_name}-gh-s3-upload-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Federated = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:oidc-provider/token.actions.githubusercontent.com"
        }
        Action = "sts:AssumeRoleWithWebIdentity"
        Condition = {
          StringLike = {
            "token.actions.githubusercontent.com:aud" = "sts.amazonaws.com"
            "token.actions.githubusercontent.com:sub" = "repo:${var.github_organisation}/${var.github_repository}:ref:refs/heads/${var.github_branch}"
          }
        }
      }
    ]
  })
  tags = var.tags
}

resource "aws_iam_policy" "github_aws_s3_upload_policy" {
  name = "${var.project_name}-gh-s3-upload-policy"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = ["s3:PutObject"]
        Resource = var.bucket_resources
      }
    ]
  })
  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "github_aws_s3_upload_role_policy_attachment" {
  policy_arn = aws_iam_policy.github_aws_s3_upload_policy.arn
  role       = aws_iam_role.github_aws_s3_upload_role.name
}
