#!/bin/bash

source env.config

sam deploy \
    --template-file packaged.yamxl \
    --stack-name $STACK \
    --capabilities CAPABILITY_IAM \
    --region $REGION

# You may have to update ?OutputKey== to what you defined template.yaml output
aws cloudformation describe-stacks --stack-name $STACK \
    --query 'Stacks[0].Outputs[?OutputKey==`HelloWorldApi`].OutputValue' \
    --output text \
2    --region $REGION
