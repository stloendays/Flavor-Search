// 文件路径：js/scripts.js

document.addEventListener('DOMContentLoaded', function () {
    var btnStart = document.querySelector('.btn-start');
    var searchLink = document.querySelector('a[href="#search"]');
  
    if (btnStart) {
      btnStart.addEventListener('click', function () {
        var compoundSection = document.getElementById('compound');
        if (compoundSection) {
          compoundSection.scrollIntoView({ behavior: 'smooth' });
        } else {
          console.log('Compound section not found.');
        }
      });
    }
  
    if (searchLink) {
      searchLink.addEventListener('click', function (e) {
        e.preventDefault();
        var keyword = prompt('Please enter a flavor or compound name to search:');
        if (keyword) {
          console.log('Searching for:', keyword);
          // 这里可以根据实际情况重定向到搜索结果页面，例如：
          // window.location.href = '/search.html?q=' + encodeURIComponent(keyword);
        }
      });
    }

    // 添加香气粒子效果
    function createScentParticles() {
        const containers = document.querySelectorAll('.scent-container');
        
        containers.forEach(container => {
            // 创建多个粒子
            for (let i = 0; i < 10; i++) {
                const particle = document.createElement('div');
                particle.className = 'scent-particle';
                particle.style.left = Math.random() * 100 + '%';
                particle.style.top = Math.random() * 100 + '%';
                container.appendChild(particle);
            }
        });
    }

    // 添加鼠标跟随效果
    function addMouseTracking() {
        const hiddenImages = document.querySelectorAll('.hidden-image');
        
        hiddenImages.forEach(image => {
            image.addEventListener('mousemove', (e) => {
                const rect = image.getBoundingClientRect();
                const x = ((e.clientX - rect.left) / rect.width) * 100;
                const y = ((e.clientY - rect.top) / rect.height) * 100;
                image.style.setProperty('--mouse-x', `${x}%`);
                image.style.setProperty('--mouse-y', `${y}%`);
            });
        });
    }

    // 初始化效果
    createScentParticles();
    addMouseTracking();
  });
  