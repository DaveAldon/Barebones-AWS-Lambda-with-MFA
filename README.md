# Barebones-AWS-Lambda-with-MFA

A barebones example of how to deploy to AWS Lambda using MFA and SAM CLI, with the Least Privilege IAM policy

#### Roles Needed

- `iam:CreateRole`
- `iam:AttachRolePolicy`
- `iam:DetachRolePolicy`
- `cloudformation:CreateChangeSet`
- `apigateway:*` SAM needs to associate your Lambda function with an API gateway

#### Troubleshooting

`aws configure list` - shows you the current configuration and if your profile is set correctly or not. Example output:

```
      Name                    Value             Type    Location
      ----                    -----             ----    --------
   profile                <not set>             None    None
access_key     ******************** shared-credentials-file
secret_key     ******************** shared-credentials-file
    region                us-east-1      config-file    ~/.aws/config
```

`nano ~/.aws/credentials` - You can use whatever editor you want for this. But this shows you the credentials file, separated by profiles, with the tokens/access key information. Example output:

```
[default]
aws_access_key_id =     XXXXXXXXXXXXXXXXXXXX
aws_secret_access_key = XXXXXXXXXXXXXXXXXXXX
[mfa]
aws_access_key_id =     XXXXXXXXXXXXXXXXXXXX
aws_secret_access_key = XXXXXXXXXXXXXXXXXXXX
aws_session_token =     XXXXXXXXXXXXXXXXXXXX
```
