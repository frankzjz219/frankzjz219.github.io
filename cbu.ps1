# Set the error preference to stop the script on any command failure
$ErrorActionPreference = 'Stop'

# Set the current directory to the script's root directory
$PSScriptRoot = Split-Path -Parent -Path $MyInvocation.MyCommand.Definition
Set-Location $PSScriptRoot

# Define a function to execute a command and check if it was successful
function Invoke-HexoCommand {
    param(
        [string]$Command
    )
    Write-Host "Executing command: $Command" -ForegroundColor Cyan
    try {
        Invoke-Expression $Command
    } catch {
        Write-Host "Error: Command execution failed - $Command" -ForegroundColor Red
        Write-Host "Exception details: $_" -ForegroundColor Red
        exit 1
    }
}

# Execute Hexo commands
Invoke-HexoCommand "hexo clean"
Invoke-HexoCommand "hexo g"
Invoke-HexoCommand "hexo d"

# 打印当前脚本的根目录路径
Write-Host "The script root directory is: $PSScriptRoot"
Write-Host "Hexo site cleaning, generation, and deployment completed." -ForegroundColor Green -BackgroundColor White