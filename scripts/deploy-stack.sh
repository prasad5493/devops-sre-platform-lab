#!/usr/bin/env bash
set -euo pipefail

STACK_NAME="${STACK_NAME:-devops-sre-platform-lab}"
AWS_REGION="${AWS_REGION:-eu-west-2}"
TEMPLATE_FILE="cloudformation/platform.yml"

if ! command -v aws >/dev/null 2>&1; then
  echo "AWS CLI is not installed. Install it before running this script."
  exit 1
fi

echo "Deploying stack: ${STACK_NAME} in region: ${AWS_REGION}"

aws cloudformation deploy \
  --stack-name "${STACK_NAME}" \
  --template-file "${TEMPLATE_FILE}" \
  --capabilities CAPABILITY_NAMED_IAM \
  --region "${AWS_REGION}" \
  --parameter-overrides \
    EnvironmentName="devops-sre-lab" \
    AllowedHttpCidr="0.0.0.0/0" \
    EnableSSH="false"

echo "Deployment finished. Stack outputs:"
aws cloudformation describe-stacks \
  --stack-name "${STACK_NAME}" \
  --region "${AWS_REGION}" \
  --query "Stacks[0].Outputs" \
  --output table
