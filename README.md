# Barebones-AWS-Lambda-with-MFA

A barebones example of how to deploy to AWS Lambda using MFA and SAM CLI, with the Least Privilege IAM policy.

#### Getting Started

Assumptions:

1. You're part of an AWS organization
2. You don't have root access, and need to request "least privilege" access to your admin in order to deploy a new Lambda function
3. Your organization requires MFA

#### Step 1: Install Dependencies

1. Install the [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

```
curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
sudo installer -pkg AWSCLIV2.pkg -target /
```

and then run `aws --version` to verify that it's installed correctly.

2. Install [Docker](https://docs.docker.com/engine/install/) - This is needed for local testing of AWS SAM projects

3. Install [Homebrew](https://docs.brew.sh/) - This is needed to install the AWS SAM CLI

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

Verify that it's installed correctly by running `brew --version`

4. Install the [AWS SAM CLI](https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-sam-cli-install.html)

```
brew tap aws/tap
brew install aws-sam-cli
```

Verify that it's installed correctly by running `sam --version`

#### Step 2: Get the minimum roles needed for your AWS account

You'll need the following roles if you're part of an AWS organization that practices the "least-privilege" principle:

- `iam:CreateRole`
- `iam:AttachRolePolicy`
- `iam:DetachRolePolicy`
- `cloudformation:CreateChangeSet`
- `apigateway:*` SAM needs to associate your Lambda function with an API gateway

#### Step 3:

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
