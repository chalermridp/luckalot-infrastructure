$StageName = $args[0]
if ($null -eq $StageName) {
    $StageName = 'dev'
}

mkdir -p artifact

aws cloudformation package --template-file template.yaml --s3-bucket luckalot-infrastructure-artifact --output-template-file artifact/template.$StageName.out.yaml --profile luckalot.$StageName
aws cloudformation deploy --template-file artifact/template.$StageName.out.yaml --stack-name luckalot-infrastructure-stack --capabilities CAPABILITY_NAMED_IAM --profile luckalot.$StageName