nvm use 12
# Set the error preference to stop the script on any command failure
$ErrorActionPreference = 'Stop'

# Save the current working directory
$originalLocation = Get-Location

# Change directory to the parent directory of the script's directory
Set-Location (Join-Path $PSScriptRoot "..")

try {
    # Define a function to execute a command and check if it was successful
    function Invoke-HexoCommand {
        param(
            [string]$Command
        )
        Write-Host "Executing command: $Command" -ForegroundColor Cyan
        Invoke-Expression $Command
    }

    # Execute Hexo commands
    Invoke-HexoCommand "hexo clean"
    Invoke-HexoCommand "hexo g --silent"
    Invoke-HexoCommand "hexo d"

    # Print the new working directory to confirm
    Write-Host "Current working directory is now: $(Get-Location)"
    # Command execution completed message
    Write-Host "Hexo site cleaning, generation, and deployment completed." -ForegroundColor Green -BackgroundColor Gray
} catch {
    # Handle exceptions here if needed
    Write-Host "An error occurred: $_" -ForegroundColor Red -BackgroundColor Gray
} finally {
    # Restore the original working directory
    Set-Location $originalLocation
    Write-Host "Returned to the original directory: $originalLocation"
}