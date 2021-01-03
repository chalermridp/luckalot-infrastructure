#!/bin/sh
StageName=$1
mkdir -p artifact

export AWS_PROFILE=luckalot.${StageName:-"dev"}
aws cloudformation package --template-file template.yaml --s3-bucket luckalot-infrastructure.${StageName:-"dev"}-artifact --output-template-file artifact/template.${StageName:-"dev"}.out.yaml
aws cloudformation deploy --template-file artifact/template.${StageName:-"dev"}.out.yaml --stack-name luckalot-infrastructure-${StageName:-"dev"}-stack --capabilities CAPABILITY_NAMED_IAM