#IAM
resource "aws_iam_user" "deploy_project" {
    name = "${var.project_name}-deploy_wordpress"

    tags = {
        Name = "${var.project_name}-iam"
    }
}

resource "aws_iam_policy" "deploy_project_policy" {
    name = "${var.project_name}-s3_fullaccess_policy"
    description = "S3 WordPress デプロイポリシー"

    policy = "${data.template_file.project_iam_policy.rendered}"
}

data "template_file" "project_iam_policy" {
    template = "${file("policies/s3_fullaccess_target_resources_only_policy.json.tpl")}"

    vars = {
        arn = "${aws_s3_bucket.project.arn}"
    }
}

resource "aws_iam_user_policy_attachment" "deploy_project_policy-attach" {
    user       = "${aws_iam_user.deploy_project.name}"
    policy_arn = "${aws_iam_policy.deploy_project_policy.arn}"
}

resource "aws_iam_access_key" "deploy_project" {
  user    = "${aws_iam_user.deploy_project.name}"
}
