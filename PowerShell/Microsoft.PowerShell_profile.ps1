oh-my-posh init pwsh --config '~/Documents/PowerShell/amro.omp.json' | Invoke-Expression

Invoke-Expression (& { (zoxide init powershell | Out-String) })

Import-Module Zpin

function ll
{
  eza -la --icons --git @args
}

function la
{
  eza -a --icons
}

function lt
{
  param(
    [int]$Level = 2
  )
  eza --tree --level=$Level --icons
}

function touch
{
  param(
    [Parameter(ValueFromRemainingArguments)]
    [string[]]$Path
  )

  foreach ($file in $Path)
  {
    New-Item -ItemType File -Path $file -Force | Out-Null
  }
} 

function y
{
  $tmp = (New-TemporaryFile).FullName
  yazi.exe @args --cwd-file="$tmp"
  $cwd = Get-Content -Path $tmp -Encoding UTF8
  if ($cwd -and $cwd -ne $PWD.Path -and (Test-Path -LiteralPath $cwd -PathType Container))
  {
    Set-Location -LiteralPath (Resolve-Path -LiteralPath $cwd).Path
  }
  Remove-Item -Path $tmp
}


