
<h3>Igor の 3D kz 変換方法 (2023.02.14. 更新)</h3>

<h3>1. hn マップで取得した 3D ファイルの読み込み</h3>
<ul>
<li>練習用に黒リンの hn3D データを用意しました。</li>
<li><a href = "https://hiroshimauniv-my.sharepoint.com/:u:/g/personal/kk224_hiroshima-u_ac_jp/EfNhkn0xt4NDpWm0I7codEsBVOGR2sw0Ae1jq8-MsvEvGg?e=fhae0L" target="_blank">ここ</a>から手に入れられます。</li></ul>

<h3>2. hn-angleTokz-kx.ipf を igor に入れてコンパイル</h3>
<ul>
<li>1 で読み込んだ hn3Dデータに加えて, 各 hn の情報が入った 1D wave を用意する。</li>
<li>例: 400 eV から 4eV ずつ増加して 800 eV まで (合計 101 点，hn3D データの z 軸の点数に一致させる)。</li>
<li>kz_vol() を実行。</li>
<li>hn3Dmap, EF の wave を選択.</li>
<li>内部ポテンシャル (v), 仕事関数，kz の刻み間隔を入力。</li>
<li>polar は, 表面ノーマルに対応する angle 位置 (例：6.15 deg)。</li>
</ul>

<h3>3. 完成した kz-kx 3Dmap</h3>
<ul> 
//<li><a href = "https://hiroshimauniv-my.sharepoint.com/:v:/g/personal/kk224_hiroshima-u_ac_jp/EW_wHPQqMtJFqS6kOauJFZoBfQ0iL2_-HXxPUbpF4caZHQ?e=gVxasr" target="_blank">例</a>を示す</li>
</ul>
