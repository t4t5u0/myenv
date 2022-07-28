set-alias vi 'C:\Program Files\Vim\Vim82\vim.exe'
set-alias vim 'C:\Program Files\Vim\Vim82\vim.exe' 
Set-Alias cargo 'C:\Users\ymmtr\.cargo\bin\cargo.exe'
Set-Alias rustup 'C:\Users\ymmtr\.cargo\bin\rustup.exe'

# ctrl -d でターミナルを抜ける
Import-Module PSReadLine
Set-PSReadlineKeyHandler -Key "Ctrl+d" -Function DeleteCharOrExit
Set-PSReadLineKeyHandler -Key "Ctrl+u" -Function BackwardDeleteLine
Set-PSReadLineKeyHandler -Key "Ctrl+k" -Function ForwardDeleteLine
Set-PSReadLineKeyHandler -Key "Ctrl+a" -Function BeginningOfLine
Set-PSReadLineKeyHandler -Key "Ctrl+e" -Function EndOfLine
Set-PSReadLineKeyHandler -Key "Ctrl+f" -Function ForwardChar
Set-PSReadLineKeyHandler -Key "Ctrl+b" -Function BackwardChar
Set-PSReadLineKeyHandler -Key "Alt+f" -Function NextWord
Set-PSReadLineKeyHandler -Key "Alt+b" -Function BackwardWord
Set-PSReadLineKeyHandler -Key "Ctrl+p" -Function PreviousHistory
Set-PSReadLineKeyHandler -Key "Ctrl+n" -Function NextHistory

# Zsh like completion
Set-PSReadLineKeyHandler -Key "Tab" -Function MenuComplete

Import-Module posh-git

$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}


function which ($command) {
    Get-command -Name $command -ShowCommandInfo | Format-List -Property Definition
}

# pip powershell completion start
if ((Test-Path Function:\TabExpansion) -and -not `
    (Test-Path Function:\_pip_completeBackup)) {
    Rename-Item Function:\TabExpansion _pip_completeBackup
}
function TabExpansion($line, $lastWord) {
    $lastBlock = [regex]::Split($line, '[|;]')[-1].TrimStart()
    if ($lastBlock.StartsWith("C:\Users\ymmtr\AppData\Local\Microsoft\WindowsApps\PythonSoftwareFoundation.Python.3.10_qbz5n2kfra8p0\python.exe -m pip ")) {
        $Env:COMP_WORDS=$lastBlock
        $Env:COMP_CWORD=$lastBlock.Split().Length - 1
        $Env:PIP_AUTO_COMPLETE=1
        (& C:\Users\ymmtr\AppData\Local\Microsoft\WindowsApps\PythonSoftwareFoundation.Python.3.10_qbz5n2kfra8p0\python.exe -m pip).Split()
        Remove-Item Env:COMP_WORDS
        Remove-Item Env:COMP_CWORD
        Remove-Item Env:PIP_AUTO_COMPLETE
    }
    elseif (Test-Path Function:\_pip_completeBackup) {
        # Fall back on existing tab expansion
        _pip_completeBackup $line $lastWord
    }
}
# pip powershell completion end

$HYPER_CONFIG ="C:\Users\ymmtr\AppData\Roaming\Hyper\.hyper.js"
$STARSHIP_CONFIG = "C:\Users\ymmtr\.config\starship.toml"

Import-Module DockerCompletion

Invoke-Expression -Command $(gh completion -s powershell | Out-String)

Invoke-Expression (&starship init powershell)
