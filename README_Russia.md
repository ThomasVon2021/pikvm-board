# README_Russia

# Плата ввода-вывода вычислительного модуля 4

# Доска приложений для ПиКВМ

Разработать аппаратное обеспечение на основе CM4 для pikvm:https://github.com/pikvm/pikvm.
Это устройство помогает удаленно управлять серверами или рабочими станциями, независимо от состояния операционной системы или от того, установлена ли она. Присоединяйтесь к нашему  <a href="https://discord.com/invite/9Y374gUF6C" target="_blank">сообществу BLIKVM Discord</a> для поддержки, часто задаваемых вопросов и новостей! 

Покупка：<a href="https://www.aliexpress.com/item/1005003262886521.html?spm=a2g0o.store_pc_allProduct.8148356.5.39cd62bejpZaWF" target="_blank">BLIKVM</a>

![](https://github.com/ThomasVon2021/pikvm-CM4-Board/blob/main/images/physical_img/blikvm8.jpg)

## 1.Введение

BLIKVM — это прикладная плата CM4 для [PiKVM](https://pikvm.org/). Основные функции этого продукта включают захват видео, адаптер ATX, USB 3.0, OTG, Gigabit Ethernet, OLED и RTC. Продукт имеет индивидуальную металлическую оболочку для отвода тепла и защиты печатной платы. Это [видео](https://www.youtube.com/watch?v=d7I9l5yG5M8) с демонстрацией возможностей.В настоящее время продукт полностью совместим с [**v3-hdmi-rpi4-latest.img**](https://files.pikvm.org/images/v3-hdmi-rpi4-latest.img.xz).
| **[>>> Передняя панель платы <<<](#diy-getting-started)** | **[>>> Передняя панель платы <<<](#pikvm-v3-hat)** |
| --------------------------------------------- | ------------------------------------------ |
| [Тестовое видео **Джеффа Герлинга**](https://www.youtube.com/watch?v=3OPd7svT3bE&t=856s) | [Видео распаковки BLIKVM](https://www.youtube.com/watch?v=aehOawHklGE&t=37s) |
| <img src="https://github.com/ThomasVon2021/pikvm-CM4-Board/blob/main/images/docs_image/1-1.png"/> | <img src="https://github.com/ThomasVon2021/pikvm-CM4-Board/blob/main/images/docs_image/1-2.png"/> |

## 2.Особенности
| **[>>> Передняя панель платы <<<](#diy-getting-started)** | **[>>> Передняя панель платы <<<](#pikvm-v3-hat)** |
| --------------------------------------------- | ------------------------------------------ |
| <img src="https://github.com/ThomasVon2021/pikvm-CM4-Board/blob/main/images/docs_image/2-1.png" alt="drawing"/> | <img src="https://github.com/ThomasVon2021/pikvm-CM4-Board/blob/main/images/docs_image/2-2.png" alt="drawing"/> |

Вот краткое введение. Для получения подробной информации, пожалуйста, нажмите <a href="https://github.com/ThomasVon2021/pikvm-CM4-Board/wiki#features" target="_blank">WiKi</a>

1. Входной интерфейс HDMI (макс. 1080p при 60 Гц) поддерживает аудиошину I2S

2. Интерфейс управления питанием ATX (включение/выключение питания, управление перезагрузкой, индикаторы PWR и HDD ACT)

3.интерфейс USB3.0 x 2

4.Интерфейс Type-C OTG. Этот интерфейс можно использовать для таких функций, как виртуальная USB-клавиатура и мышь, компакт-диск или флэш-память USB.

5.Встроенная схема часов RTC

6.Собственный порт Gigabit Ethernet

7.Индикатор состояния

8.держатель карты TF

9.Индикатор питания

10.интерфейс I2C для подключения к OLED-дисплею

11.Ограничение перехода к программе

12.Порт питания типа C

13.разъем охлаждающего вентилятора 5 В

14.Переключатель выбора канала CSI-2 (разомкнут для 4-канального сбора данных, замкнут для 2-канального сбора данных)

15.Крепление вычислительного модуля CM4

## 3.Контакты
Если вы заинтересованы в этом оборудовании, пожалуйста, напишите мне в любое время.

адрес электронной почты:linshuzi123@gmail.com

<a href="https://discord.gg/9Y374gUF6C" target="_blank">Чат сообщества Discord</a> 

## 4.Тестовое видео
https://www.youtube.com/watch?v=aehOawHklGE
https://www.youtube.com/watch?v=d7I9l5yG5M8

![](https://github.com/elaine-1314/pikvm-CM4-Board/blob/main/images/test_img/figure1.png)


## 5.Дополнительная ссылка
Покупка：<a href="https://www.aliexpress.com/item/1005003262886521.html?spm=a2g0o.store_pc_allProduct.8148356.5.39cd62bejpZaWF" target="_blank">BLIKVM</a>  
Покупка：<a href="https://www.aliexpress.com/item/1005003761450893.html?spm=a2g0o.productlist.0.0.32da2b63A98QAp&algo_pvid=17cd48f6-7616-4128-9bb4-9246eb25bf1f&algo_exp_id=17cd48f6-7616-4128-9bb4-9246eb25bf1f-3&pdp_ext_f=%7B%22sku_id%22%3A%2212000027078368713%22%7D&pdp_pi=-1%3B29.03%3B-1%3B3.82%40salePrice%3BUSD%3Bsearch-mainSearch" target="_blank">ATX</a>  
Покупка：<a href="https://www.aliexpress.com/item/1005003793429781.html?spm=a2g0o.productlist.0.0.32da2b63A98QAp&algo_pvid=17cd48f6-7616-4128-9bb4-9246eb25bf1f&algo_exp_id=17cd48f6-7616-4128-9bb4-9246eb25bf1f-2&pdp_ext_f=%7B%22sku_id%22%3A%2212000027184842775%22%7D&pdp_pi=-1%3B5.01%3B-1%3B3.82%40salePrice%3BUSD%3Bsearch-mainSearch" target="_blank">USB splitter</a>  
Покупка：<a href="https://www.aliexpress.com/item/1005002861310912.html?spm=5261.ProductManageOnline.0.0.419d4edf1s8xR0" target="_blank">HMDI to CSI board</a>

## 6.Благодарности
BLIKVM был бы невозможен без отличной и щедрой работы многих проектов с открытым исходным кодом, наиболее известные из которых перечислены ниже: 
<a href="https://github.com/pikvm/pikvm" target="_blank">pikvm</a>
