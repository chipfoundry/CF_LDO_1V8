#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
OUT="${TMPDIR:-/tmp}/cf_ldo_1v8_tb"
iverilog -g2005 -o "$OUT" \
  "$ROOT/hdl/gl/CF_LDO_1V8.v" \
  "$ROOT/verify/beh_model/CF_LDO_1V8_core.v" \
  "$ROOT/verify/beh_model/tb_CF_LDO_1V8.v"
vvp "$OUT"
