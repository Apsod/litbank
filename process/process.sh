#!/bin/sh

ROOT=/indata
OUT=/outdata/lb.json

for IN in $ROOT/*.epub; do
    CMD="pandoc --from epub $IN --to plain | jq -Rsc '{text: .}'"
    echo "${CMD}"
done | parallel -j 4 > $OUT

gzip $OUT
