resource "aws_route53_zone" "project" {
  name = "${var.domain}"
}

resource "aws_route53_record" "www" {
  zone_id = "${aws_route53_zone.project.zone_id}"
  name    = "www.${var.domain}"
  type    = "A"
  alias {
    name    = "${aws_cloudfront_distribution.project-distribution.domain_name}"
    zone_id = "${aws_cloudfront_distribution.project-distribution.hosted_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "project_validation" {
  zone_id = "${aws_route53_zone.project.id}"
  name    = "${aws_acm_certificate.project.domain_validation_options.0.resource_record_name}"
  type    = "${aws_acm_certificate.project.domain_validation_options.0.resource_record_type}"
  records = ["${aws_acm_certificate.project.domain_validation_options.0.resource_record_value}"]
  ttl     = 60
}