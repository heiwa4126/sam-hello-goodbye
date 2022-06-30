#!/bin/sh -ue
# call after `sam build && sam local start-api`
STACK_url=http://localhost:3000
# curl "$STACK_url/hello"
# echo
# curl "$STACK_url/hello/yoshida"
# echo
# curl "$STACK_url/goodbye"
# echo
curl "$STACK_url/add?a=1&b=2"
echo
curl -XPOST "$STACK_url/add" -H "Content-Type: application/json" -d '{"a":1,"b":2}'
echo
