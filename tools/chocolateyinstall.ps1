$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

# 1. Download bundle
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileFullPath  = "$(Join-Path $ENV:TEMP 'FFSetup.exe')"
  url           = 'http://public.pcfreetime.com/FFSetup5.6.0.0.exe'
  checksum      = 'e981b8f7f838401d38b0c308a3b62a495d0a533b057491138064497a82dfac3a'
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
