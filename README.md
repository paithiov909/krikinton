
<!-- README.md is generated from README.Rmd. Please edit that file -->

# krikinton

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
<!-- badges: end -->

## About

krikinton is an rJava wrapper of
[WorksApplications/kintoki](https://github.com/WorksApplications/kintoki)
(a port of the CaboCha to Java).

:heavy\_exclamation\_mark: This package is quite heavy (\> 270MB)
because of including some binary files\!\!

## System Requirements

  - Java (\>= 1.8.0)

## Usage

``` r
# remotes::install_github("paithiov909/krikinton")
krikinton::kintoki("アニメは1人で作ってるんじゃ無いんだよ！アニメ制作はチームワークなんだ！")
#>    Sid Link     Score Head Func      Surface     POS1       POS2     POS3 POS4
#> 1    1    2  1.731140    0    1       アニメ     名詞   普通名詞     一般    *
#> 2    1    2  1.731140    0    1           は     助詞     係助詞        *    *
#> 3    1    2  3.290629    0    1          1人     名詞   普通名詞 副詞可能    *
#> 4    1    2  3.290629    0    1           で     助詞     格助詞        *    *
#> 5    1    4 -2.357497    4    7         作っ     動詞       一般        *    *
#> 6    1    4 -2.357497    4    7         てる   助動詞          *        *    *
#> 7    1    4 -2.357497    4    7           ん     助詞   準体助詞        *    *
#> 8    1    4 -2.357497    4    7         じゃ   助動詞          *        *    *
#> 9    1    4 -2.357497    4    7         無い   形容詞 非自立可能        *    *
#> 10   1    4 -2.357497    4    7           ん     助詞   準体助詞        *    *
#> 11   1    4 -2.357497    4    7           だ   助動詞          *        *    *
#> 12   1    4 -2.357497    4    7           よ     助詞     終助詞        *    *
#> 13   1    4 -2.357497    4    7           ！ 補助記号       句点        *    *
#> 14   1    4 -2.357497    1    2       アニメ     名詞   普通名詞     一般    *
#> 15   1    4 -2.357497    1    2         制作     名詞   普通名詞 サ変可能    *
#> 16   1    4 -2.357497    1    2           は     助詞     係助詞        *    *
#> 17   1   -1  0.000000    0    3 チームワーク     名詞   普通名詞     一般    *
#> 18   1   -1  0.000000    0    3           な   助動詞          *        *    *
#> 19   1   -1  0.000000    0    3           ん     助詞   準体助詞        *    *
#> 20   1   -1  0.000000    0    3           だ   助動詞          *        *    *
#> 21   1   -1  0.000000    0    3           ！ 補助記号       句点        *    *
#>    X5StageUse1   X5StageUse2
#> 1            *             *
#> 2            *             *
#> 3            *             *
#> 4            *             *
#> 5    五段-ラ行 連用形-促音便
#> 6  下一段-タ行   連体形-一般
#> 7            *             *
#> 8    助動詞-ダ   連用形-融合
#> 9       形容詞   連体形-一般
#> 10           *             *
#> 11   助動詞-ダ   終止形-一般
#> 12           *             *
#> 13           *             *
#> 14           *             *
#> 15           *             *
#> 16           *             *
#> 17           *             *
#> 18   助動詞-ダ   連体形-一般
#> 19           *             *
#> 20   助動詞-ダ   終止形-一般
#> 21           *             *
```

## Licenses

Distributed under the MIT license.

This software includes works licensed under [Apache License,
Version2.0](http://www.apache.org/licenses/LICENSE-2.0.html).

## Disclaimers

This software is re-distributing model files originally included in
[CaboCha](https://taku910.github.io/cabocha/). However, any of MIT
license, Apache License, LGPL, and new BSD license are NOT applied to
these models.

> 付属のモデルファイル(model 以下のファイル)にはBSDライセンス は適用されません。BSDライセンス は,
> 付属のプログラムや学習ツールのソース・コード, ドキュメントのみに適用されます。
> 
> 付属のモデルファイルは, 株式会社毎日新聞社の御厚意により 配布されている毎日新聞記事CD-ROM版を基に学習,
> 作成されたものです。付属のモデルファイルは,
> 毎日新聞データ使用許諾に関する覚書に記載の利用条件内で
> その使用及び, 複製，改変，頒布が認められます. そのため配布しているモデルをそのままの形で使うことは, 研究目的,
> 個人利用に限られます. 誤解ないように言っておくと, これは, CaboCha
> の利用が研究目的に限定されていることを意味しません。
> ご自身で用意なさったコーパスを基に, 独自にモデルを学習, 作成した場合は研究目的以外の利用が可能です。
> 
> 奈良先端科学技術大学院大学ならびに工藤 拓は, CaboCha のプログラム 及び付属のモデルファイルの保証,
> および特定目的の適合性の保証を含め いかなる保証をも行うものではなく，
> CaboCha のプログラム 及び付属のモデルを使用，複製，改変，頒布により生じた損害や賠償等については，
> 法律上の根拠を問わず一切責任を負いません. ご注意ください。
> 
> 将来的には, 著作権やライセンス上の問題から, モデルファイルとプログラムを分割 して配布する予定です。

As referred here, you can use these model files for only
research/private use with your own responsibility. For commercial use,
you must prepare your original model files so as to use this software.
