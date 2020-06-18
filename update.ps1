import-module au

$domain   = 'http://www.pcfreetime.com'
$releases = "$domain/formatfactory/index.php?language=en"

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*url\s*=\s*)('.*')"          = "`$1'$($Latest.URL32)'"
      "(?i)(^\s*checksum\s*=\s*)('.*')"   	= "`$1'$($Latest.Checksum32)'"
    }
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing #1
  $regex   = '.exe$'
  $url     = $download_page.links | ? href -match $regex | select -First 1 -expand href #2
  $token = $url -split 'FFSetup' | select -First 1 -Skip 1 #3
  $version = $token -split '.exe' | select -Last 1 -Skip 1 #3
  return @{ Version = $version; URL32 = $url }
}

update -ChecksumFor 32
