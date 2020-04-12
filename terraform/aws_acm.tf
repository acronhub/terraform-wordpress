resource "aws_acm_certificate" "project" {
  domain_name       = "www.${var.domain}"
  validation_method = "DNS"
  provider          = "aws.virginia"

  lifecycle {
    create_before_destroy = true
  }

}

resource "aws_acm_certificate_validation" "project" {
  certificate_arn         = "${aws_acm_certificate.project.arn}"
  validation_record_fqdns = ["${aws_route53_record.project_validation.fqdn}"]
  provider                = "aws.virginia"
}
