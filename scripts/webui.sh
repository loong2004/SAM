# 加载基础脚本
. /data/adb/modules/SAM/scripts/base.sh

# 获取状态
get_status(){
    state_number=$(pidof $1)
    if [ $state_number ]; then
        echo "已运行"
    else
        echo "未运行"
    fi
}

# 获取进程数量
get_process_number(){
    pid=($(pgrep -f 'SAM'))
    echo ${#pid[@]}
}

# 添加指令
case "$1" in
    status)
        get_status $2
        ;;
    process)
        get_process_number
        ;;
    *)
        echo "使用: status(状态) | process(进程)"
        exit 1
        ;;
esac