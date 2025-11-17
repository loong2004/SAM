# 模块路径
MODULE_PATH="/data/adb/modules/SAM"
# 脚本路径
SCRIPTS_PATH="$MODULE_PATH/scripts"

EVENT=$1
MONITOR_DIR=$2
MONITOR_FILE=$3

# 判断模块是否启用
if [ "${MONITOR_FILE}" = "disable" ] || [ "${MONITOR_FILE}" = "stop" ]; then
    if [ "${EVENT}" = "d" ]; then
        $SCRIPTS_PATH/service.sh start
    elif [ "${EVENT}" = "n" ]; then        
        $SCRIPTS_PATH/service.sh stop
    fi
fi