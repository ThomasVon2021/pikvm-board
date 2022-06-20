# BLIKVM CM4 version guide 

![Image title](blikvm-cm4.png)

## **Installation requirements**
!!! note "If you have an assembly kit, you will need the following things"
    * Raspberry CM4 with 1Gb RAM or more.
    * MicroSD card (at least 16Gb, class 10 recommended).
    * USB-C to USB-A cable.
    * HDMI cable.
    * Straight Ethernet cable (for the ATX board connection).
    * Power supply unit (5.1V 3A USB-C, recommended by the Raspberry Pi).

!!! warning "Power supply"
    You must use USB-C to USB-A cable. Use USB-C to USB-C cable can't work, This is an incompatibility in the hardware design and will be 
    fixed in a later version.

## **Basic setup**
**1.** [Flash the memory card or eMMC ](./flashing_os.md) 

**2.Build BLIKVM** according to the video instruction or review the instructions:

??? info "Video Guide: Metal case step by step"
    [PIKVM CM4 (A RPI Compute Module 4 IO Board for PiKVM) BLIKVM Unboxing](https://www.youtube.com/watch?v=aehOawHklGE)
??? info "Geerling Engineering Test video"
    [This Raspberry Pi controls ANY PC (BliKVM)](https://www.youtube.com/watch?v=3OPd7svT3bE)

**3.** Connect BLIKVM to the computer according to the diagram below:
![Image title](image/blikcm-cm4-interface.png){width="400"}

* HDMI IN and otg port must be connected to the computer. ATX too, but it’s optional, read below. 
There should be no USB hub between BLIKVM and the computer, as some UEFI/BIOS cannot detect them at the boot stage. 
BLIKVM supports 1080p60Hz or lower about HDMI source.
* Connect Ethernet to the network and PWR IN to the BLIKVM power supply.

## **ATX connection**
![Image title](image/BLKVM-CM4/ATX-interface.png){width="400"}

To manage the power of your computer, you will connect CN-ATX port to the computer.The user can use the ATX cable 
provided with the product to connect the product and the motherboard ATX switch of the controlled computer. 
The length of the ATX cable is 60CM, you can also use the double female Dupont cables.

![Image title](image/BLKVM-CM4/atx-cable-computer.png){width="400"}

## **Hardware Features**
![Image title](image/BLKVM-CM4/blikvm-cm4-hardware-features.png)

* 1、HDMI IN port with I2S
* 2、ATX controller interface (power on/off, reboot control, PWR and HDD ACT LEDs)
* 3、USB3.0 port x 2
* 4、USB-C OTG
* 5、Real Time Clock (RTC)
* 6、Gigabit Ethernet
* 7、Activity LED
* 8、Micro SD Card socket
* 9、Power LED
* 10、I2C display connector
* 11、nRPI_BOOT Jumper
* 12、USB-C power input
* 13、FAN connector 5V
* 14、CSI-2 date lanes switch
* 15、CM4 Module Connectors

## ** Support 1080p60hz HDMI input **
First in V2.2 version, there is CSI channel switch. This switch is switch 2 csi channels or 4 csi channels. 
In other versions, the switch is cancelled. Newer keeps the factory state, ignore this switch. Only flip the switch 
when the device is powered off, otherwise it may cause permanent damage! The four small switches should be up or 
down at the same time.
![Image title](image/BLKVM-CM4/kvm-cm4-switch.png){width="400"}
The video encoding function of the Raspberry Pi is implemented by the HDMI-to-CSI bridge chip Toshiba TC358743, 
which supports up to 4 CSI-2 date lanes. The camera interface of Raspberry Pi 4B only supports 2 CSI-2 date 
lanes(up to 1080p50fps), Raspberry Pi CM4 can support 4 CSI-2 date lanes(up to 1080p60fps). Currently, PiKVM 
only uses two CSI-2 channels.

1、 find edid file:
```
rw
vim /etc/kvmd/tc358743-edid.hex
```
write the following 1080p 60Hz EDID into the file tc358743-edid.hex.
```
00FFFFFFFFFFFF0052628888008888881C150103800000780AEE91A3544C99260F505400000001010101010101010101010101010101011D007251D01E206E285500C48E2100001E8C0AD08A20E02D10103E9600138E2100001E000000FC00546F73686962612D4832430A20000000FD003B3D0F2E0F1E0A202020202020014F020323454F041303021211012021A23C3D3E1F102309070766030C00300080E3007F8C8C0AD08A20E02D10103E9600C48E210000188C0AD08A20E02D10103E9600138E210000188C0AA01451F01600267C4300138E21000098000000000000000000000000000000000000000000000000000000000000000000000000000087
```
2、add csi 4 lanes
Edit /boot/config.txt, modify "dtoverlay=tc358743" to "dtoverlay=tc358743,4lane=1"
```
vim /boot.config.txt
ro
```
Now, reboot blikvm, and you can test 1080p 60hz input.

![](https://github.com/ThomasVon2021/pikvm-CM4-Board/blob/main/images/wiki/60hz.jpg)  