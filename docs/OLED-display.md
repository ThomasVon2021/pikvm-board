# OLED display 
!!! abstract "Follow the method below to enable OLED."
    If you use PiKVM image, log in to PiKVM and run these commands:
    ```
    # rw
    # systemctl enable --now kvmd-oled //Enable OLED
    # ro
    ```
!!! info "BLIKVM CM4 version OLED display"
    The product comes standard with a monochrome OLED display with a resolution of 128x64, and the chip is SSD1306.  
    The user connects the display to the product with the wiring of the display.

    ![Image title](image/oled/BLIKVM-CM4-oled.png){width="300"}

    The module is connected to CM4 through the I^2^C interface. The wiring definition is shown in the following table. 
    This is a library for the monochrome OLEDs based on [SSD1306 drivers.](https://github.com/adafruit/Adafruit_SSD1306)

    | Display(SSD1306) | CM4               |
    | ---------------- | ----------------- |
    | GND              | GND               |
    | VCC              | 3.3V              |
    | SCL              | GPIO3(SCL1,I^2^C) |
    | SDA              | GPIO2(SDA1,I^2^C) |

