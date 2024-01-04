#!/usr/bin/env bash

# find assets -name "*.yaml" | while read file; do
#     echo $file
# done

list="$(find assets -name "*.yaml" | tr "\n" " ")"
yq ea '[.]' $list | yq ea '[.]' | yq ea '{"assets": .[0]}' > out/assets.yaml

tera -t templates/list.md.tera out/assets.yaml > list.md
