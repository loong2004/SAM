import { fullScreen, exec, toast } from './kernelsu.js'

// 全屏    
fullScreen(true);

 // DOM加载完成后初始化
document.addEventListener('DOMContentLoaded', () => {
    // 绑定按钮事件
    document.getElementById('start').addEventListener('click', () => controlServices('start'));
    document.getElementById('stop').addEventListener('click', () => controlServices('stop'));
    document.getElementById('restart').addEventListener('click', () => controlServices('restart'));
 });

 // 控制服务
function controlServices(action) {
    const msg = action === 'start' ? '启动' : action === 'stop' ? '停止' : '重启';
    toast(`正在${msg}，请稍等......`);
    exec(`/data/adb/modules/SAM/scripts/service.sh ${action}`);
    showToast(`${msg}成功`,'success');
    setTimeout("location.reload()",1000);
}

// 显示提示消息
function showToast(text, type) {
    const toast = document.getElementById('toast');
    toast.textContent = text;
    toast.className = `toast ${type}`;
    toast.style.display = 'block';
    setTimeout(() => toast.style.display = 'none', 3000);
}