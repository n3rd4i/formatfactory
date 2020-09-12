$ErrorActionPreference = 'Stop';

$packageName= 'formatfactory'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = 'http://public.pcfreetime.com/FFSetup5.4.5.1.exe'
  softwareName  = 'formatfactory*'
  checksum      = '58774f8a96156028f0364c2321cb753c57e03f7f2a306fbbd213bf0b5f00f8f1'
  checksumType  = 'sha256'
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
