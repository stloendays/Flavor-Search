# Flavor Database - 使用说明

## 🚀 快速启动指南

### 首次使用（推荐步骤）

1. **安装必要软件**
   - [Node.js](https://nodejs.org/) (v14+)
   - [Python](https://www.python.org/) (v3.7+)
   - [MySQL](https://dev.mysql.com/downloads/mysql/) 或 [XAMPP](https://www.apachefriends.org/)

2. **设置数据库**
   ```bash
   # 双击运行
   setup-database.bat
   ```

3. **启动系统**
   ```bash
   # 双击运行
   simple-start.bat
   ```

### 日常使用

- **启动系统**: `simple-start.bat`
- **停止系统**: `stop.bat`
- **检查状态**: `check-db.bat`

## 🔧 故障排除

### 问题1: 后端连接失败

**症状**: 前端可以访问，但风味详情页面显示错误

**解决方案**:
1. 确保 MySQL 服务正在运行
2. 运行 `check-db.bat` 检查数据库连接
3. 如果数据库连接失败，运行 `setup-database.bat`

### 问题2: 端口被占用

**症状**: 启动时显示端口错误

**解决方案**:
1. 运行 `stop.bat` 停止所有服务
2. 重新运行 `simple-start.bat`

### 问题3: 依赖安装失败

**症状**: npm install 失败

**解决方案**:
1. 检查网络连接
2. 清除 npm 缓存: `npm cache clean --force`
3. 重新安装: `cd backend && npm install`

### 问题4: 数据库密码错误

**症状**: 数据库连接失败

**解决方案**:
1. 编辑 `backend/.env` 文件
2. 修改 `DB_PASSWORD=你的实际密码`
3. 重新启动系统

## 📋 配置文件说明

### backend/.env
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

### 修改数据库密码
1. 打开 `backend/.env` 文件
2. 修改 `DB_PASSWORD=你的密码`
3. 保存文件
4. 重新启动系统

## 🌐 访问地址

启动成功后访问:

- **主页**: http://localhost:8000
- **风味列表**: http://localhost:8000/flavor.html
- **风味详情**: http://localhost:8000/flavor-detail.html?type=loquat
- **化合物页面**: http://localhost:8000/compound.html
- **搜索页面**: http://localhost:8000/search.html
- **关于页面**: http://localhost:8000/about.html

## 🔍 健康检查

检查后端状态:
```
http://localhost:5000/api/health
```

## 📝 常见问题

### Q: 为什么风味详情页面显示"缺少风味参数"？
A: 必须通过风味列表页面点击进入，不能直接访问。正确的访问方式是：
1. 访问 http://localhost:8000/flavor.html
2. 点击具体风味卡片

### Q: 如何添加新的风味数据？
A: 
1. 在 MySQL 中插入数据到 `flavors` 表
2. 添加对应的 SQL 字段到 `flavor_sql_fields` 表
3. 添加属性数据到 `flavor_properties` 表
4. 上传图片到 `frontend/images/` 目录

### Q: 如何修改界面样式？
A: 编辑 `frontend/css/` 目录下的 CSS 文件

### Q: 如何修改后端API？
A: 编辑 `backend/app.js` 文件

## 🛠️ 开发模式

### 启动开发服务器
```bash
# 后端开发模式（自动重启）
cd backend
npm run dev

# 前端开发模式
cd frontend
python -m http.server 8000
```

### 查看日志
- 后端日志: 查看后端命令行窗口
- 前端日志: 浏览器开发者工具 Console

## 📞 技术支持

如果遇到问题：
1. 运行 `check-db.bat` 检查系统状态
2. 查看错误日志
3. 参考故障排除部分
4. 检查配置文件是否正确

---

**提示**: 首次使用建议按照"快速启动指南"的步骤操作。 