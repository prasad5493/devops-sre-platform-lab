#!/usr/bin/env bash
set -euo pipefail

STACK_NAME="${STACK_NAME:-devops-sre-platform-lab}"
AWS_REGION="${AWS_REGION:-eu-west-2}"

if ! command -v aws >/dev/null 2>&1; then
  echo "AWS CLI is not installed. Install it before running this script."
  exit 1
fi

echo "Deleting stack: ${STACK_NAME} from region: ${AWS_REGION}"
aws cloudformation delete-stack --stack-name "${STACK_NAME}" --region "${AWS_REGION}"
aws cloudformation wait stack-delete-complete --stack-name "${STACK_NAME}" --region "${AWS_REGION}"
echo "Stack deleted."
