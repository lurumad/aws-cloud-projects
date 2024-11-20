#!/bin/bash

EXISTING_CERT_ARN=$(aws acm list-certificates \
    --query "CertificateSummaryList[?DomainName=='*.luisruizpavon.com'].CertificateArn" \
    --output text)

if [ -z "$EXISTING_CERT_ARN" ]; then
  echo "Importing certificate..."
  CERTIFICATE_ARN=$(aws acm import-certificate \
      --certificate fileb://certificate.cer \
      --private-key fileb://private_key.key \
      --certificate-chain fileb://certificate_chain.ca-bundle \
      --query "CertificateArn" \
      --output text)

  aws ssm put-parameter \
      --name "/web/certificateArn" \
      --value "$CERTIFICATE_ARN" \
      --type String

  echo "Certificate imported and stored in SSM Parameter Store."
fi

