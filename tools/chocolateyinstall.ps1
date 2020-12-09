$ErrorActionPreference = 'Stop';

$packageName= 'formatfactory'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = 'http://public.pcfreetime.com/FFSetup5.5.0.1.exe'
  softwareName  = 'formatfactory*'
  checksum      = 'b9ce06dbee8fecce2d815d6325a28266f8984f5241f0cbab9243fe07ef47bff1'
  checksumType  = 'sha256'
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
