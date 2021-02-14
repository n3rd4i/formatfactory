$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

# 1. Download bundle
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileFullPath  = "$(Join-Path $ENV:TEMP 'FFSetup.exe')"
  url           = 'http://public.pcfreetime.com/FFSetup5.6.5.0.exe'
  checksum      = '4303a38b00d67ce37c47f5a7b3bd9fe2a8996d373e79f6975c60e96d3d8a2476'
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
