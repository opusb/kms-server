# kms-server
[![Docker](https://github.com/HMBSbige/kms-server/actions/workflows/Docker.yml/badge.svg)](https://github.com/HMBSbige/kms-server/actions/workflows/Docker.yml)
[![Docker](https://img.shields.io/badge/kms--server-blue?label=Docker&logo=docker)](https://github.com/users/HMBSbige/packages/container/package/kms-server)
[![Github last commit date](https://img.shields.io/github/last-commit/HMBSbige/kms-server.svg?label=Updated&logo=github)](https://github.com/HMBSbige/kms-server/commits)

## 直接可用的地址：

```
kms.bige0.com
kms.luody.info
```

## kms version:

```
vlmcsd-1113-2020-03-28-Hotbird64
```

[二进制文件更新地址](https://forums.mydigitallife.net/threads/emulated-kms-servers-on-non-windows-platforms.50234/)

# Docker 使用方法：

只需要绑定1688端口即可对外开放1688 就可以用来激活了
## Pull image
```
docker pull ghcr.io/hmbsbige/kms-server
```
## Run
```
docker run -d \
--restart=always \
-p 1688:1688 \
ghcr.io/hmbsbige/kms-server \
-e -D -d
```

# 延伸教学：
## KMS 激活 Windows 系统

KMS 激活的前提是你的系统是批量授权版本，即 VL 版，一般企业版都是 VL 版，专业版有零售和 VL 版，家庭版旗舰版 OEM 版等等那就肯定不能用 KMS 激活。

一般建议从 [MSDN, 我告诉你](https://msdn.itellyou.cn/) 上面下载系统。VL 版本的镜像一般内置 GVLK key，用于 KMS 激活。

如果你手动输过其他 key，那么这个内置的 key 就会被替换掉，这个时候如果你想用 KMS，那么就需要把 GVLK key 输回去。首先，到 [https://docs.microsoft.com/en-us/windows-server/get-started/kmsclientkeys](https://docs.microsoft.com/en-us/windows-server/get-started/kmsclientkeys)
获取你对应版本的KEY。

如果打不开下面有对应的 [Windows GVLK 密钥对照表（KMS 激活专用）](#windows-gvlk-密钥对照表kms-激活专用)

如果不知道自己的系统是什么版本，可以运行以下命令查看系统版本：

```
wmic os get caption
```

得到对应key之后，使用管理员权限运行 **cmd** 执行安装 key：

```
slmgr /ipk xxxxx-xxxxx-xxxxx-xxxxx
```

一般来说，只要确保的下载的是 VL 批量版本并且没有手动安装过任何 key，你只需要使用管理员权限运行 **cmd** 设置 KMS 服务器地址

```
slmgr /skms kms.bige0.com
```

然后去计算机属性或者设置其他的什么的地方点一下激活就好了。

当然，如果你懒得点，可以多打一句命令手动激活：

```
slmgr /ato
```

这句命令的意思是，马上对当前设置的 key 和服务器地址等进行尝试激活操作。

## KMS 激活 Office

首先你的 Office 必须是 VOL 版本，否则无法激活。

找到你的 Office 安装目录，比如

```
C:\Program Files (x86)\Microsoft Office\Office16
```

64位的就是

```
C:\Program Files\Microsoft Office\Office16
```

office16 是 office2016，office15 就是 office2013，office14就是 office2010。

然后目录对的话，该目录下面应该有个OSPP.VBS。

接下来我们就cd到这个目录下面，例如：

```
cd C:\Program Files\Microsoft Office\Office16
```

然后执行注册kms服务器地址：

```
cscript ospp.vbs /sethst:kms.bige0.com
```

/sethst参数就是指定kms服务器地址。

一般ospp.vbs可以拖进去cmd窗口，所以也可以这么弄：

```
cscript "C:\Program Files\Microsoft Office\Office16\OSPP.VBS" /sethst:kms.bige0.com
```

手动激活：

```
cscript ospp.vbs /act
```


如果提示看到 **Product activation successful** 的字样，那么就是激活成功了，重新打开office就好。

## 如果遇到报错，请检查：
- 你的系统 Office 是否是批量 VL 版本
- 是否以管理员权限运行 cmd
- 你的系统 Office 是否修改过 KEY 或未安装 GVLK KEY
- 检查你的网络连接
- 服务器繁忙，多试试
- 根据出错代码自己搜索出错原因

# Windows GVLK 密钥对照表（KMS 激活专用）

 >以下 key 来源于微软官网：[https://docs.microsoft.com/en-us/windows-server/get-started/kmsclientkeys](https://docs.microsoft.com/en-us/windows-server/get-started/kmsclientkeys)

## Windows Server, version 1803
操作系统版本 | KMS激活序列号
-|-
Windows Server Datacenter |2HXDN-KRXHB-GPYC7-YCKFJ-7FVDG
Windows Server Standard |PTXN8-JFHJM-4WC78-MPCBR-9W4KR

## Windows 10, version 1803
操作系统版本 | KMS激活序列号
-|-
Windows 10 Education |NW6C2-QMPVW-D7KKK-3GKT6-VCFB2
Windows 10 Education N |2WH4N-8QGBV-H22JP-CT43Q-MDWWJ
Windows 10 Enterprise |NPPR9-FWDCX-D2C8J-H872K-2YT43
Windows 10 Enterprise G |YYVX9-NTFWV-6MDM3-9PT4T-4M68B
Windows 10 Enterprise G N |44RPN-FTY23-9VTTB-MP9BX-T84FV
Windows 10 Enterprise N |DPH2V-TTNVB-4X9Q3-TJR4H-KHJW4
Windows 10 Professional |W269N-WFGWX-YVC9B-4J6C9-T83GX
Windows 10 Professional Education |6TP4R-GNPTD-KYYHQ-7B7DP-J447Y
Windows 10 Professional Education N |YVWGF-BXNMC-HTQYQ-CPQ99-66QFC
Windows 10 Professional N |MH37W-N47XK-V7XM9-C7227-GCQG9
Windows 10 Professional Workstation |NRG8B-VKK3Q-CXVCJ-9G2XF-6Q84J
Windows 10 Professional Workstation N |9FNHH-K3HBT-3W4TD-6383H-6XYWF

## Windows Server, version 1709
操作系统版本 | KMS激活序列号
-|-
Windows Server Datacenter |6Y6KB-N82V8-D8CQV-23MJW-BWTG6
Windows Server Standard |DPCNP-XQFKJ-BJF7R-FRC8D-GF6G4

## Windows Server 2016
操作系统版本 | KMS激活序列号
-|-
Windows Server 2016 Datacenter |CB7KF-BWN84-R7R2Y-793K2-8XDDG
Windows Server 2016 Standard |WC2BQ-8NRM3-FDDYY-2BFGV-KHKQY
Windows Server 2016 Essentials |JCKRF-N37P4-C2D82-9YXRT-4M63B

## Windows 10, version 1709
操作系统版本 | KMS激活序列号
-|-
Windows 10 Professional Workstation |NRG8B-VKK3Q-CXVCJ-9G2XF-6Q84J
Windows 10 Professional Workstation N |9FNHH-K3HBT-3W4TD-6383H-6XYWF

## Windows 10
操作系统版本 | KMS激活序列号
-|-
Windows 10 Professional |W269N-WFGWX-YVC9B-4J6C9-T83GX
Windows 10 Professional N |MH37W-N47XK-V7XM9-C7227-GCQG9
Windows 10 Enterprise |NPPR9-FWDCX-D2C8J-H872K-2YT43
Windows 10 Enterprise N |DPH2V-TTNVB-4X9Q3-TJR4H-KHJW4
Windows 10 Education |NW6C2-QMPVW-D7KKK-3GKT6-VCFB2
Windows 10 Education N |2WH4N-8QGBV-H22JP-CT43Q-MDWWJ
Windows 10 Enterprise 2015 LTSB |WNMTR-4C88C-JK8YV-HQ7T2-76DF9
Windows 10 Enterprise 2015 LTSB N |2F77B-TNFGY-69QQF-B8YKP-D69TJ
Windows 10 Enterprise 2016 LTSB |DCPHK-NFMTC-H88MJ-PFHPY-QJ4BJ
Windows 10 Enterprise 2016 LTSB N |QFFDN-GRT3P-VKWWX-X7T3R-8B639

## Windows Server 2012 R2 和 Windows 8.1
操作系统版本 | KMS激活序列号
-|-
Windows 8.1 Professional |GCRJD-8NW9H-F2CDX-CCM8D-9D6T9
Windows 8.1 Professional N |HMCNV-VVBFX-7HMBH-CTY9B-B4FXY
Windows 8.1 Enterprise |MHF9N-XY6XB-WVXMC-BTDCT-MKKG7
Windows 8.1 Enterprise N |TT4HM-HN7YT-62K67-RGRQJ-JFFXW
Windows Server 2012 R2 Server Standard |D2N9P-3P6X9-2R39C-7RTCD-MDVJX
Windows Server 2012 R2 Datacenter |W3GGN-FT8W3-Y4M27-J84CP-Q3VJ9
Windows Server 2012 R2 Essentials |KNC87-3J2TX-XB4WP-VCPJV-M4FWM

## Windows Server 2012 和 Windows 8
操作系统版本 | KMS激活序列号
-|-
Windows 8 Professional |NG4HW-VH26C-733KW-K6F98-J8CK4
Windows 8 Professional N |XCVCF-2NXM9-723PB-MHCB7-2RYQQ
Windows 8 Enterprise |32JNW-9KQ84-P47T8-D8GGY-CWCK7
Windows 8 Enterprise N |JMNMF-RHW7P-DMY6X-RF3DR-X2BQT
Windows Server 2012 |BN3D2-R7TKB-3YPBD-8DRP2-27GG4
Windows Server 2012 N |8N2M2-HWPGY-7PGT9-HGDD8-GVGGY
Windows Server 2012 Single Language |2WN2H-YGCQR-KFX6K-CD6TF-84YXQ
Windows Server 2012 Country Specific |4K36P-JN4VD-GDC6V-KDT89-DYFKP
Windows Server 2012 Server Standard |XC9B7-NBPP2-83J2H-RHMBY-92BT4
Windows Server 2012 MultiPoint Standard |HM7DN-YVMH3-46JC3-XYTG7-CYQJJ
Windows Server 2012 MultiPoint Premium |XNH6W-2V9GX-RGJ4K-Y8X6F-QGJ2G
Windows Server 2012 Datacenter |48HP8-DN98B-MYWDG-T2DCC-8W83P

## Windows 7 and Windows Server 2008 R2
操作系统版本 | KMS激活序列号
-|-
Windows 7 Professional |FJ82H-XT6CR-J8D7P-XQJJ2-GPDD4
Windows 7 Professional N |MRPKT-YTG23-K7D7T-X2JMM-QY7MG
Windows 7 Professional E |W82YF-2Q76Y-63HXB-FGJG9-GF7QX
Windows 7 Enterprise |33PXH-7Y6KF-2VJC9-XBBR8-HVTHH
Windows 7 Enterprise N |YDRBP-3D83W-TY26F-D46B2-XCKRJ
Windows 7 Enterprise E |C29WB-22CC8-VJ326-GHFJW-H9DH4
Windows Server 2008 R2 Web |6TPJF-RBVHG-WBW2R-86QPH-6RTM4
Windows Server 2008 R2 HPC edition |TT8MH-CG224-D3D7Q-498W2-9QCTX
Windows Server 2008 R2 Standard |YC6KT-GKW9T-YTKYR-T4X34-R7VHC
Windows Server 2008 R2 Enterprise |489J6-VHDMP-X63PK-3K798-CPX3Y
Windows Server 2008 R2 Datacenter |74YFP-3QFB3-KQT8W-PMXWJ-7M648
Windows Server 2008 R2 for Itanium-based Systems |GT63C-RJFQ3-4GMB6-BRFB9-CB83V

## Windows Vista and Windows Server 2008
操作系统版本 | KMS激活序列号
-|-
Windows Vista Business |YFKBB-PQJJV-G996G-VWGXY-2V3X8
Windows Vista Business N |HMBQG-8H2RH-C77VX-27R82-VMQBT
Windows Vista Enterprise |VKK3X-68KWM-X2YGT-QR4M6-4BWMV
Windows Vista Enterprise N |VTC42-BM838-43QHV-84HX6-XJXKV
Windows Web Server 2008 |WYR28-R7TFJ-3X2YQ-YCY4H-M249D
Windows Server 2008 Standard |TM24T-X9RMF-VWXK6-X8JC9-BFGM2
Windows Server 2008 Standard without Hyper-V |W7VD6-7JFBR-RX26B-YKQ3Y-6FFFJ
Windows Server 2008 Enterprise |YQGMW-MPWTJ-34KDK-48M3W-X4Q6V
Windows Server 2008 Enterprise without Hyper-V |39BXF-X8Q23-P2WWT-38T2F-G3FPG
Windows Server 2008 HPC |RCTX3-KWVHP-BR6TB-RB6DM-6X7HP
Windows Server 2008 Datacenter |7M67G-PC374-GR742-YH8V4-TCBY3
Windows Server 2008 Datacenter without Hyper-V |22XQ2-VRXRG-P8D42-K34TD-G3QQC
Windows Server 2008 for Itanium-Based Systems |4DWFP-JF3DJ-B7DTH-78FJB-PDRHK
