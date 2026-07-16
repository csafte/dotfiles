$spinner = @('|', '/', '-', '\')
for ($i = 0; $i -lt 20; $i++)
{
  foreach ($char in $spinner)
  {
    Write-Host -NoNewline "`r작업 진행 중 $char"
    Start-Sleep -Milliseconds 100
  }
}

#scoop download

Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression

if(Test-Path ".\scoop\scooplist.json")
{
  scoop import .\scoop\scooplist.json
} else
{
  Write-Host "scooplist.json not found."
}


