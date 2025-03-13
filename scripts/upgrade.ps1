# Install upgrade-assistant if not installed
if (-not (Get-Command upgrade-assistant -ErrorAction SilentlyContinue)) {
    dotnet tool install -g upgrade-assistant
}

# list all projects in the current directory and subdirectories
$projects = Get-ChildItem -Recurse -Filter "*.csproj" | ForEach-Object { $_.FullName }

# upgrade all projects to .NET 8.0 and log the output
$logsDir = "upgrade-assistant.log"
"== $((Get-Date).ToString()) =========================================================================" >> $logsDir

foreach ($project in $projects) {
    Write-Host "================================================================="
    Write-Host "Upgrade Project $($project.Split('\')[-2])"
    $out = upgrade-assistant upgrade $project --non-interactive --operation Inplace --targetFramework net9.0
    $out >> $logsDir
    $result =  $($out -split "`n")[-1]
    Write-Host "    $result"
}
Write-Host "================================================================="
