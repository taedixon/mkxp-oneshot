#!/bin/bash

run_dir="$1"
asset_dir="$2"
asset_file="$3"
out_file="$4"

build_dir="$(pwd)"
cd "$run_dir"
xxd -i "$asset_dir/$asset_file" "$build_dir/$out_file"