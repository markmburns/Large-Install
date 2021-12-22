<# 
    Large-Install-Template-pt2.ps1
    mark.burns@dell.com

    Use 7z to split large files into multiple pieces, and Win32 dependencies to recompile them locally before execution.

    Install command: powershell.exe -executionpolicy bypass -file Large-Install-Template-pt2.ps1
    Uninstall command: powershell.exe Remove-Item -Path 'C:\Dell\Dellpic.jpg' -force
    Detection Rule: C:\Dell\Dellpic.jpg

#>

#Copy .002
Write-Output "Copying split 7z pt2"
Copy-Item -Path "$($PSScriptRoot)\Large-Install-Template" -Destination "$($env:HOMEDRIVE)\Dell\" -Recurse -Force


#Copy 7z
Write-Output "Copying 7z"
Copy-Item -Path "$($PSScriptRoot)\7z.dll" -Destination "$($env:HOMEDRIVE)\Dell\Large-Install-Template\7z.dll" -Force
Copy-Item -Path "$($PSScriptRoot)\7z.exe" -Destination "$($env:HOMEDRIVE)\Dell\Large-Install-Template\7z.exe" -Force


#Extract
Write-Output "Extracting 7z"
Start-Process -FilePath "$($env:HOMEDRIVE)\Dell\Large-Install-Template\7z.exe" -ArgumentList "e -y Large-Install-Template.7z.001" -WorkingDirectory "$($env:HOMEDRIVE)\Dell\Large-Install-Template\" -Wait


#Install
Write-Output "Running install"
Start-Process -FilePath "$($env:HOMEDRIVE)\Dell\Large-Install-Template\install.cmd" -Wait


#Clean-up
Write-Output "Removing temporary files"
Remove-Item "$($env:HOMEDRIVE)\Dell\Large-Install-Template" -Recurse -Force