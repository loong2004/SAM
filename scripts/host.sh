# 加载设置
. /data/adb/modules/SAM/setting.conf
# 加载配置
. /data/adb/modules/SAM/scripts/config.sh

# 获取 GitHub520 
get_GitHub520(){    
    log "下载 GitHub520 host"
    
    # 获取 GitHub520 host 并排除注释
    github_host=$(curl -s https://raw.hellogithub.com/hosts | grep -v "#")
    
    # 保存文件
    host_file="$MODULE_PATH/tmp/GitHub520_host"
    echo "$github_host" > $host_file
    
    # 检查文件不存在并且内容为空则退出
    if [ ! -e $host_file ] && [ ! $github_host ]; then
        log "下载失败，取消使用"
        return
    fi
    
    log "下载成功"
    
    # GitHub520 内容
    host_content="# GitHub 加速\n"
    
    log "读取 GitHub520 host"
    
    # 循环读取每一行
    while read line
    do
        rule=(${line// / })
        host_content+="${rule[0]} ${rule[1]}\n"
    done < $host_file
    
    log "读取成功"
    
    # 写入 hosts 文件  
    cat "$HOSTS_PATH" | grep -i -v "github" | sed '$a END' | sed -i "s/END/$host_content\n/" "$HOSTS_PATH"
    
    log "写入 hosts 文件"        
}

# 日志
log(){
    time=$(date "+%Y-%m-%d %H:%M:%S")
    echo $1
    echo "[$time]: $1" >> "$MODULE_PATH/tmp/host.log"
}

# 添加指令
case "$1" in
    # GitHub520
    gh)
        get_GitHub520
        ;;
    # 日志
    -l)
        log "$2"
        ;;
    *)
        echo "使用: gh(GitHub加速) | -l(日志)"
        exit 1
        ;;
esac