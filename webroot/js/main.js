import { fullScreen, exec, toast } from './kernelsu.js'

// 显示提示消息
function showToast(text, type) {
    const toast = document.getElementById('toast');
    toast.textContent = text;
    toast.className = `toast ${type}`;
    toast.style.display = 'block';
    setTimeout(() => toast.style.display = 'none', 3000);
}

// 获取服务状态
function getServiceStatus(id, status) {
    const control = document.getElementById(id);    
    control.innerHTML = status;
    var style = "";
    if ( status == "已运行" ) {
        style = "running";
    } else {
        style = "stopped";
    }
    control.className = "status " + style;
}

// 更新服务状态
async function updateServiceStatus() {    
    // SmartDNS 状态
    const smartdns_status = await exec('/data/adb/modules/SAM/scripts/webui.sh status smartdns');
    getServiceStatus("smartdns-status",smartdns_status.stdout);
        
    // AdGuardHome 状态
    const agh_status = await exec('/data/adb/modules/SAM/scripts/webui.sh status AdGuardHome');
    getServiceStatus("agh-status",agh_status.stdout);
           
    // Mihomo 状态
    const mihomo_status = await exec('/data/adb/modules/SAM/scripts/webui.sh status mihomo');
    getServiceStatus("mihomo-status",mihomo_status.stdout);
}

// 执行结果通知
async function executeResultToast(action) {
    const process = await exec('/data/adb/modules/SAM/scripts/webui.sh process');
    var status = "";
    if ( action == "start" || action == "restart" ){
        status = process.stdout >= 3 ? "成功" : "失败";
        showToast( action === "start" ? "启动" + status : "重启" + status ,status === "成功" ? "success" : "error");
    } else {        
        status = process.stdout <= 3 ? "成功" : "失败";
        showToast("停止" + status ,status === "成功" ? "success" : "error");
    }
}

(async () => {
    // 全屏    
    fullScreen(true);
    
    // 更新服务状态
    updateServiceStatus();
    
    // 启动点击事件
    document.getElementById("start").addEventListener("click", function() {
        toast(`正在启动，请稍等......`);
        exec('su -c "/data/adb/modules/SAM/scripts/service.sh start"')
        updateServiceStatus();
        executeResultToast("start")
    });
        
    // 停止点击事件
    document.getElementById("stop").addEventListener("click", function() {
        toast(`正在停止，请稍等......`);
        exec('su -c "/data/adb/modules/SAM/scripts/service.sh stop"')
        updateServiceStatus();
        executeResultToast("stop")
    }); 
    
    // 重启点击事件
    document.getElementById("restart").addEventListener("click", function() {
        toast(`正在重启，请稍等......`);
        exec('su -c "/data/adb/modules/SAM/scripts/service.sh restart"')
        updateServiceStatus();
        executeResultToast("restart")
    });
    
})().catch((err) => 'null')