$ErrorActionPreference = 'Stop';

$packageName= 'formatfactory'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = 'http://www.pcfreetime.com/public/FFSetup5.2.1.0.exe'
  softwareName  = 'formatfactory*'
  checksum      = 'FBA9288B9216722D8AD51BBEBF1B12C49E979E7B2AFBCD11E2A6BA1DA0384F02'
  checksumType  = 'sha256'
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
