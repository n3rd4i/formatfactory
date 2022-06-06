$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

# 1. Download bundle
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileFullPath  = "$(Join-Path $ENV:TEMP 'FFSetup.exe')"
  url           = 'http://public.pcfreetime.com/FFSetup5.11.0.0.exe'
  checksum      = '54207bd56669bff853a7d7cb99d2aee971de86d75293893cad5acbb4eabdb745'
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
  file          = "$(Join-Path $folderPath "GenericSetup.exe")"
  softwareName  = 'formatfactory*'
  silentArgs   = '/S'
  validExitCodes= @(0, 3010, 1641)
}
Install-ChocolateyInstallPackage @packageArgs
