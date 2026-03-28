# onnxruntime-builder
VOICEVOX COREで利用するonnxruntimeのビルドを行うリポジトリ

## ビルド

Github Actions から workflow_dispatch を起動。

## リリース

Releases からタグを指定して Publish releases 。

## GitHub Actions のバージョン固定

[pinact](https://github.com/suzuki-shunsuke/pinact) を使って GitHub Actions のバージョンを full-length commit SHA に固定しています。
プルリクエストを送ると自動でテストされます。

```bash
# バージョンを固定する
pinact run

# バージョンを更新して固定する
pinact run --update --min-age 7
```
