$spinner = @('|', '/', '-', '\')
for ($i = 0; $i -lt 20; $i++)
{
  foreach ($char in $spinner)
  {
    Write-Host -NoNewline "`r작업 진행 중 $char"
    Start-Sleep -Milliseconds 100
  }
}

if (Test-Path "$HOME\.glzr")
{
  if (Test-Path "$HOME\.glzr-backup")
  {
    Remove-Item -Path "$HOME\.glzr-backup" -Recurse -Force
    Write-Host "`n기존 백업 삭제됨"
  }
    
  Rename-Item -Path "$HOME\.glzr" -NewName ".glzr-backup"

  New-Item -ItemType SymbolicLink -Path "$HOME\.glzr" -Target $PSScriptRoot -Force
  Write-Host "`n심볼릭 링크 생성 완료"
} else
{
  Write-Host "`n.glzr을 찾을 수 없음"
}

