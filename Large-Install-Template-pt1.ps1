<# 
    Large-Install-Template-pt1.ps1
    mark.burns@dell.com

    Use 7z to split large files into multiple pieces, and Win32 dependencies to recompile them locally before execution.

    Install command: powershell.exe -executionpolicy bypass -file Large-Install-Template-pt1.ps1
    Uninstall command: powershell.exe Remove-Item -Path C:\Dell\Large-Install-Template\Large-Install-Template-pt1.tag
    Detection Rule: C:\Dell\Large-Install-Template\Large-Install-Template-pt1.tag

#>

#Copy .001
Write-Output "Copying split 7z pt1"
New-Item -Path "$($env:HOMEDRIVE)\Dell" -ItemType directory -Force
Copy-Item -Path "$($PSScriptRoot)\Large-Install-Template" -Destination "$($env:HOMEDRIVE)\Dell\" -Recurse -Force



#Detection
Write-Output "Copying pt1 tag"
"Large-Install-Template" | Out-File -FilePath "$($env:HOMEDRIVE)\Dell\Large-Install-Template\Large-Install-Template-pt1.tag"
