$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

# 1. Download bundle
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileFullPath  = "$(Join-Path $ENV:TEMP 'FFSetup.exe')"
  url           = 'http://public.pcfreetime.com/FFSetup5.9.0.0.exe'
  checksum      = '9b71c676d10fffe11ca2a5c8447ff55564d2c023c12014bef4e250e6bfff119d'
  checksumType  = 'sha256'
}
$filePath = Get-ChocolateyWebFile @packageArgs

# 2. Extract bundle
$packageArgs = @{
  fileFullPath  = "$filePath"
  destination   = "$(Join-Path $ENV:TEMP 'FFSetup')"
}
$folderPath = Get-ChocolateyUnzip @packageArgs

# 3. Install silent
$packageArgs = @{
  packageName   = $packageName
  fileType      = 'exe'
  file          = "$(Join-Path $folderPath "Carrier.exe")"
  softwareName  = 'formatfactory*'
  silentArgs   = '/S'
  validExitCodes= @(0, 3010, 1641)
}
Install-ChocolateyInstallPackage @packageArgs
