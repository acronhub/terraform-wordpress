# Cloud Front
resource "aws_cloudfront_origin_access_identity" "origin_access_identity" {
    comment = "${var.domain}"
}

resource "aws_cloudfront_distribution" "project-distribution" {
    enabled = true
    comment = "www.${var.domain}"
    aliases = [
      "www.${var.domain}"
    ]

    default_root_object = "index.html"

    origin {
        domain_name = "${aws_s3_bucket.project.website_endpoint}"

        origin_id = "${aws_s3_bucket.project.id}"

        custom_origin_config {
            http_port              = 80
            https_port             = 443
            origin_protocol_policy = "http-only"
            origin_ssl_protocols   = ["TLSv1", "TLSv1.1", "TLSv1.2"]
        }
    }

    default_cache_behavior {
        allowed_methods  = ["GET","HEAD"]
        cached_methods   = ["GET","HEAD"]
        target_origin_id = "${aws_s3_bucket.project.id}"

        compress = true

        min_ttl     = 0
        max_ttl     = 31536000
        default_ttl = 86400

        viewer_protocol_policy = "redirect-to-https"

        forwarded_values {
            query_string = false
            cookies {
                forward = "none"
            }
        }
    }

    restrictions {
        geo_restriction {
            restriction_type = "none"
        }
    }

    viewer_certificate {
      acm_certificate_arn      = "${aws_acm_certificate.project.arn}"
      ssl_support_method       = "sni-only"
      minimum_protocol_version = "TLSv1"
    }
}
