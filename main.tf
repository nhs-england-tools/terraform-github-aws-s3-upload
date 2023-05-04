data "aws_caller_identity" "current" {}

resource "aws_iam_policy" "github_s3_deploy_policy" {
  name = "${var.project_name}_github_s3_deploy_policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = var.s3_bucket_actions
        Resource = var.s3_bucket_resources
      }
    ]
  })
}

resource "aws_iam_policy" "github_s3_list_bucket_policy" {
  name = "${var.project_name}_github_s3_list_bucket_policy"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = ["s3:ListBucket"]
        Resource = ["arn:aws:s3::${data.aws_caller_identity.current}:${var.s3_bucket_name}"]
      }
    ]
  })

}

resource "aws_iam_role" "github_s3_deploy_role" {
  name = "${var.project_name}_github_s3_deploy_role"

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
            "token.actions.githubusercontent.com:sub" = "repo:${var.github_organisation}/${var.github_repo}:ref:refs/heads/${var.github_branch}"
          }
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "github_s3_deploy_policy_attachment" {
  policy_arn = aws_iam_policy.github_s3_deploy_policy.arn
  role       = aws_iam_role.github_s3_deploy_role.name
}

resource "aws_iam_role_policy_attachment" "github_s3_list_bucket_policy_attachment" {
  policy_arn = aws_iam_policy.github_s3_list_bucket_policy.arn
  role       = aws_iam_role.github_s3_deploy_role.name
}
