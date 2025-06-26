const express = require('express');     // 引入 Express 框架，用于创建服务器
const cors = require('cors');           // 引入 CORS 中间件，解决跨域请求问题
const mysql = require('mysql2');        // 引入 mysql2 库，用于连接并操作 MySQL 数据库
const dotenv = require('dotenv');       // 引入 dotenv，用于读取 .env 文件中的配置
const path = require('path');           // Node.js 自带模块，用于路径拼接

dotenv.config();   // 加载 .env 文件中的环境变量


const app = express();                        // 创建 Express 应用实例
const PORT = process.env.PORT || 5000;        // 读取端口号（优先从环境变量中读取）


app.use(cors());  // 允许前端跨域访问接口
app.use(express.json());  // 自动解析 JSON 请求体（如 POST 请求中带的数据）

// 静态文件服务：把 /images 映射到实际图片目录（前端图片）
app.use('/images', express.static(path.join(__dirname, '../frontend/images')));


// 连接 MySQL 数据库
const db = mysql.createConnection({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
});

db.connect((err) => {
  if (err) {
    console.error('数据库连接失败:', err);
    process.exit(1);
  } else {
    console.log('✅ 成功连接 MySQL 数据库');
  }
});

// 全局错误处理中间件
app.use((err, req, res, next) => {
  console.error('服务器错误:', err);
  res.status(500).json({ error: '服务器内部错误' });
});

// API: 获取指定风味的所有信息（基本 + SQL 字段 + 属性）
app.get('/api/flavors/:type', (req, res) => {
  const flavorType = req.params.type; //定义一个 GET 请求的路由
  
  // 参数验证
  if (!flavorType || typeof flavorType !== 'string') {
    return res.status(400).json({ error: '无效的风味类型参数' });
  }

  // 查询基本信息
  const baseQuery = 'SELECT * FROM flavors WHERE type = ?';
  const sqlQuery = 'SELECT field_name, field_type, description FROM flavor_sql_fields WHERE flavor_type = ?';
  const propQuery = 'SELECT property_name, property_value FROM flavor_properties WHERE flavor_type = ?';

  db.query(baseQuery, [flavorType], (err, baseResults) => {
    if (err) {
      console.error('数据库查询错误:', err);
      return res.status(500).json({ error: '数据库查询失败' });
    }
    
    if (baseResults.length === 0) {
      return res.status(404).json({ error: 'Flavor not found' });
    }

    const flavor = baseResults[0];

    db.query(sqlQuery, [flavorType], (err, sqlResults) => {
      if (err) {
        console.error('SQL字段查询错误:', err);
        return res.status(500).json({ error: 'SQL Info load failed' });
      }

      db.query(propQuery, [flavorType], (err, propResults) => {
        if (err) {
          console.error('属性查询错误:', err);
          return res.status(500).json({ error: 'Property data load failed' });
        }

        // 组装数据结构
        res.json({
          nameEn: flavor.name_en,
          nameCn: flavor.name_cn,
          description: flavor.description,
          image: flavor.image_url,
          sqlInfo: sqlResults.map(row => ({
            field: row.field_name,
            type: row.field_type,
            description: row.description
          })),
          flavorData: propResults.map(row => ({
            name: row.property_name,
            value: row.property_value
          }))
        });
      });
    });
  });
});

// 健康检查接口
app.get('/api/health', (req, res) => {
  res.json({ status: 'ok', timestamp: new Date().toISOString() });
});

app.listen(PORT, () => {
  console.log(`🚀 Server running at http://localhost:${PORT}`);
});
