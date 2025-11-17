# 加载设置
. /data/adb/modules/SAM/setting.conf
# 加载配置
. /data/adb/modules/SAM/scripts/config.sh

# 日志
log(){
    time=$(date "+%Y-%m-%d %H:%M:%S")
    echo $1
    if [ $2 ]; then
        echo "[$time]: $1" > "$MODULE_PATH/tmp/module.log"
        return
    fi
    echo "[$time]: $1" >> "$MODULE_PATH/tmp/module.log"
}