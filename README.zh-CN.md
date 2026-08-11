<div align="center">

<img src="logo.png" alt="XiotBox" width="120" />

# XiotBox

**自托管云打印平台**

[官网](https://www.xiotbox.com) · [在线体验](https://demo.xiotbox.com) · [Odoo 商城](https://apps.odoo.com/apps/browse?repo_maintainer_id=500439)

[English](README.md) | **简体中文** | [日本語](README.ja-JP.md) | [Français](README.fr-FR.md)

</div>

## XiotBox 是什么？

XiotBox 是**自托管（Self-hosted）云打印平台**，兼容 PrintNode 客户端协议。所有打印数据保存在你自己的服务器上，不依赖第三方云服务，基础设施完全自主可控。

| 组件 | 说明 | 价格 |
| --- | --- | --- |
| XiotBox Lite | Odoo 19 免费直连打印模块 | 免费 |
| XiotBox Runtime | 服务端运行时（HTTP API + 内置 SocketD） | 订阅 —— **首次部署自动获得 30 天试用** |
| Desktop Patch | PrintNode 客户端端点补丁（Windows/macOS） | 免费 |

所有 Odoo 模块均免费。Runtime 是唯一的订阅项，首次部署**自动**获得 30 天免费试用——无需注册、无需审批。

## 快速开始

一键部署（Linux，需 Docker + Compose v2）：

```sh
curl -fsSL https://raw.githubusercontent.com/xiotbox/downloads/main/quickstart.sh | sh
```

新手教程：

- 简体中文：[macOS 快速部署教程（含 Docker 安装）](macos-quickstart.md)

## 核心特性

- **兼容 PrintNode 客户端** —— 客户端无需更换，指向你自己的 Runtime 即可
- **单一编译服务** —— HTTP Runtime 与 SocketD 合并在一个容器里
- **自动试用** —— 首次启动自动签发 30 天免费试用，无需许可证
- **端到端传输加密** —— Ed25519 / X25519 签名令牌机制
- **设备管理** —— 按用户管理打印机可见性、在线状态与打印任务
- **容器加固** —— 非 root 运行、丢弃全部 capabilities、根文件系统只读

## 下载

所有正式产物均来自精确 Git tag，不可变，并附带 `.sha256` 校验文件。支持匿名下载与断点续传。

| 产物 | 获取方式 |
| --- | --- |
| XiotBox Runtime（Docker amd64） | Releases —— `XiotBoxRuntime-<版本>-docker-amd64.tar.gz` |
| XiotBox Client（Windows x86-64） | Releases —— `XiotBoxClient-<版本>-windows-x86_64.zip` |
| Desktop Patch 预览版（Windows） | Releases —— `desktop-patch-*` 标签 |
| SHA-256 校验 | 每个 Release 的 `.sha256` 文件 |

校验方法：

```sh
shasum -a 256 -c XiotBoxRuntime-<版本>-docker-amd64.tar.gz.sha256
```

## 链接与支持

- 官网：https://www.xiotbox.com
- 在线体验：https://demo.xiotbox.com
- Odoo 商城：https://apps.odoo.com/apps/browse?repo_maintainer_id=500439
- 支持邮箱：support@xiotbox.com
