# Chag

## 使い方
* ディレクトリを設置して、shell script を用意します。

```
#!/bin/sh
ruby ~/bin/chag_core/"${0##*/}" "$@"
```

* 画像フォルダーに入って chag コマンドを動かします。
* 同階層にある全画像を問答無用で加工します。

```
$ cd images
$ chag resize 800 800
```

#### チャグまるコマンドで出来ることの一覧
```
$ chag
or
$ chag help
```

#### 指定した幅と高さにリサイズする
* [width] [height] [rename] [filesize] の順序で指定します。
* [幅] [高さ] でリサイズします。
* [reaname]をtrueにするとリサイズ情報を加えたリネームをします。
* [filesize]をtrueにすると200k以下になるまで画質を落とします。

```
$ chag resize 800 800
```

#### チャグまる印を自動的に付ける
* 元画像名] [rename] [filesize]の順序で指定します。
* チャグ丸印を右上に合成します。 [reaname]をtrueにするとmarkを加えたリネームをします。
* [filesize]をtrueにすると200k以下になるまで画質を落とします。

```
$ chag mark image.jpeg
```

#### 合成画像を右上に合成します。
* [元画像名] [合成画像名] [rename] [filesize] の順序で指定します。
```
$ chag composite image_org.jpeg add_image.jpeg
```

#### 指定した幅と高さにクロップします。
```
$ chag crop 800 800
```

### 指定した幅と高さに収まるように同じ比率でリサイズします。

```
$ chag fit 800 500
```







```
$ chag resize 800 800
$ chag fit 200 300
$ chag crop 100 100
$ chag composite origin dist comp
$ chag mark origin marked_img
```
