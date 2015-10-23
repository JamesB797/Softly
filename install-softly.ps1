$repo = "https://raw.githubusercontent.com/JamesB797/Softly/master/"

if (-not (Get-Command "git" -ErrorAction SilentlyContinue)) {
    Invoke-Expression (Invoke-WebRequest $repo + "install-git.ps1")
} 

$listinglink = "https://repo.saltstack.com/windows/"

$listing = Invoke-WebRequest $listinglink

$relativelink = echo $listing.Links | Where {$_.href -like "*AMD64*" -and $_.href -notlike "*md5"} | Select -Last 1

$absolutelink = $listinglink + $relativelink.href

Invoke-WebRequest $absolutelink -OutFile ("~/" + $relativelink.href)