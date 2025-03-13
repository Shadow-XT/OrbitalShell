# build solution

$rep = Get-Location

Set-Location /mnt/c/TFS/orbital-shell/
dotnet build --no-restore ./OrbitalShell-Kernel-Commands/OrbitalShell-Kernel-Commands.csproj


# copy projects dll to CLI projects

# Copy-Item /mnt/c/TFS/orbital-shell/OrbitalShell-ConsoleApp/bin/Debug/net9.0/OrbitalShell-ConsoleApp.dll /mnt/c/TFS/orbital-shell/OrbitalShell-CLI/bin/Debug/net9.0/
# Copy-Item /mnt/c/TFS/orbital-shell/OrbitalShell-Kernel/bin/Debug/net9.0/OrbitalShell-Kernel.dll /mnt/c/TFS/orbital-shell/OrbitalShell-CLI/bin/Debug/net9.0/
Copy-Item /mnt/c/TFS/orbital-shell/OrbitalShell-Kernel-Commands/bin/Debug/net9.0/OrbitalShell-Kernel-Commands.dll /mnt/c/TFS/orbital-shell/OrbitalShell-CLI/bin/Debug/net9.0/
# Copy-Item /mnt/c/TFS/orbital-shell/OrbitalShell-UnitTests/bin/Debug/net9.0/OrbitalShell-UnitTests.dll /mnt/c/TFS/orbital-shell/OrbitalShell-CLI/bin/Debug/net9.0/
# Copy-Item /mnt/c/TFS/orbital-shell/OrbitalShell-WebAPI/bin/Debug/net9.0/OrbitalShell-WebAPI.dll /mnt/c/TFS/orbital-shell/OrbitalShell-CLI/bin/Debug/net9.0/

Set-Location $rep