Start-Process "dmmgameplayer://umamusume/cl/general/umamusume"


$stime = 10;
$punished = 0;
$fail = 1;

Start-Sleep -Seconds $stime;

while($punished -lt 1){
# �E�}���̃v���Z�X���擾�o������DMMGameplayer���I��������
    if((Get-Process | Out-String -Stream | Select-String -Pattern "umamusume" | Measure-Object).Count -ge 1){
        $buf = Get-WmiObject Win32_Process -Filter "Name = 'DMMGamePlayer.exe'"
        $buf.Terminate();
        $punished = 1;
    }elseif($fail -gt 10){
    echo "�N�����s�B�X�N���v�g���I�����܂��B"
    exit;
    }else{
    echo "$fail ��ڂ̋N���Ɏ��s�B�b��ɍĎ��s���܂�..."
    Start-Sleep -Seconds $stime;
    }
}