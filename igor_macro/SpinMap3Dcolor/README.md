
<h3>Igor の SpinMap 作成と 3D color scale (2023.02.16. 更新)</h3>

<h3>1. Spin マップで取得した 1D ファイルの読み込み</h3>
<ul>
<li>練習用に Bi2Te3 の DAmapping データを用意しました。</li>
<li><a href = "https://hiroshimauniv-my.sharepoint.com/:u:/g/personal/kk224_hiroshima-u_ac_jp/EQqBF1VpUotCtRTtvsuZyFYBQzJtYs0sZp752itqqr6zYw?e=Lea4zV" target="_blank">ここ</a>から手に入れられます。</li></ul>

<h3>2.SpinMap_3Dcolor.ipf を igor に入れてコンパイル</h3>
<ul>
<li>SpinMap()=>スピン分解からグラフ化まで動作する main function。</li>
<li>color3D_test()=>3D color map の RGB データを作成。</li>
<li>make_color3D_table()=>3D color table の RGB データを作成。</li>
<li>color_map()=>3D カラーで表示した画像作成。</li>
<li>実行方法：SpinMap()を実行して，マッピングの角度情報，スピンチャンネル，シャーマン関数の値を入れる。</li>
<li>1. の練習用データの場合は，-15 deg から 15 deg まで 0.5 deg ステップ, シャーマン関数 0.3 </li>
</ul>

<h3>3. 出力データ</h3>
<ul> 
<li>matrgb => スピンマップの RGB ３次元データ(各 1,2, 3 layer はそれぞれ，R:赤，G:緑, B:青) </li>
<li>color_table => スピンマップで使用し 3D カラーテーブル</li>
<li><a href = "https://hiroshimauniv-my.sharepoint.com/:v:/g/personal/kk224_hiroshima-u_ac_jp/EW_wHPQqMtJFqS6kOauJFZoBfQ0iL2_-HXxPUbpF4caZHQ?e=gVxasr" target="_blank">例</a>を示す</li>
  
</h3>
</ul>
