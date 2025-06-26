# 🚀 Flavor Database - 启动指南

## 问题解决总结
**前端可以打开，但后端连接不到**

### 🔍 问题原因分析

1. **缺少环境配置文件**: 后端需要 `.env` 文件来配置数据库连接
2. **数据库连接配置**: 需要正确的数据库密码和连接信息
3. **依赖安装**: 后端需要安装 Node.js 依赖包

### ✅ 解决方案

创建完整的启动脚本系统：

## 📁 启动文件

### 1. `simple-start.bat` - 简单启动（推荐）
- 自动检查 Node.js 和 Python
- 自动创建 `.env` 配置文件
- 一键启动前后端服务

### 2. `setup-database.bat` - 数据库设置
- 检查 MySQL 安装
- 创建数据库和表结构
- 配置数据库连接

### 3. `check-db.bat` - 状态检查
- 检查 MySQL 服务状态
- 测试数据库连接
- 检查后端服务状态

### 4. `stop.bat` - 停止服务
- 停止所有 Node.js 和 Python 进程
- 清理端口占用

### 5. `USAGE.md` - 详细使用说明
- 完整的故障排除指南
- 配置说明
- 常见问题解答



### 首次使用：
```bash
# 1. 设置数据库
.\setup-database.bat

# 2. 启动系统
.\simple-start.bat
```

### 日常使用：
```bash
# 启动
.\simple-start.bat

# 停止
.\stop.bat

# 检查状态
.\check-db.bat
```

## 🔧 关键修复

### 1. 自动创建 `.env` 文件
```env
# 数据库配置
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=123456
DB_NAME=flavor_db

# 服务器端口
PORT=5000

# 环境配置
NODE_ENV=development
```

### 2. 默认数据库密码
- 默认密码：`123456`
- 如需修改，编辑 `backend/.env` 文件

### 3. 自动依赖检查
- 检查 Node.js 安装
- 检查 Python 安装
- 自动安装后端依赖

## 🌐 访问地址

启动成功后：
- **前端**: http://localhost:8000
- **后端**: http://localhost:5000
- **健康检查**: http://localhost:5000/api/health

## ⚠️ 重要提醒

1. **确保 MySQL 服务运行**
   - 如果使用 XAMPP，启动 MySQL 服务
   - 如果使用独立 MySQL，确保服务已启动

2. **数据库密码**
   - 默认密码：`123456`
   - 如果密码不同，修改 `backend/.env` 文件

3. **端口占用**
   - 如果端口被占用，先运行 `.\stop.bat`
   - 然后重新运行 `.\simple-start.bat`



按照上述步骤操作，风味数据库系统应该能够正常运行，前端和后端都能正常连接。

如果还有问题，请运行 `.\check-db.bat` 检查系统状态，或参考 `USAGE.md` 中的故障排除指南。 