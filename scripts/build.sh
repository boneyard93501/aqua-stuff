#!/usr/bin/env bash -o errexit -o nounset -o pipefail

mkdir -p artifacts
rm -f artifacts/*.wasm

cd ipfs-adapter
cargo update --aggressive
marine build --release
cp target/wasm32-wasi/release/ipfs_adapter.wasm ../artifacts/

cd ../ipfs-cli
cargo update --aggressive
marine build --release
cp target/wasm32-wasi/release/ipfs_cli.wasm ../artifacts/

cd ..