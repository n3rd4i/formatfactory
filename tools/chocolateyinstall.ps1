$ErrorActionPreference = 'Stop';

$packageName= 'formatfactory'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = 'http://public.pcfreetime.com/FFSetup5.4.0.0.exe'
  softwareName  = 'formatfactory*'
  checksum      = 'be74acdf4f762161945d0eb9c9ab1ce1b8b6d9fbb2f474990a2bbad4d926b041'
  checksumType  = 'sha256'
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
