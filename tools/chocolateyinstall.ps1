$ErrorActionPreference = 'Stop';

$packageName= 'formatfactory'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = 'http://public.pcfreetime.com/FFSetup5.3.0.1.exe'
  softwareName  = 'formatfactory*'
  checksum      = 'aed8e4ac70702ff1dd89e654d7182598cd1b75177c4c9063f8de8ae4e2de57c5'
  checksumType  = 'sha256'
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
