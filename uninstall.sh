# 模块路径
MODULE_PATH="/data/adb/modules/SAM"
# Mihomo 路径
MIHOMO_PATH="$MODULE_PATH/etc/mihomo"
# Mihomo 配置
MIHOMO_CONF="$MIHOMO_PATH/config.yaml"

# 加载配置
. /data/adb/modules/SAM/setting.conf

# 判断已启用备份并且配置文件存在
if [ -e $MIHOMO_CONF ] && [ $BACKUP_CONF = true ]; then
    # 复制配置文件到sd根目录
    cp "$MIHOMO_CONF" "/storage/emulated/0/Mihomo配置.yaml"
fi

[ -d "$MODULE_PATH" ] && rm -rf "$MODULE_PATH"