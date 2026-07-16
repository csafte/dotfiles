$_ZPIN_FILE = "$HOME\.zpin_root"

function zpin
{
  param(
    [Parameter(Position=0)]
    [string]$Command = ""
  )

  switch ($Command)
  {

    # 현재 디렉토리를 임시 root 로 저장
    "save"
    {
      $PWD.Path | Out-File -FilePath $_ZPIN_FILE -Encoding utf8 -NoNewline
      Write-Host "📌 zpin saved: $($PWD.Path)" -ForegroundColor Cyan
      # zoxide 데이터베이스에도 등록
      zoxide add $PWD.Path
    }

    # 저장된 root 삭제
    "clear"
    {
      if (Test-Path $_ZPIN_FILE)
      {
        Remove-Item $_ZPIN_FILE
        Write-Host "🗑️  zpin cleared." -ForegroundColor Yellow
      } else
      {
        Write-Host "⚠️  저장된 zpin root 가 없습니다." -ForegroundColor Yellow
      }
    }

    # 저장된 경로 확인
    "show"
    {
      if (Test-Path $_ZPIN_FILE)
      {
        $target = Get-Content $_ZPIN_FILE -Raw
        Write-Host "📍 zpin root: $target" -ForegroundColor Cyan
      } else
      {
        Write-Host "⚠️  저장된 zpin root 가 없습니다." -ForegroundColor Yellow
      }
    }

    # 도움말
    { $_ -in "help", "--help", "-h" }
    {
      Write-Host ""
      Write-Host "Usage:" -ForegroundColor White
      Write-Host "  zpin save    현재 디렉토리를 임시 root 로 저장" -ForegroundColor Gray
      Write-Host "  zpin         저장된 root 로 이동" -ForegroundColor Gray
      Write-Host "  zpin show    저장된 root 경로 출력" -ForegroundColor Gray
      Write-Host "  zpin clear   저장된 root 삭제" -ForegroundColor Gray
      Write-Host ""
    }

    # 인자 없음 → 저장된 root 로 이동
    ""
    {
      if (-not (Test-Path $_ZPIN_FILE))
      {
        Write-Host "⚠️  저장된 zpin root 가 없습니다. 먼저 'zpin save' 를 실행하세요." -ForegroundColor Yellow
        return
      }

      $target = (Get-Content $_ZPIN_FILE -Raw).Trim()

      if (-not (Test-Path $target))
      {
        Write-Host "❌ 경로가 존재하지 않습니다: $target" -ForegroundColor Red
        Write-Host "   'zpin save' 로 새 경로를 저장하거나 'zpin clear' 로 초기화하세요." -ForegroundColor Red
        return
      }

      # zoxide 를 통해 이동 (방문 기록에도 반영됨)
      __zoxide_z $target
      Write-Host "✅ zpin → $target" -ForegroundColor Green
    }

    default
    {
      Write-Host "⚠️  알 수 없는 옵션: '$Command'" -ForegroundColor Yellow
      Write-Host "    'zpin help' 로 사용법을 확인하세요." -ForegroundColor Yellow
    }
  }
}

# 탭 자동완성 등록
Register-ArgumentCompleter -CommandName zpin -ParameterName Command -ScriptBlock {
  param(
    $commandName,
    $parameterName,
    $wordToComplete,
    $commandAst,
    $fakeBoundParameters
  )

  @("save", "clear", "show", "help") |
    Where-Object { $_ -like "$wordToComplete*" }
}

