<div align="center">

<img src="logo.png" alt="XiotBox" width="120" />

# XiotBox 自托管云打印平台 · Self-hosted Cloud Printing Platform

[官网 Website](https://www.xiotbox.com) · [在线体验 Live Demo](https://demo.xiotbox.com) · [托管 Runtime](https://runtime1.xiotbox.com)

</div>

---

## 这是什么 · What is this

**XiotBox** 是一个自托管（Self-hosted）的云打印平台，兼容 PrintNode 客户端协议。所有打印数据保存在你自己的服务器上，企业数据自主可控，不依赖任何第三方云服务。

**XiotBox** is a self-hosted cloud printing platform compatible with the
PrintNode client protocol. Your printing data stays on your own servers —
no third-party cloud dependency.

产品组成 · Product components:

| 组件 Component | 说明 Description | 价格 Pricing |
| --- | --- | --- |
| XiotBox Lite | Odoo 19 免费模块，直连打印服务 | 免费 Free |
| XiotBox Runtime | 服务端运行时（含 SocketD），桌面客户端入口 | 订阅 Subscription（首装自动送 30 天试用） |
| Desktop Patch | PrintNode 客户端的端点补丁（Windows/macOS） | 免费 Free |

> 所有 Odoo 模块均免费；Runtime 是唯一的订阅项，**首次部署自动获得 30 天免费试用**，无需人工申请。

> All Odoo modules are free. Runtime is the only subscription item and **the
> 30-day trial is granted automatically on first deployment** — no sign-up needed.

## 快速开始 · Quick start

**一键部署 Runtime（Linux，需 Docker + Compose v2）：**

```sh
curl -fsSL https://raw.githubusercontent.com/xiotbox/downloads/main/quickstart.sh | sh
```

**macOS 新手教程（含 Docker 安装，复制粘贴即可）：**

- 中文：[macOS 快速部署教程](macos-quickstart.md)
- English: [macOS Deployment Guide](macos-quickstart.en.md)

## 下载 · Downloads

所有正式产物均来自精确 Git tag，不可变，并附带 `.sha256` 校验文件。

| 产物 Artifact | 获取方式 |
| --- | --- |
| XiotBox Runtime（Docker amd64） | Releases 页 `XiotBoxRuntime-<版本>-docker-amd64.tar.gz` |
| Desktop Patch 预览版（Windows） | Releases 页 `desktop-patch-*` 标签 |
| SHA-256 校验 | 每个 Release 的 `.sha256` sidecar |

**校验方法 · Verify:**

```sh
shasum -a 256 -c XiotBoxRuntime-<版本>-docker-amd64.tar.gz.sha256
```

## 支持 · Support

- 官网：https://www.xiotbox.com
- 在线体验：https://demo.xiotbox.com
- 邮件：support@xiotbox.com
