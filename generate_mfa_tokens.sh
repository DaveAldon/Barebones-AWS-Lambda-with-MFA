#!/bin/bash

source ./.env

MFA_CODE=$1
USERNAME=$IAM_USERNAME
PROFILE=$IAM_PROFILE
REGION=$IAM_REGION

SESSION_TOKEN=$(aws sts get-session-token \
--serial-number ${USERNAME} \
--token-code ${MFA_CODE})

ACCESS_KEY=$(echo ${SESSION_TOKEN} | jq --raw-output '.Credentials.AccessKeyId')
SECRET_KEY=$(echo ${SESSION_TOKEN} | jq --raw-output '.Credentials.SecretAccessKey')
SESS_TOKEN=$(echo ${SESSION_TOKEN} | jq --raw-output '.Credentials.SessionToken')

aws configure set aws_access_key_id ${ACCESS_KEY} --profile ${PROFILE}
aws configure set aws_secret_access_key ${SECRET_KEY} --profile ${PROFILE}
aws configure set aws_session_token ${SESS_TOKEN} --profile ${PROFILE}
aws configure set default.region ${REGION} --profile ${PROFILE}
