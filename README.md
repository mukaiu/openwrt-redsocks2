RedSocks2 for OpenWrt
===

简介
---

 本项目是 [RedSocks2][1] 在 OpenWrt 上的移植  
 当前版本: 0.67  

编译
---

 - 从 OpenWrt 的 [SDK][S] 编译  

   ```bash
   # 以 ar71xx 平台为例
   tar xjf OpenWrt-SDK-ar71xx-for-linux-x86_64-gcc-4.8-linaro_uClibc-0.9.33.2.tar.bz2
   cd OpenWrt-SDK-ar71xx-*
   # 获取 Makefile
   git clone https://github.com/mukaiu/openwrt-redsocks2.git package/redsocks2
   # 选择要编译的包 Network -> redsocks2
   make menuconfig
   # 开始编译
   make V=99
   # 19.07 使用 make DISABLE_SHADOWSOCKS=true V=99
   ```
