#!/bin/sh -ue
. ./tmp/env.sh

aws apigateway get-export --region "$STACK_region" --no-cli-pager \
    --parameters extensions='apigateway' \
    --rest-api-id "$STACK_api" --stage-name "$STACK_stage" --export-type oas30 \
    tmp/oas3.json

yq -y . tmp/oas3.json > tmp/oas3.yaml
