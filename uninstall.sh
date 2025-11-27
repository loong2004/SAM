# 模块路径
MODULE_PATH="/data/adb/modules/SAM"
# Mihomo 路径
MIHOMO_PATH="$MODULE_PATH/etc/mihomo"
# Mihomo 配置
MIHOMO_CONF="$MIHOMO_PATH/config.yaml"

# 获取备份设置
BACKUP_CONF=$(cat "$MODULE_PATH/setting.conf" | grep "BACKUP_CONF=" | awk -F'=' '{print $2}')

# 判断已启用备份并且配置文件存在
if [ $BACKUP_CONF = true ]; then
    # 复制配置文件到sd根目录
    cp -f "$MIHOMO_CONF" "/storage/emulated/0/Mihomo配置.yaml"
fi

[ -d "$MODULE_PATH" ] && rm -rf "$MODULE_PATH"