{
    "Version": "2008-10-17",
    "Id": "PolicyAllowAccessFromGlobal",
    "Statement": [
        {
            "Sid": "StmtAllowGlobal",
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
            "Resource": [
                "arn:aws:s3:::${bucket}",
                "arn:aws:s3:::${bucket}/*"
            ]
        }
    ]
}
