# Docker 构建与推送说明

## 报错原因

`dial tcp ... registry-1.docker.io:443: connect: operation timed out`

说明 **Docker 拉不到 Docker Hub 基础镜像**（`maven`、`openjdk` 等），不是项目代码问题。

---

## 第一步：配置阿里云镜像加速（必做）

1. 打开 [容器镜像服务 - 镜像工具 - 镜像加速器](https://cr.console.aliyun.com/cn-hangzhou/instances/mirrors)
2. 复制你的 **加速器地址**，形如：`https://xxxxxx.mirror.aliyuncs.com`
3. Docker Desktop → **Settings** → **Docker Engine**
4. 在 JSON 里加上（保留原有内容，只增加 `registry-mirrors`）：

```json
{
  "registry-mirrors": [
    "https://你的加速器地址.mirror.aliyuncs.com"
  ]
}
```

5. 点 **Apply & Restart**，等 Docker 重启完成

---

## 第二步：构建并推送

镜像仓库地址（你的）：

```text
crpi-48pq4r9b5ljm5r9j.cn-hangzhou.personal.cr.aliyuncs.com/lrf-project/lrf-project
```

### 登录

```bash
docker login --username=lishuai4920 crpi-48pq4r9b5ljm5r9j.cn-hangzhou.personal.cr.aliyuncs.com
```

密码用 **访问凭证** 里设置的镜像仓库密码。

### 方式 A：本机 Maven + Docker 打运行包（推荐）

只需拉一个小镜像 `openjdk:8-jre-slim`，成功率更高。

```bash
cd /Users/lipiaoliang/Documents/ziwoxiangmu/changquguanligithub/changquguanli

# 本机打包（需已安装 Maven、JDK8）
mvn clean package -DskipTests -pl ruoyi-admin -am

# 构建镜像（注意 tag 用 latest，不是 laster）
docker build -f Dockerfile.local -t crpi-48pq4r9b5ljm5r9j.cn-hangzhou.personal.cr.aliyuncs.com/lrf-project/lrf-project:latest .

# 推送
docker push crpi-48pq4r9b5ljm5r9j.cn-hangzhou.personal.cr.aliyuncs.com/lrf-project/lrf-project:latest
```

### 方式 B：全部在 Docker 里构建

配置镜像加速后：

```bash
cd /Users/lipiaoliang/Documents/ziwoxiangmu/changquguanligithub/changquguanli

docker build -t crpi-48pq4r9b5ljm5r9j.cn-hangzhou.personal.cr.aliyuncs.com/lrf-project/lrf-project:latest .

docker push crpi-48pq4r9b5ljm5r9j.cn-hangzhou.personal.cr.aliyuncs.com/lrf-project/lrf-project:latest
```

### 方式 C：全阿里云镜像构建（Docker Hub 完全不可用时）

已验证 `registry.cn-hangzhou.aliyuncs.com/acs/maven:3-jdk-8` 可正常拉取：

```bash
docker build -f Dockerfile.aliyun \
  -t crpi-48pq4r9b5ljm5r9j.cn-hangzhou.personal.cr.aliyuncs.com/lrf-project/lrf-project:latest .

docker push crpi-48pq4r9b5ljm5r9j.cn-hangzhou.personal.cr.aliyuncs.com/lrf-project/lrf-project:latest
```

运行镜像体积会偏大（含 Maven+JDK），但能绕过 Docker Hub 超时。

---

| 错误 | 处理 |
|------|------|
| `Dockerfile: no such file` | 必须在项目根目录执行，且存在 `Dockerfile` |
| `registry-1.docker.io ... timed out` | 配置阿里云镜像加速后重启 Docker |
| `denied` / `unauthorized` | 先 `docker login`，检查用户名和访问凭证密码 |
| tag 写 `laster` | 应写成 `latest` |

---

## 验证加速是否生效

```bash
docker pull openjdk:8-jre-slim
```

能拉下来再执行 `docker build`。
