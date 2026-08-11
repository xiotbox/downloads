<div align="center">

<img src="logo.png" alt="XiotBox" width="120" />

# XiotBox

**セルフホスト型クラウド印刷プラットフォーム**

[Webサイト](https://www.xiotbox.com) · [ライブデモ](https://demo.xiotbox.com) · [Odoo Apps](https://apps.odoo.com/apps/browse?repo_maintainer_id=500439)

[English](README.md) · [简体中文](README.zh-CN.md) · **日本語** · [Français](README.fr-FR.md)

</div>

## XiotBox とは

XiotBox は、PrintNode クライアントプロトコルと互換性のある**セルフホスト型クラウド印刷プラットフォーム**です。すべての印刷データは自社サーバー上に保持され、サードパーティのクラウドに依存せず、インフラを完全に管理できます。

| コンポーネント | 説明 | 価格 |
| --- | --- | --- |
| XiotBox Lite | Odoo 19 用の無料ダイレクト印刷モジュール | 無料 |
| XiotBox Runtime | サーバー側ランタイム（HTTP API + 内蔵 SocketD） | サブスクリプション —— **初回導入時に自動で 30 日間トライアル** |
| Desktop Patch | PrintNode クライアントのエンドポイントパッチ（Windows/macOS） | 無料 |

すべての Odoo モジュールは無料です。Runtime のみがサブスクリプション対象で、初回導入時に**自動的に**30日間の無料トライアルが付与されます。登録も承認も不要です。

## クイックスタート

ワンコマンド導入（Linux、Docker + Compose v2 が必要）：

```sh
curl -fsSL https://raw.githubusercontent.com/xiotbox/downloads/main/quickstart.sh | sh
```

初心者向けガイド：

- 日本語（準備中）

## 主な機能

- **PrintNode クライアント互換** —— クライアントはそのまま、自分の Runtime を指定するだけ
- **単一のコンパイル済みサービス** —— HTTP Runtime と SocketD を 1 コンテナに統合
- **自動トライアル** —— 初回起動時に 30 日間の無料トライアルを自動発行
- **エンドツーエンド暗号化** —— Ed25519 / X25519 署名トークン方式
- **デバイス管理** —— ユーザーごとのプリンター可視性・オンライン状態・印刷ジョブ
- **堅牢なコンテナ** —— 非 root 実行、全 capability 破棄、読み取り専用ルートファイルシステム

## ダウンロード

すべてのリリース成果物は正確な Git タグからビルドされ、不変であり、`.sha256` サイドカーが付属します。匿名ダウンロードと再開可能な転送に対応しています。

| 成果物 | 場所 |
| --- | --- |
| XiotBox Runtime（Docker amd64） | Releases —— `XiotBoxRuntime-<バージョン>-docker-amd64.tar.gz` |
| XiotBox Client（Windows x86-64） | Releases —— `XiotBoxClient-<バージョン>-windows-x86_64.zip` |
| Desktop Patch プレビュー（Windows） | Releases —— `desktop-patch-*` タグ |
| SHA-256 検証 | 各 Release の `.sha256` サイドカー |

検証方法：

```sh
shasum -a 256 -c XiotBoxRuntime-<バージョン>-docker-amd64.tar.gz.sha256
```

## リンクとサポート

- Webサイト：https://www.xiotbox.com
- ライブデモ：https://demo.xiotbox.com
- Odoo Apps：https://apps.odoo.com/apps/browse?repo_maintainer_id=500439
- サポート：support@xiotbox.com
