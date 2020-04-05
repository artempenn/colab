resource "aws_s3_bucket" "website_bucket" {
  bucket = "poetry-app-website" # NOTE: if you change this, you'll need to change the "__BUCKET_NAME__" in "ar:aws:s3:::__BUCKET_NAME__/*" to match 
  acl    = "public-read"

  # define the policy (`<<EOF` says to computer "start multiline string, `EOF` says "end multiline string")
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "*"",
      "Action": ["s3:GetObject"],
      "Resource": [
        "arn:aws:s3:::poetry-app-website/*"
      ]
    }
  ]
}
EOF

  website {
    index_document = "index.html"
    # error_document = "error.html", if you ever create an error doc, this is where it will go
  }
}