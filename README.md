# Chag

## 使い方
* ディレクトリを設置して、shell script を用意します。

```
#!/bin/sh
ruby ~/bin/chag_core/"${0##*/}" "$@"
```

* 画像フォルダーに入って chag コマンドを動かします。
 * 同階層にある全画像を加工。
 * リサイズ、フィット、クロップ、 マーク合成。
 * ファィルサイズを制限。

```
$ chag resize 800 800
$ chag fit 200 300
$ chag crop 100 100
$ chag composite origin dist comp
$ chag mark origin marked_img
```
