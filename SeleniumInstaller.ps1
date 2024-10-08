$SystemDrive = (Get-WmiObject Win32_OperatingSystem).SystemDrive
mkdir $SystemDrive\Selenium
Install-Module -Force Selenium
$EdgeEXE = Get-Item "$SystemDrive\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
$EdgeVersion = $EdgeEXE.VersionInfo.FileVersion
$WebClient = New-Object System.Net.WebClient
$WebClient.DownloadFile("https://msedgedriver.azureedge.net/$EdgeVersion/edgedriver_win64.zip","$SystemDrive\Selenium\edgedriver.zip")
Expand-Archive -Path $SystemDrive\Selenium\edgedriver.zip -DestinationPath $SystemDrive\Selenium
Remove-Item -Path "$SystemDrive\Program Files\WindowsPowerShell\Modules\Selenium\3.0.1\assemblies\MicrosoftWebDriver.exe"
Move-Item -Path "$SystemDrive\Selenium\msedgedriver.exe" "$SystemDrive\Program Files\WindowsPowerShell\Modules\Selenium\3.0.1\assemblies\MicrosoftWebDriver.exe"
