
<h3>Igor の動画作成方法 (waves 編) (2023.02.11. 更新)</h3>

<h3>1. FS マップで取得した 2D ファイルの読み込み</h3>
<ul>
<li>練習用に Bi2Te3 の DAmapping データを用意しました。</li>
<li><a href = "https://hiroshimauniv-my.sharepoint.com/:u:/g/personal/kk224_hiroshima-u_ac_jp/EeDX6S0jrP9Fq0XxTMo-OxoBbRfsM56uVXczkvj_6gV9zA?e=KLwS1i" target="_blank">ここ</a>から手に入れられます。</li></ul>

<h3>2. a2Dtoa3D.ipf を igor に入れてコンパイル</h3>
<ul>
<li>NewMovie コマンドを使用する。</li>
<li>movie_vwv(vwv) (vwv は 3D FS マップのデータをフルパスで入れる)を実行。</li>
<li>画像が出てきて，doUpdate, AddMovieFrame で一枚ごとフレームを取り込んでいく。</li>
<li>NewMovie/Z/F=30 as NameOfWave(vwv) → フレームを変えたい場合は /F フラッグの値を変えればよい。</li>
<li>CloseMovie で動画ファイル化。</li>
</ul>

<h3>3. 完成した動画</h3>
<ul> 
<li>mp4 で出力される</li>
<li><a href = "https://hiroshimauniv-my.sharepoint.com/:v:/g/personal/kk224_hiroshima-u_ac_jp/EW_wHPQqMtJFqS6kOauJFZoBfQ0iL2_-HXxPUbpF4caZHQ?e=gVxasr" target="_blank">例</a>を示す</li>
</ul>
