# build solution

$rep = Get-Location

Set-Location /mnt/c/TFS/orbital-shell/
Write-Host "launching orbsh ..."
dotnet run --no-build --no-restore --project OrbitalShell-CLI\OrbitalShell-CLI.csproj -v n

Set-Location $rep
