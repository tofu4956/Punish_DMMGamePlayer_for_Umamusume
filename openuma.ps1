Start-Process "dmmgameplayer://umamusume/cl/general/umamusume"

$stime = 10;
$punished = 0;
$fail = 1;

Start-Sleep -Seconds $stime;

while($punished -lt 1){
# ウマ娘のプロセスが取得出来たらDMMGameplayerを終了させる
    if((Get-Process | Out-String -Stream | Select-String -Pattern "umamusume" | Measure-Object).Count -ge 1){
        $buf = Get-WmiObject Win32_Process -Filter "Name = 'DMMGamePlayer.exe'"
        $buf.Terminate();
        echo "Punished!!!!!!!!!!!!!!!!!!!!!!!!"
        $punished = 1;
    }elseif($fail -gt 10){
    # 10回で失敗判定
    echo "起動失敗。スクリプトを終了します。"
    exit;
    }else{
    echo "$fail 回目の実行に失敗。$stime 秒後に再実行します..."
    $fail++;
    Start-Sleep -Seconds $stime;
    }
}