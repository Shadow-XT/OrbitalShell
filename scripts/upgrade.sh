# Install upgrade-assistant if not installed
if ! command -v upgrade-assistant &> /dev/null
then
    dotnet tool install -g upgrade-assistant
fi

# list all projects in the current directory and subdirectories
projects=$(find . -name "*.csproj")

# upgrade all projects to .NET 8.0 and log the output
logsDir="upgrade-assistant.log"
echo "== $(date) =========================================================================" >> $logsDir

for project in $projects
do
    echo "================================================================="
    echo "Upgrade Project $(echo $project | cut -d'/' -f2)"
    out=$(upgrade-assistant upgrade $project --non-interactive --operation Inplace --targetFramework net9.0)
    echo "$out" >> $logsDir
    result=$(echo "    $out" | tail -n 1)
    echo "    $result"
done
echo "================================================================="