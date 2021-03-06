
<!-- README.md is generated from README.Rmd. Please edit that file -->

# krikinton <a href='https://paithiov909.github.io/krikinton'><img src='https://rawcdn.githack.com/paithiov909/krikinton/031b830d9e24fef6acc7113d61ba41308a54b0ec/man/figures/logo.png' align="right" height="139" /></a>

<!-- badges: start -->

[![GitHub last
commit](https://img.shields.io/github/last-commit/paithiov909/krikinton)](#)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![GitHub
license](https://img.shields.io/github/license/paithiov909/krikinton)](https://github.com/paithiov909/krikinton/blob/main/LICENSE)
<!-- badges: end -->

> rJava wrapper of
> [Sudachi](https://github.com/WorksApplications/Sudachi) and
> [Kintoki](https://github.com/WorksApplications/kintoki) (a port of the
> CaboCha to Java)

## System Requirements

-   Java (&gt;= 1.8.0)

Installing this package also requires Git LFS, because of its including
quite heavy (&gt; 270MB) binary files.

## Usage

### Installation

``` r
remotes::install_github("paithiov909/krikinton")
```

### Use Sudachi

``` r
krikinton::sudachi(c(
  "なぜ分かり合えないのか！？",
  "なぜ貴様等は他を出し抜こうとするのか！？",
  "ところできのこはあんな縦に長かったか！？"
))
#> # A tibble: 32 x 12
#>    sentence_id Surface   Reading  Normalized Original  POS1   POS2   POS3  POS4 
#>          <int> <chr>     <chr>    <chr>      <chr>     <chr>  <chr>  <chr> <chr>
#>  1           1 なぜ      ナゼ     何故       なぜ      副詞   <NA>   <NA>  <NA> 
#>  2           1 分かり合~ ワカリ~  分かり合う 分かり合~ 動詞   一般   <NA>  <NA> 
#>  3           1 ない      ナイ     ない       ない      助動詞 <NA>   <NA>  <NA> 
#>  4           1 の        ノ       の         の        助詞   準体~  <NA>  <NA> 
#>  5           1 か        カ       か         か        助詞   終助詞 <NA>  <NA> 
#>  6           1 ！        キゴウ   ！         !         補助~  句点   <NA>  <NA> 
#>  7           1 ？        キゴウ   ？         ？        補助~  句点   <NA>  <NA> 
#>  8           2 なぜ      ナゼ     何故       なぜ      副詞   <NA>   <NA>  <NA> 
#>  9           2 貴様      キサマ   貴様       貴様      代名詞 <NA>   <NA>  <NA> 
#> 10           2 等        トウ     等         等        接尾辞 名詞的 一般  <NA> 
#> # ... with 22 more rows, and 3 more variables: X5StageUse1 <chr>,
#> #   X5StageUse2 <chr>, isOOV <lgl>
```

### Use Kintoki

``` r
krikinton::kintoki(c(
  "とにかく不様、そんな事ではあの小娘には勝てないわ。",
  "そう、皆で協力して挑むのだ！",
  "えー、まぁ今回はその件で伺いました。"
))
#> # A tibble: 38 x 14
#>    sentence_id chunk_id  Link  Score  Head  Func token_id Surface  POS1   POS2  
#>          <int>    <int> <int>  <dbl> <int> <int>    <int> <chr>    <chr>  <chr> 
#>  1           1        0     6 -2.18      0     0        0 とにかく 副詞   <NA>  
#>  2           1        1     3  0.190     0     0        0 不様     名詞   普通~ 
#>  3           1        1     3  0.190     0     0        1 、       補助~  読点  
#>  4           1        2     3  1.60      0     0        0 そんな   連体詞 <NA>  
#>  5           1        3     6 -2.18      0     2        0 事       名詞   普通~ 
#>  6           1        3     6 -2.18      0     2        1 で       助詞   格助詞
#>  7           1        3     6 -2.18      0     2        2 は       助詞   係助詞
#>  8           1        4     5  0.915     0     0        0 あの     感動詞 フィ~ 
#>  9           1        5     6 -2.18      0     2        0 小娘     名詞   普通~ 
#> 10           1        5     6 -2.18      0     2        1 に       助詞   格助詞
#> # ... with 28 more rows, and 4 more variables: POS3 <chr>, POS4 <chr>,
#> #   X5StageUse1 <chr>, X5StageUse2 <chr>
```

## Disclaimers

This software is redistributing model files originally included in
[CaboCha](https://taku910.github.io/cabocha/). However, any of MIT
license, Apache License, LGPL, and new BSD license are NOT applied to
these models.

> 付属のモデルファイル(model 以下のファイル)にはBSDライセンス
> は適用されません。BSDライセンス は,
> 付属のプログラムや学習ツールのソース・コード,
> ドキュメントのみに適用されます。
>
> 付属のモデルファイルは, 株式会社毎日新聞社の御厚意により
> 配布されている毎日新聞記事CD-ROM版を基に学習,
> 作成されたものです。付属のモデルファイルは,
> 毎日新聞データ使用許諾に関する覚書に記載の利用条件内で その使用及び,
> 複製，改変，頒布が認められます.
> そのため配布しているモデルをそのままの形で使うことは, 研究目的,
> 個人利用に限られます. 誤解ないように言っておくと, これは, CaboCha
> の利用が研究目的に限定されていることを意味しません。
> ご自身で用意なさったコーパスを基に, 独自にモデルを学習,
> 作成した場合は研究目的以外の利用が可能です。
>
> 奈良先端科学技術大学院大学ならびに工藤 拓は, CaboCha のプログラム
> 及び付属のモデルファイルの保証, および特定目的の適合性の保証を含め
> いかなる保証をも行うものではなく， CaboCha のプログラム
> 及び付属のモデルを使用，複製，改変，頒布により生じた損害や賠償等については，
> 法律上の根拠を問わず一切責任を負いません. ご注意ください。
>
> 将来的には, 著作権やライセンス上の問題から,
> モデルファイルとプログラムを分割 して配布する予定です。

As referred here, you can use these model files for only
research/private use with your own responsibility. For commercial use,
you must prepare your original model files so as to use this software.

## License

MIT license.

This software includes works licensed under [the Apache License,
Version2.0](http://www.apache.org/licenses/LICENSE-2.0.html).

Icons made by [Freepik](https://www.freepik.com) from
[www.flaticon.com](https://www.flaticon.com/).
