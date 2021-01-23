$ErrorActionPreference = 'Stop';

$packageName= 'formatfactory'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = 'http://public.pcfreetime.com/FFSetup5.6.0.0.exe'
  softwareName  = 'formatfactory*'
  checksum      = 'e981b8f7f838401d38b0c308a3b62a495d0a533b057491138064497a82dfac3a'
  checksumType  = 'sha256'
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
