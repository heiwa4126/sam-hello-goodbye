#!/bin/sh -ue
. ./tmp/env.sh
echo '**** will display {"message": "Invalid request body"} or anything'

curl -XPOST "$STACK_url/add" -H "Content-Type: application/json" -d '{"a":1,"c":2}'
echo
curl -XPOST "$STACK_url/add" -H "Content-Type: application/json" -d '{"a":1}'
echo
curl -XPOST "$STACK_url/add" -H "Content-Type: application/json" -d '{"a":1,"b":"2"}'
echo

echo '**** query validation still fail'
curl "$STACK_url/add?a=1&c=2"
echo
curl "$STACK_url/add?a=1"
echo
curl "$STACK_url/add?a=1&b=z"
echo
