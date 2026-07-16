$spinner = @('|', '/', '-', '\')
for ($i = 0; $i -lt 20; $i++)
{
  foreach ($char in $spinner)
  {
    Write-Host -NoNewline "`r작업 진행 중 $char"
    Start-Sleep -Milliseconds 100
  }
}

if(Test-Path "$HOME\.gitconfig")
{
  if (Test-Path "$HOME\.gitconfig-backup")
  {
    Remove-Item -Path "$HOME\.gitconfig-backup" -Recurse -Force
    Write-Host "`n기존 백업 삭제됨"
  }
  Rename-Item -Path "$HOME\.gitconfig" -NewName ".gitconfig-backup"
  New-item -ItemType SymbolicLink -Path "$HOME\.gitconfig" -Target "$PSScriptRoot\.gitconfig"
  
  Write-Host "`n심볼릭 링크 생성"
} else
{
  Write-Host "`n.gitconfig 를 찾을 수 없음"
}
