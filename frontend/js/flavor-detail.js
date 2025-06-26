// 配置管理
const CONFIG = {
  API_BASE_URL: window.location.hostname === 'localhost' ? 'http://localhost:5000' : '',
  API_ENDPOINTS: {
    FLAVOR: '/api/flavors'
  }
};

// 1. 获取 flavor 类型参数
const urlParams = new URLSearchParams(window.location.search);
const flavorType = urlParams.get('type');

// 2. 显示/隐藏加载状态
function showLoading() {
  const overlay = document.getElementById('loadingOverlay');
  if (overlay) {
    overlay.style.display = 'flex';
  }
}

function hideLoading() {
  const overlay = document.getElementById('loadingOverlay');
  if (overlay) {
    overlay.style.display = 'none';
  }
}

function showError(message) {
  const overlay = document.getElementById('loadingOverlay');
  if (overlay) {
    overlay.innerHTML = `<div style='color:white;text-align:center;'>${message}</div>`;
  }
}

// 3. 检查参数并处理
function checkAndHandleParams() {
  if (!flavorType) {
    console.warn('缺少风味类型参数，重定向到风味列表页面');
    // 显示友好的提示信息
    const overlay = document.getElementById('loadingOverlay');
    if (overlay) {
      overlay.innerHTML = `
        <div style='color:white;text-align:center;'>
          <h3>缺少风味参数</h3>
          <p>正在跳转到风味列表页面...</p>
          <p style='font-size: 0.9em; margin-top: 10px;'>
            <a href='flavor.html' style='color: #fff; text-decoration: underline;'>点击这里立即跳转</a>
          </p>
        </div>
      `;
    }
    
    // 3秒后自动跳转
    setTimeout(() => {
      window.location.href = 'flavor.html';
    }, 3000);
    return false;
  }
  return true;
}

// 4. 异步获取后端 API 数据
async function updatePageContent() {
  // 首先检查参数
  if (!checkAndHandleParams()) {
    return;
  }

  showLoading();

  try {
    const response = await fetch(`${CONFIG.API_BASE_URL}${CONFIG.API_ENDPOINTS.FLAVOR}/${flavorType}`);
    
    if (!response.ok) {
      if (response.status === 404) {
        throw new Error('Flavor not found');
      } else {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
    }

    const flavor = await response.json();

    // 5. 更新页面内容
    document.title = `${flavor.nameEn} - Flavor Database`;
    
    // 更新图片
    const flavorImage = document.getElementById('flavorImage');
    if (flavorImage) {
      flavorImage.src = flavor.image;
      flavorImage.alt = `${flavor.nameEn} Image`;
    }

    // 更新名称
    const flavorNameEn = document.getElementById('flavorNameEn');
    const flavorNameCn = document.getElementById('flavorNameCn');
    if (flavorNameEn) flavorNameEn.textContent = flavor.nameEn;
    if (flavorNameCn) flavorNameCn.textContent = flavor.nameCn;

    // 更新描述
    const flavorDescription = document.getElementById('flavorDescription');
    if (flavorDescription) flavorDescription.textContent = flavor.description;

    // 更新 SQL 信息表格
    const sqlTableBody = document.getElementById('sqlTableBody');
    if (sqlTableBody && flavor.sqlInfo) {
      sqlTableBody.innerHTML = flavor.sqlInfo.map(info => `
        <tr>
          <td>${info.field}</td>
          <td>${info.type}</td>
          <td>${info.description}</td>
        </tr>
      `).join('');
    }

    // 更新风味数据网格
    const flavorDataGrid = document.getElementById('flavorDataGrid');
    if (flavorDataGrid && flavor.flavorData) {
      flavorDataGrid.innerHTML = flavor.flavorData.map(data => `
        <div class="data-item">
          <h3>${data.name}</h3>
          <p>${data.value}</p>
        </div>
      `).join('');
    }

    hideLoading();

  } catch (err) {
    console.error('加载风味数据失败:', err);
    
    // 根据错误类型显示不同的错误信息
    let errorMessage = '加载失败，请返回上一页重试。';
    if (err.message === 'Flavor not found') {
      errorMessage = '未找到该风味信息，请检查风味类型是否正确。';
    }
    
    showError(errorMessage);
    
    // 3秒后自动返回
    setTimeout(() => {
      window.location.href = 'flavor.html';
    }, 3000);
  }
}

// 6. 页面加载完成后执行
document.addEventListener('DOMContentLoaded', updatePageContent);
