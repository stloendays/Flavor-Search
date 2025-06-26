git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/stloendays/Flavor-Search.git
git push -u origin main
# Flavor Database System

一个现代化的风味数据库系统，包含前端展示和后端API服务。

Tony为你讲解。。。
 🚀 快速开始

 一键启动

1. **确保已安装必要软件：**
   - Node.js (https://nodejs.org/)
   - Python (https://www.python.org/)
   - MySQL (https://dev.mysql.com/downloads/mysql/) 或 XAMPP

2. **首次使用：**
   ```bash
   # 设置数据库
   setup-database.bat
   
   # 一键启动系统
   quick-start.bat
   ```

3. **后续使用：**
   ```bash
   # 直接启动
   quick-start.bat
   ```

### 方法二：手动启动

1. **设置数据库：**
   ```bash
   # 运行数据库设置脚本
   setup-database.bat
   ```

2. **启动后端：**
   ```bash
   cd backend
   npm install
   npm run dev
   ```

3. **启动前端：**
   ```bash
   cd frontend
   python -m http.server 8000
   ```

## 📁 项目结构

```
flavor/
├── backend/                 # 后端服务
│   ├── app.js              # 主应用文件
│   ├── package.json        # 依赖配置
│   └── .env               # 环境配置（自动生成）
├── frontend/               # 前端页面
│   ├── index.html         # 主页
│   ├── flavor.html        # 风味列表
│   ├── flavor-detail.html # 风味详情
│   ├── compound.html      # 化合物页面
│   ├── search.html        # 搜索页面
│   ├── about.html         # 关于页面
│   ├── css/               # 样式文件
│   ├── js/                # JavaScript文件
│   └── images/            # 图片资源
├── database/              # 数据库文件
│   └── flavor_schema.sql  # 数据库结构
├── start.bat              # 启动脚本
├── setup-database.bat     # 数据库设置脚本
├── quick-start.bat        # 一键启动脚本
└── README.md              # 项目说明
```

## 🔧 配置说明

### 数据库配置

默认配置（backend/.env）：
```
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=123456
DB_NAME=flavor_db
PORT=5000
NODE_ENV=development
```

如需修改数据库密码，请编辑 `backend/.env` 文件。

### 端口配置

- 前端：http://localhost:8000
- 后端：http://localhost:5000

## 🌐 访问地址

启动成功后，可以通过以下地址访问：

- **主页**: http://localhost:8000
- **风味列表**: http://localhost:8000/flavor.html
- **风味详情**: http://localhost:8000/flavor-detail.html
- **化合物页面**: http://localhost:8000/compound.html
- **搜索页面**: http://localhost:8000/search.html
- **关于页面**: http://localhost:8000/about.html

## 🔍 健康检查

检查后端服务状态：
```
http://localhost:5000/api/health
```

## 🛠️ 故障排除

### 后端连接失败

1. **检查 MySQL 服务：**
   - 确保 MySQL 服务正在运行
   - 检查数据库密码是否正确

2. **检查环境配置：**
   - 确认 `backend/.env` 文件存在
   - 验证数据库连接信息

3. **检查依赖：**
   ```bash
   cd backend
   npm install
   ```

### 前端无法访问

1. **检查端口占用：**
   - 确保 8000 端口未被占用
   - 可以修改端口：`python -m http.server 8080`

2. **检查 Python：**
   - 确保 Python 已正确安装
   - 检查 Python 版本：`python --version`

### 数据库连接问题

1. **重置数据库：**
   ```bash
   setup-database.bat
   ```

2. **手动创建数据库：**
   ```sql
   CREATE DATABASE flavor_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
   ```

## 📝 开发说明

### 添加新的风味数据

1. 在数据库中插入风味基本信息
2. 添加对应的 SQL 字段信息
3. 添加风味属性数据
4. 上传风味图片到 `frontend/images/` 目录

### 修改样式

- 主要样式文件：`frontend/css/`
- 使用现代 CSS 特性：CSS Grid、Flexbox、渐变等
- 支持响应式设计

### API 接口

- `GET /api/flavors/:type` - 获取指定风味的所有信息
- `GET /api/health` - 健康检查

## 🎨 设计特色

- **现代暗色主题**：优雅的深色背景配合灰白色渐变
- **响应式设计**：适配各种屏幕尺寸
- **玻璃拟态效果**：现代化的 UI 设计
- **流畅动画**：平滑的过渡和悬停效果
- **优雅排版**：使用 Inter 字体，提升可读性

## 📄 许可证

本项目采用 ISC 许可证。

## 🤝 贡献

欢迎提交 Issue 和 Pull Request！
发邮件至 hnyjt7@nottingham.edu.cn

---

**注意**：首次使用请先运行 `setup-database.bat` 设置数据库，然后使用 `quick-start.bat` 启动系统。 