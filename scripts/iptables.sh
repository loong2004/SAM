# 加载基础脚本
. /data/adb/modules/SAM/scripts/base.sh

iptables_w="iptables -w"
ip6tables_w="ip6tables -w"

# AdGuardHome 链
agh_chain="ADGUARD_REDIRECT_DNS"
agh_chain_v6="ADGUARD_BLOCK_DNS"

# 启用 AdGuardHome iptables
agh_enable_iptables() {
    # 判断存在则退出
    if $iptables_w 64 -t nat -L $agh_chain >/dev/null 2>&1; then
        log "$agh_chain 链已经存在"
        return
    fi
    log "创建 $agh_chain 链并添加规则"    
    $iptables_w 64 -t nat -N $agh_chain    
    $iptables_w 64 -t nat -A $agh_chain -m owner --uid-owner $AGH_USER --gid-owner $AGH_GROUP -j RETURN
    $iptables_w 64 -t nat -A $agh_chain -p udp --dport 53 -j REDIRECT --to-ports $AGH_DNS_PORT
    $iptables_w 64 -t nat -A $agh_chain -p tcp --dport 53 -j REDIRECT --to-ports $AGH_DNS_PORT
    $iptables_w 64 -t nat -I OUTPUT -j $agh_chain
}

# 启用阻断 ipv6 的 DNS 请求
agh_enable_ip6tables(){
    # 判断存在则退出
    if $ip6tables_w 64 -t filter -L $agh_chain_v6 >/dev/null 2>&1; then
        log "$agh_chain_v6 链已经存在"
        return
    fi
    log "创建 $agh_chain_v6 链并添加规则"
    $ip6tables_w 64 -t filter -N $agh_chain_v6
    $ip6tables_w 64 -t filter -A $agh_chain_v6 -p udp --dport 53 -j DROP
    $ip6tables_w 64 -t filter -A $agh_chain_v6 -p tcp --dport 53 -j DROP
    $ip6tables_w 64 -t filter -I OUTPUT -j $agh_chain_v6
}

# 禁用 AdGuardHome iptables
agh_disable_iptables() {
    # 判断不存在则退出
    if ! $iptables_w 64 -t nat -L $agh_chain >/dev/null 2>&1; then
        log "$agh_chain 链不存在"
        return 0
    fi
    log "删除 $agh_chain 链及规则"
    $iptables_w 64 -t nat -D OUTPUT -j $agh_chain
    $iptables_w 64 -t nat -F $agh_chain
    $iptables_w 64 -t nat -X $agh_chain
}

# 禁用阻断 ipv6 的 DNS 请求
agh_disable_ip6tables(){
    if ! $ip6tables_w 64 -t filter -L $agh_chain_v6 >/dev/null 2>&1; then
        log "$agh_chain_v6 链不存在"
    return
    fi
    log "删除 $agh_chain_v6 链及规则"
    $ip6tables_w 64 -t filter -F $agh_chain_v6
    $ip6tables_w 64 -t filter -D OUTPUT -j $agh_chain_v6
    $ip6tables_w 64 -t filter -X $agh_chain_v6
}

# Mihomo iptables
mihomo_iptables(){    
    $iptables_w 100 $1 FORWARD -o $TUN_DEVICE -j ACCEPT
    $iptables_w 100 $1 FORWARD -i $TUN_DEVICE -j ACCEPT
    $ip6tables_w 100 $1 FORWARD -o $TUN_DEVICE -j ACCEPT
    $ip6tables_w 100 $1 FORWARD -i $TUN_DEVICE -j ACCEPT
}

# 添加指令
case "$1" in
    # 启用
    -e)
        case "$2" in
            # AdGuardHome
            agh)
                agh_enable_iptables
                [ "$BLOCK_IPV6_DNS" = true ] && agh_enable_ip6tables || exit 1
                ;;
            # Mihomo
            mihomo)
                log "添加 Mihomo iptables 规则"
                mihomo_iptables "-I"
                ;;
            *)
                echo "使用: -e ( agh | mihomo )"
                exit 1
                ;;
        esac
        ;;
    # 禁用
    -d)
        case "$2" in
            # AdGuardHome
            agh)
                agh_disable_iptables
                agh_disable_ip6tables
                ;;
            # Mihomo
            mihomo)
                log "删除 Mihomo iptables 规则"
                mihomo_iptables "-D"
                ;;
            *)
                echo "使用: -d ( agh | mihomo )"
                exit 1
                ;;
        esac
        ;;
    *)
        echo "使用: -e(启用) | -d(禁用)"
        exit 1
        ;;
esac