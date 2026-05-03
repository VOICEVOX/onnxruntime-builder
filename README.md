# onnxruntime-builder
VOICEVOX COREで利用するonnxruntimeのビルドを行うリポジトリ

## ビルド

[`build`ワークフロー]をworkflow_dispatchで起動。

## リリース

1. [`build`ワークフロー]を`release=true`で起動してdraft releaseを作成。
2. releaseのdraftを解除する。

[`build`ワークフロー]: https://github.com/VOICEVOX/onnxruntime-builder/actions/workflows/build.yml
