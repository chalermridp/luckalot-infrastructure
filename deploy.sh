#!/bin/sh
StageName=$1
mkdir -p artifact

aws cloudformation package --template-file template.yaml --s3-bucket luckalot-infrastructure-artifact --output-template-file artifact/template.${StageName:-"dev"}.out.yaml --profile=luckalot.${StageName:-"dev"}
aws cloudformation deploy --template-file artifact/template.${StageName:-"dev"}.out.yaml --stack-name luckalot-infrastructure-stack --capabilities CAPABILITY_NAMED_IAM --profile=luckalot.${StageName:-"dev"}