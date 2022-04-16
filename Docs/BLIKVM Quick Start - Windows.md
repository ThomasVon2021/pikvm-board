# BLIKVM Quick Start - Windows

> 物件准备
>
> BLIKVM-v2.2底板 + BLKVM盒子(带OLED屏幕)  + CM4计算模组 + 跳线帽 + USB to TypeC × 2 + HDMI + 网线 + 风扇

注意：

- `双头的TypeC不可用`，只能是USB to TypeC线。
- USB to TypeC线说明： 一条用于通电，另外一条用于连接被控制电脑(提供鼠标键盘功能)



### 1. 取出BLIKVM

将底板整个从盒子取出来，不需要连接任何东西。



### 2. CM4计算模组 - 安装到底板背

对准针脚，将`CM4计算模组`安装到底板

![image-20220407221059069](https://carvin-note.oss-cn-shenzhen.aliyuncs.com/img/image-20220407221059069.png)



### 3. 烧录镜像

#### 跳线帽 - 短接处理（重要步骤！）

正常使用：□■■

烧录镜像：■■□ 

![image-20220407222930925](https://carvin-note.oss-cn-shenzhen.aliyuncs.com/img/image-20220407222930925.png)

原本跳线帽默认接入：□■■

但是现在需要烧录镜像，所以需要短接，即接入把跳线帽拔出来，接成 ■■□ 即是短接状态。



#### 下载并安装两个软件

- **RPi Boot**

  - 用处：让windows系统的电脑可以通过usb连接树莓派

  - 下载：https://github.com/raspberrypi/usbboot 

    ![image-20220407233706599](https://carvin-note.oss-cn-shenzhen.aliyuncs.com/img/image-20220407233706599.png)

  - 安装：下载解压后，打开目录`\win32`，点击`rpiboot_setup.exe`即可安装。

  - 预期：安装完成后，如果树莓派通过usb接入电脑，电脑即可读取到

- **RPi Imager**

  - 目的：通过这个软件把`xx.img.xz `文件的镜像烧录到树莓派中

  - 下载：https://www.raspberrypi.com/software/

    ![image-20220407223519902](https://carvin-note.oss-cn-shenzhen.aliyuncs.com/img/image-20220407223519902.png)

  - 安装：直接安装即可

  - 使用：点开即是图形界面，后续根据步骤操作即可完成`镜像烧录`



#### 下载镜像文件

https://pikvm.org/download/

CM4建议选择下载：

![image-20220407222147185](https://carvin-note.oss-cn-shenzhen.aliyuncs.com/img/image-20220407222147185.png)

下载的链接：https://files.pikvm.org/images/v3-hdmi-rpi4-latest.img.xz （请用下载软件来下载）



#### 烧录镜像 -> 树莓派

- 接线：

  - OTG口 通过 USB to TypeC 连接PC
  - 电源口 通过  USB to TypeC 通电
  - 预期：PC的`我的电脑`可以看到树莓派的盘符（和U盘一样）。

- PC打开`Raspberry Pi Imager`，并进行如下操作：

  ![image-20220407224242569](https://carvin-note.oss-cn-shenzhen.aliyuncs.com/img/image-20220407224242569.png)

  - 选择自定义镜像：前面下载好的镜像文件`xx.img.xz `

    ![image-20220407224420718](https://carvin-note.oss-cn-shenzhen.aliyuncs.com/img/image-20220407224420718.png)

  - 选择树莓派所在盘符后，点击烧录即可进行。

- 烧录时间比较长，请耐心等待。

- 完成烧录后，把`全部线拔掉(完全断电)`，

- ==跳线帽接回== □■■ 位置（非常重要！否则无法使用）。

  ![image-20220407222930925](https://carvin-note.oss-cn-shenzhen.aliyuncs.com/img/image-20220407222930925.png)

- 如此，==完成了烧录镜像操作==。



### 4. 正式访问PIKVM

> 这个时候先别急着组装到盒子里，暂时还需要调试。

#### 通过IP地址访问pikvm

将烧录完成后的树莓派，连接上：

- HDMI线 -> 被控电脑
- USB to TypeC线 -> 被控电脑
- 网线 -> 与被控电脑相同局域网的路由器or网关
-  USB to TypeC线 -> 通电

在谷歌浏览器，直接通过ip地址访问即可。

问题：在没有屏幕显示的情况下，如何获取树莓派的IP？

答：通过cmd的`ipconfig`获取路由器的`默认网关`地址，通过浏览器访问路由器的`默认网关`地址进入自家路由器，登录上去之后即可看到名为“pikvm”的设备，这个设备的IP即可被我们通过谷歌浏览器进行访问。



**实例：我家的电信wifi6路由器**

![image-20220407231242963](https://carvin-note.oss-cn-shenzhen.aliyuncs.com/img/image-20220407231242963.png)

登录后，一般可以查看当前路由器连接的设备的`IP地址`

![image-20220407231251456](https://carvin-note.oss-cn-shenzhen.aliyuncs.com/img/image-20220407231251456.png)

如上图所示，可以确认我们获得的pikvm的IP地址。



获得IP地址后，即可通过IP地址在谷歌浏览器里**正式访问**：

默认初始化账号和密码都是`admin`，登录后即可按需进行操作。

![image-20220407231504661](https://carvin-note.oss-cn-shenzhen.aliyuncs.com/img/image-20220407231504661.png)

![image-20220407231638990](https://carvin-note.oss-cn-shenzhen.aliyuncs.com/img/image-20220407231638990.png)

登录后，点击`KVM`则可以直接对被控电脑进行查看和操作，点击`Terminal`即可访问终端：按需进行命令行操作。



#### 进入Terminal，设置OLED屏幕

在Terminal里输入下面三个指令后，在之后使用时，OLED屏幕就可以正常显示IP和温度等等参数

```sh
# 读写模式
rw
# 打开OLED屏幕 
systemctl enable --now kvmd-oled
# 只读模式
ro
```



### 5. 装入BLIKVM盒

接上`风扇`和`BLIKVM-OLED屏幕`后，拧上螺丝，即可完成。

![image-20220410212451670](https://carvin-note.oss-cn-shenzhen.aliyuncs.com/img/image-20220410212451670.png)

注意细节：风扇的线不能接反。

完成装入盒后，后续即可按需使用。

如此，我们便可以使用PIKVM的基础功能，通过有线网络：按需控制电脑。

![image-20220407233631973](https://carvin-note.oss-cn-shenzhen.aliyuncs.com/img/image-20220407233631973.png)

