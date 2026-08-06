# macOS 快速部署 XiotBox Runtime（新手教程）

本教程让你在 macOS 上从零开始，用**复制粘贴**完成 XiotBox Runtime 的部署，并自动获得 30 天免费试用。全程只需要打开"终端"（Terminal）。

## 第 0 步：打开终端

按 `Command + 空格`，输入"终端"（Terminal），回车。下面所有命令都在终端里执行。

## 第 1 步：安装 Docker（第一次需要）

macOS 本身不带 Docker，我们用轻量的 `colima` 方案（纯命令行，不弹窗口）。

**如果还没装 Homebrew**，先执行（复制整行粘贴回车）：

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

装完 Homebrew 后，依次执行：

```sh
brew install colima docker docker-compose
brew install lima-additional-guestagents
```

> 第二步只影响 Apple 芯片（M1/M2/M3）电脑，Intel 芯片装不上也没关系，跳过即可。

启动 Docker 虚拟机（Intel 芯片去掉 `--arch x86_64`）：

```sh
colima start --arch x86_64 --vm-type qemu --cpu 2 --memory 4 --disk 20
```

验证是否成功（两条都显示版本号就 OK）：

```sh
docker version
docker compose version
```

如果 `docker compose` 报 "unknown command"，执行下面这条再试：

```sh
mkdir -p ~/.docker/cli-plugins && ln -sf /opt/homebrew/bin/docker-compose ~/.docker/cli-plugins/docker-compose
```

## 第 2 步：一键部署 Runtime（30 天免费试用自动申请）

```sh
curl -fsSL https://raw.githubusercontent.com/xiotbox/downloads/main/quickstart.sh | sh
```

脚本会自动完成：下载最新版本 → 校验 SHA-256 → 生成配置（随机密钥）→ 启动服务 → 健康检查。

看到下面的输出就成功了：

```text
XiotBox Runtime 1.2.1 is up.
Runtime API URL : http://192.168.x.x:8020
SocketD address : tcp://192.168.x.x:9019
```

- **30 天免费试用会自动申请**，不需要填任何许可证，也不需要人工审批
- 记下 `Runtime API URL` 和 `.env` 里的 token，下一步填到你的 Odoo XiotBox 设置里

## 第 3 步：确认试用已生效（可选）

浏览器打开 `http://localhost:8020/healthz`，看到 `ok` 即服务正常。试用许可会自动出现在 xiotbox sales 后台。

## 下载很慢怎么办？（中国网络常见问题）

50MB 的包在 GitHub 上下载慢是常见现象，三种办法任选：

**办法 1：走代理（推荐，最快）**

如果你有科学上网工具（Clash/Surge 等），先找到本地代理端口（Clash 通常 `7890`，Surge 通常 `1087`），执行：

```sh
export HTTPS_PROXY=http://127.0.0.1:7890
export HTTP_PROXY=http://127.0.0.1:7890
```

然后再跑第 2 步的命令。

**办法 2：手动下载（适合下载工具/断点续传）**

先手动下载两个文件到任意目录：

```text
https://github.com/xiotbox/downloads/releases/latest
```

在 Releases 页面下载 `XiotBoxRuntime-<版本>-docker-amd64.tar.gz` 和同名 `.sha256` 文件，校验：

```sh
shasum -a 256 -c XiotBoxRuntime-<版本>-docker-amd64.tar.gz.sha256
```

看到 `OK` 后再解压，进入目录执行 `./install.sh`（提前把 `.env.lan.example` 复制成 `.env`，把里面的 `CHANGE_ME` 换成你的局域网 IP 和随机密码）。

**办法 3：多试几次**

脚本自带失败重试（5 次），网络抖动时直接再跑一次命令即可，校验通过前不会启动服务。

## 常见问题

| 现象 | 处理 |
| --- | --- |
| `colima start` 报错缺 guest agent | 确认执行过 `brew install lima-additional-guestagents` |
| 端口 8020/9019 被占用 | `docker compose logs runtime` 看日志，或改 `.env` 里的端口 |
| 健康检查失败 | `docker compose logs --tail 50 runtime` 查看报错，把日志发给我们 |
| 试用没自动到账 | 确认能访问 `https://license.xiotbox.com`（海外服务器，网络不通会申请失败） |
| 想停止服务 | `cd xiotbox-runtime/XiotBoxRuntime-<版本>-docker-amd64 && docker compose down` |

## 下一步

1. 在 Odoo 的 XiotBox 设置里填入 `Runtime API URL`、生成的 token
2. 安装桌面客户端补丁（见 [downloads 仓库](https://github.com/xiotbox/downloads)）
3. 配置完成后即可打印测试

有疑问：support@xiotbox.com
