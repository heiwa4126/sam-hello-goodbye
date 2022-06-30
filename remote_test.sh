#!/bin/sh -ue
. ./tmp/env.sh
curl "$STACK_url/hello"
echo
curl "$STACK_url/hello/yoshida"
echo
curl "$STACK_url/goodbye"
echo
