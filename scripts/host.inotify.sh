# 模块路径
MODULE_PATH="/data/adb/modules/SAM"
# 脚本路径
SCRIPTS_PATH="$MODULE_PATH/scripts"

# 模块 hosts 文件路径
HOSTS_FILE="$MODULE_PATH/etc/hosts"
# 系统 hosts 文件路径
SYSTEM_HOSTS="/system/etc/hosts"

EVENT=$1
MONITOR_DIR=$2
MONITOR_FILE=$3

if [ "$EVENT" = "w" ]; then
    $SCRIPTS_PATH/host.sh -l "检测到 hosts 文件发生改变"
    $SCRIPTS_PATH/host.sh -l "重新挂载 hosts 文件"
        
    # 获取挂载状态
    mount_status=$(mount | grep -i "$SYSTEM_HOSTS")
    # 判断正在挂载则取消挂载
    if [ "$mount_status" ]; then
        umount $SYSTEM_HOSTS
    fi
    sleep 1
    # 挂载 hosts 文件
    mount -o bind "$HOSTS_FILE" "$SYSTEM_HOSTS"
    $SCRIPTS_PATH/host.sh -l "重新挂载成功"
fi