# S3
locals {
    bucket_name = "wordpress.${var.domain}"
}

resource "aws_s3_bucket" "project" {
    bucket = "${local.bucket_name}"

    acl    = "private"
    website {
        index_document = "index.html"
        error_document = "404.html"
    }
    policy = "${data.template_file.project_policy.rendered}"

    tags = {
        Name = "${var.project_name}-s3"
    }
}

data "template_file" "cloudfront_policy" {
    template = "${file("policies/s3_webhosting_allow_access_from_cloudfront_policy.json.tpl")}"

    vars = {
        bucket = "${local.bucket_name}"
        cloudfront_identity_id = "${aws_cloudfront_origin_access_identity.origin_access_identity.id}"
    }
}

data "template_file" "project_policy" {
    template = "${file("policies/s3_webhosting_allow_access_from_global_policy.json.tpl")}"

    vars = {
        bucket = "${local.bucket_name}"
    }
}