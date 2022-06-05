# ATXA guide

## **1. Introduction**
ATXA is an ATX adapter borad to manage the power of your computer. 
The product includes two modules A-board and B-board. A-board is connected to the Raspberry Pi, 
B-board is connected to the computer's motherboard, and A-board is connected to B-board through a 
network cable.Join to the <a href="https://discord.gg/9Y374gUF6C" target="_blank">Discord Community Chat</a> for news, 
questions and support!
 
| ATXA_A                                       | ATXA_B                                       |
|----------------------------------------------|----------------------------------------------|
| ![ATXA_A](image/atx/ATXA_A.png){width="400"} | ![ATXA_B](image/atx/ATXA_B.png){width="250"} |

## **2. A-board**
 A-board is connected to the Raspberry Pi. The following table is a typical connection method in PiKVM application.

| A-board | RPI4   |
| ------- | ------ |
| GND     | GND    |
| 3V3     | 3V3    |
| LED PWR | GPIO24 |
| LED HDD | GPIO22 |
| SW PWR  | GPIO23 |
| SW RST  | GPIO27 |

![2](image/atx/status.png){width="400"}

A-board is connected to B-board through a network cable. The following table is the corresponding relationship between the pin status of A-board and B-board.

|  Pins on A-board  |                          Pins on B-board                           |
|:-----------------:|:------------------------------------------------------------------:|
|  LED PWR is HIGH  |                 LED PWR+ is HIGH,  LED PWR- is LOW                 |
|  LED PWR is LOW   |                 LED PWR+ is LOW,  LED PWR- is LOW                  |
|  LED HDD is HIGH  |                 LED HDD+ is HIGH,  LED HDD- is LOW                 |
|  LED HDD is LOW   |                 LED HDD+ is LOW,  LED HDD- is LOW                  |
|  SW PWR is HIGH   |    BTN PWR+ and BTN PWR- connected, the power button is pressed    |
|   SW PWR is LOW   | BTN PWR+ and BTN PWR- disconnected, the power button is unpressed  |
|  SW RST is HIGH   |    BTN RST+ and BTN RST- connected, the reset button is pressed    |
|   SW RST is LOW   | BTN RST+ and BTN RST- disconnected, the reset button is unpressed  |

## **3. B-board**

The b-board has an adapted full-height and half-height metal PCI mounting plate, which can be installed on the computer case. The user connects the pins on the B-board to the ATX control interface on the computer motherboard using the color DuPont cables provided with the product.  
![3](image/atx/physical_map.png){width="400"}

## **3.Mechanical Diagram**

![4](image/atx/4.png)

## **4.Test video**
youtube：<a href="https://www.youtube.com/watch?v=gOFdGrVMBU8" target="_blank">ATX</a>

## **5.More link**
Purchase：<a href="https://www.aliexpress.com/item/1005003761450893.html?spm=a2g0o.store_pc_allProduct.8148356.12.4c8f16b4prvvUV" target="_blank">ATX</a>
