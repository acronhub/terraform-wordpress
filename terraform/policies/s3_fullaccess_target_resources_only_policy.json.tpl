{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "Buckets",
            "Effect": "Allow",
            "Action": [
                "s3:PutAccountPublicAccessBlock",
                "s3:GetAccountPublicAccessBlock",
                "s3:ListAllMyBuckets",
                "s3:HeadBucket"
            ],
            "Resource": "*"
        },
        {
            "Sid": "TargetResourcesOnly",
            "Effect": "Allow",
            "Action": "s3:*",
            "Resource": [
                "${arn}",
                "${arn}/*"
            ]
        }
    ]
}
