$ErrorActionPreference = 'Stop';

$packageName= 'formatfactory'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'http://www.pcfreetime.com/public/FFSetup5.0.1.0.exe'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  softwareName  = 'formatfactory*'
  checksum      = 'EB94D789FF06AEAA834DB0809BB5BB8B1FEC718D12A48048D758148D12F1A67D'
  checksumType  = 'sha256'
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
