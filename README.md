# onnxruntime-builder
VOICEVOX COREで利用するonnxruntimeのビルドを行うリポジトリ

## ビルド

Github Actions から workflow_dispatch を起動。

## リリース

1. [`build`ワークフロー]を`release=true`で起動してdraft releaseを作成。
2. releaseのdraftを解除するか、または手元でannotated tagを作りこのリポジトリにpushする。

[`build`ワークフロー]: https://github.com/VOICEVOX/onnxruntime-builder/actions/workflows/build.yml
