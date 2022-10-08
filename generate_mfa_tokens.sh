#!/bin/bash

MFA_CODE=$1
USERNAME="arn:aws:iam::<USER>"

SESSION_TOKEN=$(aws sts get-session-token \
--serial-number ${USERNAME} \
--token-code ${MFA_CODE})

ACCESS_KEY=$(echo ${SESSION_TOKEN} | jq --raw-output '.Credentials.AccessKeyId')
SECRET_KEY=$(echo ${SESSION_TOKEN} | jq --raw-output '.Credentials.SecretAccessKey')
SESS_TOKEN=$(echo ${SESSION_TOKEN} | jq --raw-output '.Credentials.SessionToken')

aws configure set aws_access_key_id ${ACCESS_KEY} --profile mfa
aws configure set aws_secret_access_key ${SECRET_KEY} --profile mfa
aws configure set aws_session_token ${SESS_TOKEN} --profile mfa
aws configure set default.region us-east-1 --profile mfa