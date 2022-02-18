# BLIKVM

# Compute Module 4 IO Board

# An application board for PiKVM

Design hardware based on CM4 for pikvm:https://github.com/pikvm/pikvm.
This device helps to manage servers or workstations remotely, regardless of the health of the operating system or whether one is installed. 
Join to the <a href="https://discord.gg/9Y374gUF6C" target="_blank">Discord Community Chat</a> for news, questions and support!
![](/images/physical_img/blikvm8.jpg)

## 1.Introduction

BLIKVM is a CM4 application board for [PiKVM](https://pikvm.org/).  This product’s key features include video capture, ATX adapter, USB 3.0, OTG, Gigabit Ethernet, OLED and RTC. The product has a customized metal shell to dissipate heat and provide protection for the circuit board. This is a feature demonstration [video](https://www.youtube.com/watch?v=d7I9l5yG5M8).The product is currently perfectly compatible with  [**v3-hdmi-rpi4-latest.img**](https://files.pikvm.org/images/v3-hdmi-rpi4-latest.img.xz).
| **[>>> PCB front <<<](#diy-getting-started)** | **[>>> PCB front <<<](#pikvm-v3-hat)** |
| --------------------------------------------- | ------------------------------------------ |
| [Test video by **Jeff Geerling**](https://www.youtube.com/channel/UCsd6hP-zzIkCpw8XGw7Osyw) | [BLIKVM Unboxing video](https://www.youtube.com/watch?v=aehOawHklGE&t=37s) |
| <img src="/images/docs_image/1-1.png" alt="drawing"/> | <img src="/images/docs_image/1-2.png" alt="drawing"/> |

## 2.Features
![image-20211211201200259](/images/docs_image/2-1.png)

<img src="/images/docs_image/2-2.png" alt="2-2.png" style="zoom:90%;" />

### 2.1. **HDMI IN** port with I2S

The product integrates video capture function, and the bridge chip is TC358743. The product supports HDMI video and audio capture. Currently, PiKVM software only supports video capture, not audio capture. For the audio coding method, please refer to the documentation of [C780](/images/docs_image/2-3.png).

### 2.2. **ATX** controller interface (power on/off, reboot control, PWR and HDD ACT LEDs)

<img src="/images/docs_image/2-3.png" alt="2-3.png" style="zoom:50%;" />

The user can use the ATX cable provided with the product to connect the product and the motherboard ATX switch of the controlled computer. The length of the ATX cable is 60CM, you can also use the double female Dupont cables.

<img src="/images/docs_image/2-4.png" alt="2-4.png" style="zoom:50%;" />

### 2.3. **USB3.0 port**  x 2

The USB3.0 interface is provided by a USB 3 host controller (using the Via Labs VLI805), which is connected to the internal PCIe 2.0 x1 host controller of CM4.

### 2.4. **USB-C OTG**

This port is doing the emulation of a **USB** **keyboard**, **mouse**, **Virtual CD-ROM** or **USB Flash Drive**, **USB-Ethernet**, **USB-Serial** port and a lot of other Linux-supported features. This interface cannot provide external power.
Control a PC's USB interface, you should plug a USB-C to USB-A cable from the USB-C 'OTG' port on the BliKVM into a USB-A port on the PC you're controlling.

### 2.5.**Real Time Clock (RTC)**

The RTC clock chip is DS1307. The chip is connected to the I^2^C interface of CM4, and the wiring definition is shown in the following table. Users need to buy 1220 button batteries locally.

<img src="/images/docs_image/2-5.png" alt="2-5.png" style="zoom:80%;" />

| DS1307 | CM4               |
| ------ | ----------------- |
| SCL    | GPIO3(SCL1,I^2^C) |
| SDA    | GPIO2(SDA1,I^2^C) |

Follow the method below to enable RTC(Use the latest [**v3-hdmi-rpi4-latest.img**](https://files.pikvm.org/images/v3-hdmi-rpi4-latest.img.xz),IIC is enabled by default).

1. Open the startup configuration file of the Raspberry Pi
```
# sudo nano /boot/config.txt //Raspberry Pi's startup configuration file
```
2. Find the corresponding code, modify it as follows, and configure it as DS1307 chip

```
dtoverlay=i2c-rtc,ds1307
```

3. Reboot the system

```
# sudo reboot
```

4. Synchronize time from Raspberry Pi to DS1307

```
# date  //Display the current time of the Raspberry Pi
# sudo hwclock -w //Write the time of Raspberry Pi to DS1307
# sudo hwclock -r //Read the time of DS1307
```
### 2.6.**Gigabit Ethernet**

A standard 1:1 RJ45 MagJack with added ESD protection.

### 2.7.**Activity** LED 

This LED duplicates the function of the GREEN LED on the Raspberry Pi 4, Model B. Under Linux this LED will flash to signify eMMC access, while if there is an error during booting this LED will flash error patterns which can be decoded using the look up table on the Raspberry Pi website.

### 2.8.**Micro SD Card** socket

The micro SD Card socket is a PUSH-PUSH socket. To release the micro SD Card a gentle push on the micro SD Card will enable it to be removed.

### 2.9.**Power** LED

This LED duplicates the function of the RED LED on the Raspberry Pi 4, Model B.

### 2.10. **I2C** display connector

The product comes standard with a monochrome OLED display with a resolution of 128x64, and the chip is SSD1306.  The user connects the display to the product with the wiring of the display.

<img src="/images/docs_image/2-6.png" alt="2-6.png" style="zoom:80%;" />

The module is connected to CM4 through the I^2^C interface. The wiring definition is shown in the following table. This is a library for the monochrome OLEDs based on [SSD1306 drivers.](https://github.com/adafruit/Adafruit_SSD1306)

| Display(SSD1306) | CM4               |
| ---------------- | ----------------- |
| GND              | GND               |
| VCC              | 3.3V              |
| SCL              | GPIO3(SCL1,I^2^C) |
| SDA              | GPIO2(SDA1,I^2^C) |

Follow the method below to enable RTC(Use the latest [**v3-hdmi-rpi4-latest.img**](https://files.pikvm.org/images/v3-hdmi-rpi4-latest.img.xz),IIC is enabled by default).

Log in to PiKVM and run these commands:

```
# rw
# systemctl enable --now kvmd-oled //Enable OLED
# ro
```

### 2.11. **nRPI_BOOT** Jumper

- G: GND
- BOOT: nRPI_BOOT

During boot if the nRPI_BOOT pin is low booting from eMMC will be stopped and booting will be transferred to rpi boot which is via USB.  
Flashing the OS image，you can refer to this link <a href="https://github.com/ThomasVon2021/pikvm-CM4-Board/wiki#flashing-the-os-image" target="_blank">flashing os image</a>


### 2.12.**USB-C power input** 

The CM4 requires a good quality USB-C power supply capable of delivering 5V at 3A.**Must use USB-C to USB-A cable**. If attached downstream USB devices consume less than 500mA, a 5V, 2.5A supply may be used.

### 2.13. **FAN** connector 5V

It is recommended to use 5V 0.15A 3010 DC brushless fan.

### 2.14. **CSI-2 date lanes switch**

Newer keeps the factory state, ignore this switch. Only flip the switch when the device is powered off, otherwise it may cause permanent damage! The four small switches should be up or down at the same time. 

![image-20211212000203991](/images/docs_image/2-7.png)

The video encoding function of the Raspberry Pi is implemented by the HDMI-to-CSI bridge chip Toshiba TC358743, which supports up to 4 CSI-2 date lanes. The camera interface of Raspberry Pi 4B only supports 2 CSI-2 date lanes(up to 1080p50fps), Raspberry Pi CM4 can support 4 CSI-2 date lanes(up to 1080p60fps). Currently, PiKVM only uses two CSI-2 channels.

### 2.15. CM4 Module Connectors

Used to install CM4

## 3.Mechanical Diagram

![image-20211212010344693](/images/docs_image/2-8.png)

## 4.Metal Shell

<img src="/images/docs_image/2-9.png" alt="2-9.png" style="zoom:80%;" />

The metal shell provides protection for the circuit board, and the equipped 5V DC brushless fan can enhance heat dissipation. SMA antenna hole is reserved on the shell, CM4 can use an external antenna.

<img src="/images/docs_image/2-10.png" alt="2-9.png" style="zoom:80%;" />

## 5.3D MODLE

![](/images/3D_img/kvm2_img01.jpg)
![](/images/3D_img/kvm2_img02.jpg)
![](/images/3D_img/Translucent_img01.jpg)
![](/images/3D_img/Translucent_img02.jpg)
![](/images/pcb_img/kvm-1.jpg)
![](/images/pcb_img/kvm-2.jpg)

In this path: **video/**, there are some 3D models of videos.  

## 6.Contact
If you are interested in this hardware, please email me anytime.

email address:linshuzi123@gmail.com

<a href="https://discord.gg/9Y374gUF6C" target="_blank">Discord Community Chat</a> 

## 7.Test video
https://www.youtube.com/watch?v=aehOawHklGE
https://www.youtube.com/watch?v=d7I9l5yG5M8

![](/images/test_img/figure1.png)


## 8.More link
Purchase：<a href="https://www.aliexpress.com/item/1005003262886521.html?spm=a2g0o.store_pc_allProduct.8148356.5.39cd62bejpZaWF" target="_blank">BLIKVM</a>
