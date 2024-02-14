#!/usr/bin/env bash

for i in {1..20}; do
  echo making request $i
  curl -I -H "Host:ingress-sidecar.ingress-sidecar" localhost:10000/healthz/ready
done