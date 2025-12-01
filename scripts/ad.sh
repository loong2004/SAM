# 加载基础脚本
. /data/adb/modules/SAM/scripts/base.sh

# 广告路径数组
ad_path=(
# 美团外卖
"/data/data/com.sankuai.meituan.takeoutnew/files/cips/common/waimai/assets/ad"
"/data/media/0/Android/data/com.sankuai.meituan.takeoutnew/files/cips/common/waimai/assets/promotion"
    
# 知乎
"/data/data/com.zhihu.android/files/ad"
    
# 哔哩哔哩
"/data/data/tv.danmaku.bili/files/res_cache"
"/data/data/tv.danmaku.bili/files/update"
"/data/data/tv.danmaku.bili/app_mod_resource"
"/data/data/com.bilibili.app.in/app_mod_resource"
"/data/media/0/Android/data/tv.danmaku.bili/cache/default/journal"
"/data/data/tv.danmaku.bili/files/splash2"
    
# 中国广电
"/data/data/com.ai.obc.cbn.app/files/splashShow"
    
# 酷我音乐
"/data/media/0/Android/data/cn.kuwo.player/files/KuwoMusic/.screenad"
"/data/data/cn.kuwo.player/app_adnet"
"/data/media/0/Android/data/cn.kuwo.player/files/KuwoMusic/.ad"
    
# 网易云音乐
"/data/media/0/Android/data/com.netease.cloudmusic/cache/Ad"
"/data/data/com.netease.cloudmusic/cache/MusicWebApp"
"/data/media/0/netease/adcache"
"/data/media/0/netease/cloudmusic/Ad"  
    
# 大麦
"/data/data/cn.damai/files/ad_dir"
    
# 顺丰速递
"/data/data/com.sf.activity/files/openScreenADsImg"
    
# 丰云行
"/data/media/0/Android/data/com.yongyou/files/Pictures"
    
# 猫耳FM
"/data/data/cn.missevan/cache/splash"
    
# 小米有品
"/data/data/com.xiaomi.youpin/shared_prefs/ad_prf.xml"
    
# 小爱音箱
"/data/media/0/Android/data/com.xiaomi.mico/files/log/VoipSdk"
"/data/media/0/Android/data/com.xiaomi.mico/files/data_cache/journal"
    
# 高德地图
"/data/data/com.autonavi.minimap/files/LaunchDynamicResource"
"/data/media/0/Android/data/com.autonavi.minimap/cache/ajxFileDownload"
"/data/media/0/Android/data/com.autonavi.minimap/files/autonavi/cloud_image/journal"
"/data/media/0/autonavi/afpSplash"
"/data/media/0/autonavi/splash"
"/data/user/0/com.autonavi.minimap/files/splash"
    
# 抖音
"/data/data/com.ss.android.ugc.aweme/files/im_common_resource/common_resource/scene_strategy/incentive_chat_group_panel_alpha_video_festival"
"/data/media/0/Android/data/com.ss.android.ugc.aweme/awemeSplashCache"
"/data/media/0/Android/data/com.ss.android.ugc.aweme/liveSplashCache"
"/data/media/0/Android/data/com.ss.android.ugc.aweme/splashCache"
    
# 腾讯QQ
"/data/media/0/Android/data/com.tencent.mobileqq/files/vas_ad"
"/data/media/0/Tencent/MobileQQ/splahAD"
"/data/media/0/Android/data/com.tencent.mobileqq/MobileQQ/splahAD"
"/data/media/0/Android/data/com.tencent.mobileqq/Tencent/MobileQQ/vasSplashAD"

# 腾讯微视
"/data/media/0/Android/data/com.tencent.weishi/splash_cache"

# QQ浏览器
"/data/user/0/com.tencent.mtt/files/tad_cache"

# QQ音乐
"/data/user/0/com.tencent.qqmusic/app_adnet"
"/data/user/0/com.tencent.qqmusic/files/tad_cache"
"/data/media/0/qqmusic/splash"
    
# 安居客
"/data/data/com.anjuke.android.app/cache/splash_ad"
    
# 买单吧
"/data/data/com.bankcomm.maidanba/files/imageCachePath"
"/data/data/com.bankcomm.maidanba/files/tabAdsPath"
    
# 中国移动
"/data/data/com.greenpoint.android.mc10086.activity/shared_prefs/default.xml"
"/data/user/0/com.greenpoint.android.mc10086.activity/cache/image_manager_disk_cache"

# 移动云盘
"/data/media/0/Android/data/com.chinamobile.mcloud/files/boot_logo"
    
# YY 
"/data/data/com.duowan.mobile/shared_prefs/CommonPref.xml"
    
# 米家
"/data/data/com.xiaomi.smarthome/files/sh_ads_file/"
    
# 米游社
"/data/media/0/Android/data/com.mihoyo.hyperion/cache/splash/"
    
# 小米社区
"/data/data/com.xiaomi.vipaccount/files/mmkv/mmkv.default"
    
# 天翼云盘
"/data/data/com.cn21.ecloud/files/ecloud_current_screenad.obj"

# 豆瓣
"/data/user/0/com.douban.frodo/cache/douban_ad"

# 驾考宝典
"/data/user/0/com.handsgo.jiakao.android/cache/GDTDOWNLOAD"
"/data/media/0/Android/data/com.handsgo.jiakao.android/cache/reward_video_cache_*"
"/data/media/0/Android/data/com.handsgo.jiakao.android/cache/splash_ad_cache"

# 百度地图
"/data/user/0/com.baidu.BaiduMap/files/AdvertData"

# 百度网盘
"/data/user/0/com.baidu.netdisk/files/default_ad_caches"
"/data/user/0/com.baidu.netdisk/cache/wind"
"/data/user/0/com.baidu.netdisk/files/imgCache"
"/data/user/0/com.baidu.netdisk/files/splash_res_caches"
"/data/user/0/com.baidu.netdisk/files/video_front_ad_caches"
"/data/user/0/com.baidu.netdisk/files/splash"

# 人人影视PRO
"/data/user/0/com.yyets.pro/app_ad"

# 酷安
"/data/media/0/Android/data/com.coolapk.market/cachett_ad"
"/data/media/0/Android/data/com.coolapk.market/cache/splash_image"
"/data/media/0/Android/data/com.coolapk.market/cache/com_qq_e_download"
"/data/media/0/Android/data/com.coolapk.market/cache/pangle_com.byted.pangle"
"/data/media/0/Android/data/com.coolapk.market/cache/tt_tmpl_pkg"
"/data/media/0/Android/data/com.coolapk.market/files/TTCache"
"/data/media/0/Android/data/com.coolapk.market/cache/com.jd.jdsdk"

# keep
"/data/media/0/Android/data/com.gotokeep.keep/files/keep/ads"

# 今日头条
"/data/media/0/Android/data/com.ss.android.article.news/splashCache"

# 酷狗音乐
"/data/media/0/kugou/.splash"
"/data/media/0/Android/data/com.kugou.android/files/kugou/.splash"

# 微博
"/data/media/0/sina/weibo/.weibo_ad_universal_cache"
"/data/media/0/sina/weibo/.weibo_refreshad_cache"
"/data/media/0/sina/weibo/.weibo_video_cache_new"
"/data/media/0/sina/weibo/.weiboadcache"
"/data/media/0/sina/weibo/storage/biz_keep/.weibo_ad_universal_cache"
"/data/media/0/sina/weibo/storage/biz_keep/.weibo_refreshad_cache"

# 淘宝
"/data/media/0/Android/data/com.taobao.taobao/files/acds"
"/data/user/0/com.taobao.taobao/files/bootimageresources"

# 咪咕的各类应用
"/data/media/0/Mob"

# MIUI
"/data/media/0/miad"
"/data/media/0/Android/data/com.miui.systemAdSolution/files/miad"

# 有道词典
"/data/media/0/Android/data/com.youdao.dict/files/yd_sdk_path"

# 邮箱大师
"/data/user/0/com.netease.mail/cache/adcache1"
"/data/user/0/com.netease.mail/cache/adcache"

# 美团
"/data/user/0/com.sankuai.meituan/files/cips/common/mtplatform_group/assets/startup"

# 饿了么
"/data/user/0/me.ele/cache/splash"
"/data/user/0/me.ele/files/o2o_ad"

# 飞猪旅行
"/data/user/0/com.taobao.trip/files/fliggy_splash"

# 携程旅行
"/data/media/0/Android/data/ctrip.android.view/cache/CTADCache"

# 汽水音乐
"/data/media/0/com.luna.music/cache/image_commercial_cache"
"/data/media/0/com.luna.music/cache/pangle_com.byted.pangle"
"/data/media/0/com.luna.music/files/splashCache"
)

# 广告屏蔽
block_ad(){
    # 获取路径属性为 i(不可改变) ，则返回
    lsattr "$1" 2>&1 | grep -q "i.*$1" && return
    # 判断路径是否为目录
    if [ -d "$1" ]; then
        # 重置为空目录
        rm -rf "$1" >/dev/null 2>&1
        mkdir -p "$1"
        # 锁定
        chattr +i "$1"
    # 判断路径是否为普通文件
    elif [ -f "$1" ]; then
        # 重置为空文件
        > "$1"
        # 锁定
        chattr +i "$1"
    fi
}

# 广告恢复
recovery_ad(){    
    # 获取路径属性
    value=$(lsattr "$1" | grep "i.*$1")
    # 判断已锁定，则执行
    if [ "$value" ]; then
        # 解锁
        chattr -i "$1"
        # 删除
        rm -rf "$1"
    fi    
}

# 运行
run(){     
    # 循环打印广告数组
    for ad in ${ad_path[@]}
    do
        # 判断广告路径存在
        if [ -e "$ad" ]; then
            $1 "$ad"
        fi
    done
}

# 添加指令
case "$1" in
    block)
        log "屏蔽 App 广告文件"
        run "block_ad"
        ;;
    recovery) 
        log "恢复 App 广告文件" 
        run "recovery_ad"    
        ;;
    *)
        echo "使用: block(屏蔽) | recovery(恢复)"
        exit 1
        ;;
esac