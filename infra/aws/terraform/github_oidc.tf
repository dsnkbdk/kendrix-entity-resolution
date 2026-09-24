resource "aws_iam_openid_connect_provider" "github" {
  url = "https://token.actions.githubusercontent.com"

  client_id_list = [
    "sts.amazonaws.com"
  ]
}

data "aws_iam_policy_document" "github_assume_role" {
  statement {
    effect = "Allow"

    actions = [
      "sts:AssumeRoleWithWebIdentity"
    ]

    principals {
      type = "Federated"

      identifiers = [
        aws_iam_openid_connect_provider.github.arn
      ]
    }

    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:aud"

      values = [
        "sts.amazonaws.com"
      ]
    }

    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:sub"

      values = [
        var.github_oidc_subject
      ]
    }
  }
}

resource "aws_iam_role" "github_actions" {
  name = "kendrix-er-github-actions"

  assume_role_policy = data.aws_iam_policy_document.github_assume_role.json
}

data "aws_iam_policy_document" "github_actions_permissions" {
  statement {
    sid = "TerraformStateBucket"

    actions = [
      "s3:GetBucketLocation",
      "s3:ListBucket"
    ]

    resources = [
      var.terraform_state_bucket_arn
    ]
  }

  statement {
    sid = "TerraformStateObjects"

    actions = [
      "s3:GetObject",
      "s3:PutObject",
      "s3:DeleteObject"
    ]

    resources = [
      "${var.terraform_state_bucket_arn}/*"
    ]
  }

  statement {
    sid = "KendrixDataBucket"

    actions = [
      "s3:GetBucketLocation",
      "s3:ListBucket"
    ]

    resources = [
      aws_s3_bucket.kendrix_data.arn
    ]
  }

  statement {
    sid = "KendrixDataObjects"

    actions = [
      "s3:GetObject",
      "s3:PutObject",
      "s3:DeleteObject"
    ]

    resources = [
      "${aws_s3_bucket.kendrix_data.arn}/*"
    ]
  }
}

resource "aws_iam_role_policy" "github_actions" {
  name = "kendrix-er-github-actions"
  role = aws_iam_role.github_actions.id

  policy = data.aws_iam_policy_document.github_actions_permissions.json
}