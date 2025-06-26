
-- Step 1: Create database
CREATE DATABASE IF NOT EXISTS flavor_codex;
USE flavor_codex;

-- Step 2: Create main flavor table
CREATE TABLE IF NOT EXISTS flavors (
  id INT AUTO_INCREMENT PRIMARY KEY,
  type VARCHAR(50) NOT NULL UNIQUE,
  name_en VARCHAR(100),
  name_cn VARCHAR(100),
  description TEXT,
  image_url VARCHAR(255),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Step 3: Insert base flavor records
INSERT INTO flavors (type, name_en, name_cn, description, image_url) VALUES
('loquat', 'Loquat', '枇杷', 'Loquat is a species of flowering plant in the family Rosaceae, native to south-central China.', '/images/loquat.jpg'),
('peach', 'Peach', '水密桃', 'The peach is a deciduous tree native to the region of Northwest China.', '/images/peach.jpg'),
('waxberry', 'Waxberry', '杨梅', 'Waxberry is a subtropical tree grown for its sweet edible fruit.', '/images/waxberry.jpg');

-- Step 4: Create SQL field definitions
CREATE TABLE IF NOT EXISTS flavor_sql_fields (
  id INT AUTO_INCREMENT PRIMARY KEY,
  flavor_type VARCHAR(50),
  field_name VARCHAR(100),
  field_type VARCHAR(100),
  description TEXT
);

-- Step 5: Insert default field structure for all flavors
INSERT INTO flavor_sql_fields (flavor_type, field_name, field_type, description) VALUES
-- Loquat
('loquat', 'id', 'INT', '数据库编号'),
('loquat', 'name', 'VARCHAR(100)', '枇杷的标准英文名：Loquat（Eriobotrya japonica）'),
('loquat', 'category', 'VARCHAR(50)', '枇杷属于果香型（fruity）分类，具有甜果、核果与轻微花香特征'),
('loquat', 'description', 'TEXT', '枇杷具有甜润果肉风味，带有杏仁样芳香，常被描述为融合了桃子、芒果和柑橘的复合香气。'),
('loquat', 'created_at', 'TIMESTAMP', '该风味记录添加至数据库的时间戳'),

-- Peach
('peach', 'id', 'INT', '数据库编号'),
('peach', 'name', 'VARCHAR(100)', '水蜜桃的标准英文名：Peach（Prunus persica）'),
('peach', 'category', 'VARCHAR(50)', '水蜜桃属于“果香型（stone fruit）”风味分类'),
('peach', 'description', 'TEXT', '水蜜桃风味以柔和的甜香为主，包含草本气息、花香与轻微的青皮味，表现为熟成和多汁感官体验。'),
('peach', 'created_at', 'TIMESTAMP', '该风味记录添加至数据库的时间戳'),

-- Waxberry
('waxberry', 'id', 'INT', '数据库编号'),
('waxberry', 'name', 'VARCHAR(100)', '杨梅的标准英文名：Waxberry（Myrica rubra）'),
('waxberry', 'category', 'VARCHAR(50)', '杨梅属于“高酸果实型”风味分类'),
('waxberry', 'description', 'TEXT', '杨梅风味具强烈酸甜对比，带有黑莓、发酵香和矿物感，整体感官体验厚重而刺激。'),
('waxberry', 'created_at', 'TIMESTAMP', '该风味记录被首次收录的时间');

-- Step 6: Flavor attribute table
CREATE TABLE IF NOT EXISTS flavor_properties (
  id INT AUTO_INCREMENT PRIMARY KEY,
  flavor_type VARCHAR(50),
  property_name VARCHAR(100),
  property_value VARCHAR(100)
);

-- Step 7: Insert flavor sensory attributes
INSERT INTO flavor_properties (flavor_type, property_name, property_value) VALUES
-- Loquat
('loquat', 'Sweet', '85%'),
('loquat', 'Sour', '15%'),
('loquat', 'Aroma', 'Medium'),
('loquat', 'Texture', 'Soft'),
-- Peach
('peach', 'Sweet', '90%'),
('peach', 'Sour', '10%'),
('peach', 'Aroma', 'Strong'),
('peach', 'Texture', 'Juicy'),
-- Waxberry
('waxberry', 'Sweet', '70%'),
('waxberry', 'Sour', '30%'),
('waxberry', 'Aroma', 'Medium'),
('waxberry', 'Texture', 'Firm');
