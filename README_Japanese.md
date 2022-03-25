
# BLIKVM

# Compute Module 4 I/Oボード

# PiKVM アプリケーションボード

pikvm:https://github.com/pikvm/pikvm に対応したCM4を用いるハードウェアです。
このデバイスはサーバーやワークステーションのオペレーティングシステムに依存せずにリモート管理を行えます。サポート、FAQや最新情報を知るには <a href="https://discord.gg/9Y374gUF6C" target="_blank">BLIKVM Discodeコミュニティ</a>に参加してください。
購入はこちら：<a href="https://www.aliexpress.com/item/1005003262886521.html?spm=a2g0o.store_pc_allProduct.8148356.5.39cd62bejpZaWF" target="_blank">BLIKVM</a>

![](/images/physical_img/blikvm8.jpg)

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
* <a href="https://www.aliexpress.com/item/1005003262886521.html?spm=a2g0o.store_pc_allProduct.8148356.5.39cd62bejpZaWF" target="_blank">BLIKVM</a>  
* <a href="https://www.aliexpress.com/item/1005003761450893.html?spm=a2g0o.productlist.0.0.32da2b63A98QAp&algo_pvid=17cd48f6-7616-4128-9bb4-9246eb25bf1f&algo_exp_id=17cd48f6-7616-4128-9bb4-9246eb25bf1f-3&pdp_ext_f=%7B%22sku_id%22%3A%2212000027078368713%22%7D&pdp_pi=-1%3B29.03%3B-1%3B3.82%40salePrice%3BUSD%3Bsearch-mainSearch" target="_blank">ATX</a>  
* <a href="https://www.aliexpress.com/item/1005003793429781.html?spm=a2g0o.productlist.0.0.32da2b63A98QAp&algo_pvid=17cd48f6-7616-4128-9bb4-9246eb25bf1f&algo_exp_id=17cd48f6-7616-4128-9bb4-9246eb25bf1f-2&pdp_ext_f=%7B%22sku_id%22%3A%2212000027184842775%22%7D&pdp_pi=-1%3B5.01%3B-1%3B3.82%40salePrice%3BUSD%3Bsearch-mainSearch" target="_blank">USB splitter</a>  
* <a href="https://www.aliexpress.com/item/1005002861310912.html?spm=5261.ProductManageOnline.0.0.419d4edf1s8xR0" target="_blank">HMDI to CSI board</a>

## 6.謝辞

BLIKVMはたくさんの素晴らしいオープンソースプロジェクトにより支えられています。特に重要なものは下記のプロジェクトです。
* <a href="https://github.com/pikvm/pikvm" target="_blank">pikvm</a>
