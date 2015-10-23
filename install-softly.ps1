$reporaw = "https://raw.githubusercontent.com/JamesB797/Softly/master/"
$repo = "https://github.com/JamesB797/Softly.git"

function install-if-missing {

    ForEach ($command in $args) {

        if (-not (Get-Command $command -ErrorAction SilentlyContinue)) {

            Invoke-Expression (Invoke-WebRequest $reporaw + "install-$command.ps1")
        } 
    }
}

install-if-missing("git", "salt")