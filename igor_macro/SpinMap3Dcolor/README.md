
<h3>Igor の SpinMap 作成と 3D color scale (2023.02.16. 更新)</h3>

<h3>1. Spin マップで取得した 1D ファイルの読み込み</h3>
<ul>
<li>練習用に Bi2Te3 の DAmapping データを用意しました。</li>
<li><a href = "[https://hiroshimauniv-my.sharepoint.com/:u:/g/personal/kk224_hiroshima-u_ac_jp/EeDX6S0jrP9Fq0XxTMo-OxoBbRfsM56uVXczkvj_6gV9zA?e=KLwS1i](https://hiroshimauniv-my.sharepoint.com/:u:/g/personal/kk224_hiroshima-u_ac_jp/EQqBF1VpUotCtRTtvsuZyFYBQzJtYs0sZp752itqqr6zYw?e=Lea4zV)" target="_blank">ここ</a>から手に入れられます。</li></ul>

<h3>2. a2Dtoa3D.ipf を igor に入れてコンパイル</h3>
<ul>
<li>WaveList（フォルダー内にあるデータの文字列リストを作成）を使う。</li>
<li>a2Dto3D() を実行。</li>
<li>FS マップの角度を入力する。(-15 deg から 0.2 deg ステップ)</li>
</ul>

<h3>3. 3D データ</h3>
<ul> 
<li>vol という名前で生成される。</li>
<li><a href = "https://hiroshimauniv-my.sharepoint.com/:v:/g/personal/kk224_hiroshima-u_ac_jp/EW_wHPQqMtJFqS6kOauJFZoBfQ0iL2_-HXxPUbpF4caZHQ?e=gVxasr" target="_blank">例</a>を示す</li>
  
<h3>(補足) 3D データを<a href ="https://github.com/Hikaribussei-lab/homepage/tree/main/igor_macro/%E5%8B%95%E7%94%BB%E4%BD%9C%E6%88%90FS" target="_blank">動画</a>で見せる。</h3>
</ul>