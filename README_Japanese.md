# BLIKVM
[![Discord](https://img.shields.io/discord/943534043515977768?color=0&label=chat&logo=discord)](https://discord.gg/9Y374gUF6C) 
# PiKVM アプリケーションボード

BLKVMはオープンなKVM製品です。BLKVMには、CM4用ボード、Raspberry Pi用HAT、PCIeボードの3種のバリエーションがあります。<a href="https://github.com/pikvm/pikvm" target="_blank">pikvm.</a>と言うソフトウェアを利用することにより、BLKVMを介してサーバーやワークステーションをオペレーションシステム(OS)に依存せずに操作、管理できます。

最新のニュースやFAQ、サポートは<a href="https://discord.gg/9Y374gUF6C" target="_blank">BLKVM Discordコミュニティ</a>に参加してください。

<a href="https://www.blicube.com/BLIKVM/" target="_blank">BLIKVMの詳細な情報</a>はこちらをご覧ください。

ご購入は下記のリンクをご覧ください。
* <a href="https://www.aliexpress.com/item/1005003262886521.html?spm=a2g0o.store_pc_allProduct.8148356.5.39cd62bejpZaWF" target="_blank">BLIKVM CM4 version</a>  
* <a href="https://www.aliexpress.com/item/3256804191615648.html?spm=a2g0o.productlist.0.0.42682b63qHmo0g&algo_pvid=eaa3e7fc-42f3-44f0-8c22-84e0e647767d&algo_exp_id=eaa3e7fc-42f3-44f0-8c22-84e0e647767d-1&pdp_ext_f=%7B%22sku_id%22%3A%2212000028971386127%22%7D&pdp_npi=2%40dis%21USD%21%2198.9%21%21%21%21%21%400b0a119a16564597101234153ecbb8%2112000028971386127%21sea" target="_blank">BLIKVM HAT version</a>   
* <a href="https://de.aliexpress.com/item/3256804386522898.html?spm=a2g0o.productlist.0.0.649a6b5eN5yGDd&algo_pvid=9ad976a1-7d41-46bd-98f0-08232a82f779&algo_exp_id=9ad976a1-7d41-46bd-98f0-08232a82f779-10&pdp_ext_f=%7B%22sku_id%22%3A%2212000029675352722%22%7D&pdp_npi=2%40dis%21USD%21%21117.07%21%21%21%21%21%400b0a050116592735655394348eaab9%2112000029675352722%21sea" target="_blank">BLIKVM PCIe version</a> 

![Image title](/images/version_all.png)

## 1.はじめに

BLIKVNは「PiKVM」(https://pikvm.org/)のためのCM4アプリケーションボードです。この製品の主な機能は下記の通りです。
* ビデオキャプチャ
* ATXコントロール
* USB 3.0
* USB-OTG
* ギガビットイーサネット
* OLED表示
* リアルタイムクロック(RTC)

基盤は熱などから保護するための専用金属ケースに収められています。この製品の機能紹介はこちらの[映像](https://www.youtube.com/watch?v=d7I9l5yG5M8)をご覧ください。この製品では[**v3-hdmi-rpi4-latest.img**](https://files.pikvm.org/images/v3-hdmi-rpi4-latest.img.xz)を利用できます。


| **[>>> PCB 前面 <<<](#diy-getting-started)** | **[>>> PCB 背面 <<<](#pikvm-v3-hat)** |
| --------------------------------------------- | ------------------------------------------ |
| [**Jeff Geerling**によるテスト映像](https://www.youtube.com/watch?v=3OPd7svT3bE&t=856s) | [BLIKVM 開封映像](https://www.youtube.com/watch?v=aehOawHklGE&t=37s) |
| <img src="/images/docs_image/1-1.png" alt="drawing"/> | <img src="/images/docs_image/1-2.png" alt="drawing"/> |

## 2.機能

| **[>>> PCB 前面 <<<](#diy-getting-started)** | **[>>> PCB 背面 <<<](#pikvm-v3-hat)** |
| --------------------------------------------- | ------------------------------------------ |
| <img src="/images/docs_image/2-1.png" alt="drawing"/> | <img src="/images/docs_image/2-2.png" alt="drawing"/> |

ここでは簡単に説明します。詳細は<a href="https://github.com/ThomasVon2021/pikvm-CM4-Board/wiki#features" target="_blank">Wiki</a>をご覧ください。
1. **HDMI入力ポート** (I2S対応)
2. **ATX コントロールインターフェイス** (電源スイッチ、リセットボタン、電源およびストレージアクセスLED)
3. **USB3.0 ポート**  x 2
4. **USB-C (USB-OTG用)**
5. **リアルタイムクロック (RTC)**
6. **ギガビットイーサネット**
7. **状態表示LED**
8. **Micro SD Cardスロット**
9. **電源LED**
10. **I2C** ディスプレイコネクター
11. **nRPI_BOOT** ジャンパー
12. **USB-C (電源)** 
13. **ファンコネクター** 5V
14. **CSI-2 データレーン幅切り替えスイッチ**
15. CM4 モジュールコネクター

## 3.問い合わせ先

この製品に興味がありましたら、下記宛にいつでも連絡してください。

メールアドレス:linshuzi123@gmail.com

<a href="https://discord.gg/9Y374gUF6C" target="_blank">Discord コミュニティチャット</a> 

## 4.テスト映像

* https://www.youtube.com/watch?v=aehOawHklGE
* https://www.youtube.com/watch?v=d7I9l5yG5M8

![](/images/test_img/figure1.png)


## 5.リンク

### 購入に関して
* <a href="https://www.aliexpress.com/item/1005003262886521.html?spm=a2g0o.store_pc_allProduct.8148356.5.39cd62bejpZaWF" target="_blank">BLIKVM CM4 version</a>  
* <a href="https://www.aliexpress.com/item/3256804191615648.html?spm=a2g0o.productlist.0.0.42682b63qHmo0g&algo_pvid=eaa3e7fc-42f3-44f0-8c22-84e0e647767d&algo_exp_id=eaa3e7fc-42f3-44f0-8c22-84e0e647767d-1&pdp_ext_f=%7B%22sku_id%22%3A%2212000028971386127%22%7D&pdp_npi=2%40dis%21USD%21%2198.9%21%21%21%21%21%400b0a119a16564597101234153ecbb8%2112000028971386127%21sea" target="_blank">BLIKVM HAT version</a>   
* <a href="https://de.aliexpress.com/item/3256804386522898.html?spm=a2g0o.productlist.0.0.649a6b5eN5yGDd&algo_pvid=9ad976a1-7d41-46bd-98f0-08232a82f779&algo_exp_id=9ad976a1-7d41-46bd-98f0-08232a82f779-10&pdp_ext_f=%7B%22sku_id%22%3A%2212000029675352722%22%7D&pdp_npi=2%40dis%21USD%21%21117.07%21%21%21%21%21%400b0a050116592735655394348eaab9%2112000029675352722%21sea" target="_blank">BLIKVM PCIe version</a>   
* <a href="https://www.aliexpress.com/item/1005003761450893.html?spm=a2g0o.productlist.0.0.32da2b63A98QAp&algo_pvid=17cd48f6-7616-4128-9bb4-9246eb25bf1f&algo_exp_id=17cd48f6-7616-4128-9bb4-9246eb25bf1f-3&pdp_ext_f=%7B%22sku_id%22%3A%2212000027078368713%22%7D&pdp_pi=-1%3B29.03%3B-1%3B3.82%40salePrice%3BUSD%3Bsearch-mainSearch"   target="_blank">ATX</a>  
* <a href="https://www.aliexpress.com/item/1005003793429781.html?spm=a2g0o.productlist.0.0.32da2b63A98QAp&algo_pvid=17cd48f6-7616-4128-9bb4-9246eb25bf1f&algo_exp_id=17cd48f6-7616-4128-9bb4-9246eb25bf1f-2&pdp_ext_f=%7B%22sku_id%22%3A%2212000027184842775%22%7D&pdp_pi=-1%3B5.01%3B-1%3B3.82%40salePrice%3BUSD%3Bsearch-mainSearch" target="_blank">USB splitter</a>  
* *<a href="https://www.aliexpress.com/item/1005002861310912.html?spm=5261.ProductManageOnline.0.0.419d4edf1s8xR0" target="_blank">HMDI to CSI board</a>

## 6.謝辞

BLIKVMはたくさんの素晴らしいオープンソースプロジェクトにより支えられています。特に重要なものは下記のプロジェクトです。
* <a href="https://github.com/pikvm/pikvm" target="_blank">pikvm</a>
