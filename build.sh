#! /bin/sh
set -ex

WORK_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$WORK_DIR"

export NVIM_APPNAME=nvim_wombat_build
PACK_DIR="${XDG_DATA_HOME:-~/.share}/$NVIM_APPNAME/site/pack/wombat/opt"
mkdir -p "$PACK_DIR"
rm -f "$PACK_DIR/wombat"
ln -s "$WORK_DIR" "$PACK_DIR/wombat"

nvim -u ./shipwright_init.lua --headless "+Shipwright" +qa
