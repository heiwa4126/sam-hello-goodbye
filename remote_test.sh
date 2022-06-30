#!/bin/sh -ue
. ./tmp/env.sh
curl "$STACK_url/hello"
echo
curl "$STACK_url/hello/yoshida"
echo
curl "$STACK_url/goodbye"
echo
curl "$STACK_url/add?a=1&b=2"
echo
curl -XPOST "$STACK_url/add" -H "Content-Type: application/json" -d '{"a":1,"b":2}'
echo
