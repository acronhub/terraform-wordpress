{
    "Version": "2008-10-17",
    "Id": "PolicyAllowAccessFromCloudFrontOnly",
    "Statement": [
        {
            "Sid": "StmtAllowCloudFrontOnly",
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::cloudfront:user/CloudFront Origin Access Identity ${cloudfront_identity_id}"
            },
            "Action": "s3:GetObject",
            "Resource": [
                "arn:aws:s3:::${bucket}",
                "arn:aws:s3:::${bucket}/*"
            ]
        }
    ]
}
